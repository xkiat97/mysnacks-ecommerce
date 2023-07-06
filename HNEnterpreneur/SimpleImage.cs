﻿using System;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.IO;

namespace Helpers
{
    // SimpleImage Version 0.3
    //
    // The class supports only simple image manipulations.
    // For complex image manipulations, try to implement it yourself.
    // Or make use of external API or library for the tasks.

    public class SimpleImage
    {
        private Bitmap source;

        public SimpleImage(Stream stream)
        {
            source = new Bitmap(stream);
        }

        public SimpleImage(string filename)
        {
            source = new Bitmap(filename);
        }

        public SimpleImage(Byte[] bytes)
        {
            source = (Bitmap)new ImageConverter().ConvertFrom(bytes);
        }

        public void Square()
        {
            int size = Math.Min(source.Width, source.Height);

            Bitmap target = new Bitmap(size, size);
            using (Graphics g = Graphics.FromImage(target))
            {
                g.CompositingQuality = CompositingQuality.HighSpeed;
                g.InterpolationMode = InterpolationMode.HighQualityBicubic;
                g.CompositingMode = CompositingMode.SourceCopy;
                g.DrawImage(source, (size - source.Width) / 2, (size - source.Height) / 2, source.Width, source.Height);
                source = target;
            }
        }

        public void Resize(int size)
        {
            int width, height;

            if (source.Width > source.Height)
            {
                width = size;
                height = source.Height * size / source.Width;
            }
            else
            {
                width = source.Width * size / source.Height;
                height = size;
            }

            Bitmap target = new Bitmap(width, height);
            using (Graphics g = Graphics.FromImage(target))
            {
                g.CompositingQuality = CompositingQuality.HighSpeed;
                g.InterpolationMode = InterpolationMode.HighQualityBicubic;
                g.CompositingMode = CompositingMode.SourceCopy;
                g.DrawImage(source, 0, 0, width, height);
                source = target;
            }
        }

        public void SaveAs(string filename)
        {
            source.Save(filename, ImageFormat.Jpeg);
        }
    }
}