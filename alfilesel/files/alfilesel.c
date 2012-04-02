/* Simple liballegro based file selector helper utility.
 *
 * Copyright (C) 2011 David Kühling <dvdkhlng TA gmx TOD de>
 *
 * License: GPL3 or later, NO WARRANTY
 *
 * Created: Apr 2012
 */

#include <stdio.h>
#include <stdlib.h>
#include <getopt.h>

#include <allegro.h>
#include <loadpng.h>
#include <jpgalleg.h>


static int verbose_flag = 0;
static int run_flag = 0;
static int mouse_flag = 0;
static int help_flag = 0;

char * program_invocation_short_name;

static void print_help(const char *name) {
   const char *help = 
      "[OPTION]..."
      "Options:"
      "\t-t --title=STRING\n"
      "\t\tSet file selector dialog's title\n"
      "\t-w --wallpaper=FILENAME\n"
      "\t\tSet file to use as wallpaper (supports jpeg, png, pcx, bmp, tga)\n"
      "\t-p --path=PATH\n"
      "\t\tSet initial directory and/or filename\n"
      "\t-f --filter=STRING\n"
      "\t\tFilter files by extension and/or mode bits\n"
      "\t\tUse 'png;jpeg' to show only .png and .jpeg files, use '/+x' to\n"
      "\t\tonly show executable files etc.\n"
      "\t-m --mouse\n"
      "\t\tenable mouse (disabled by default)\n";
   
   printf ("USAGE: %s %s", program_invocation_short_name,
	   help);
}



int main (int argc, char *argv[])
{
   int c;
   const int hborder = 32;
   const int vborder = 32;
   const char *title = "Select file";
   const char *init_path = 0;
   const char *filter = 0;
   const char *wallpaper = 
      "/usr/share/gmenu2x/skins/Default/wallpapers/default.png";
   char path[4096];
   char **cmd = NULL;
   int num_cmd = 0;

   PALETTE pal;
   BITMAP *backbmp;

   while (1)
   {
      static struct option long_options[] =
	 {
	    /* These options set a flag. */
	    {"verbose", no_argument, &verbose_flag, 1},
	    {"help",  no_argument, &help_flag, 1},
	    {"mouse", no_argument, &mouse_flag, 1},
	    {"run",  no_argument, &run_flag, 1},
	    /* These options don't set a flag.
	       We distinguish them by their indices. */
	    {"title", required_argument, 0, 't'},
	    {"path", required_argument, 0, 'p'},
	    {"filter", required_argument, 0, 'f'},
	    {"wallpaper", required_argument, 0, 'w'},
	    {0, 0, 0, 0}
	 };
      /* `getopt_long' stores the option index here. */
      int option_index = 0;

      c = getopt_long (argc, argv, "t:p:f:w:mrh",
		       long_options, &option_index);

      /* Detect the end of the options. */
      if (c == -1)
	 break;

      switch (c)
      {
	 case 0:
	    /* If this option set a flag, do nothing else now. */
	    if (long_options[option_index].flag != 0)
	       break;
	    break;

	 case 't':
	    title = optarg;
	    break;

	 case 'p':
	    init_path = optarg;
	    break;

	 case 'f':
	    filter = optarg;
	    break;

	 case 'w':
	    wallpaper = optarg;
	    break;

	 case '?':
	    /* `getopt_long' already printed an error message. */
	    print_help();
	    return 1;

	 default:
	    abort ();
      }
   }

   if (help_flag)
   {
      print_help();
      return 0;
   }


   /* Print any remaining command line arguments (not options). */
   if (optind < argc)
   {
      run_flag = 1;
      cmd = &argv[optind];
      num_cmd = argc - optind;
      printf ("non-option ARGV-elements: ");
      while (optind < argc)
	 printf ("%s ", argv[optind++]);
      putchar ('\n');
   }

   if (allegro_init() != 0)
      return 1;
   install_keyboard(); 
   if (mouse_flag)
      install_mouse();
   install_timer();
   loadpng_init();
   jpgalleg_init();

   if (set_gfx_mode(GFX_SAFE, 320, 240, 0, 0) != 0) {
      set_gfx_mode(GFX_TEXT, 0, 0, 0, 0);
      allegro_message("Unable to set any graphic mode\n%s\n", allegro_error);
      return 1;
   }

   backbmp = load_bitmap(wallpaper, pal);
   if (backbmp) 
   {
      if (bitmap_color_depth(backbmp) == 8)
	 set_palette(pal);

      /* can't stretch_blit() between color depths, so doing the stretching on
	 a memory bitmap of matching depth, then blit to the screen */
      BITMAP *buffer = create_bitmap_ex(bitmap_color_depth(backbmp),
					SCREEN_W, SCREEN_H);

      if (!buffer)
      {
	 set_gfx_mode(GFX_TEXT, 0, 0, 0, 0);
	 allegro_message("Unable to allocate bitmap\n%s\n", allegro_error);
	 return 1;
      }

      stretch_blit(backbmp, buffer, 0, 0, backbmp->w, backbmp->h,
		   0, 0, SCREEN_W, SCREEN_H);
      blit(buffer, screen, 0, 0, 0, 0, SCREEN_W, SCREEN_H);
      destroy_bitmap(buffer);
   }
   else 
   {
      /* couln't load file (maybe default filename not present...?) */
      clear_to_color(screen, makecol(0,0,0));
   }
   
   set_palette(pal);

   gui_fg_color = makecol(230,210,140);
   gui_bg_color = makecol(30,40,50);
   gui_mg_color = makecol(140,150,160);

   if (!init_path)
      getcwd(path, sizeof(path));
   else
      strncpy(path, init_path, sizeof(path));

   path[sizeof(path)-1] = '\0';

   

   int ok = file_select_ex(
      title, path, filter, sizeof(path), SCREEN_W-2*hborder, SCREEN_H-2*vborder);
   path[sizeof(path)-1] = '\0';

   allegro_exit();

   if (ok)
   {
      printf ("%s", path);
      return 0;
   }

   return 1;
}


/* The following comments configure the Emacs editor.  Just ignore them.
 * Local Variables:
 * compile-command: "make -C ~/h/src/qi/openwrt-xburst package/alfilesel/compile -j2 V=99"
 * End:
 */
