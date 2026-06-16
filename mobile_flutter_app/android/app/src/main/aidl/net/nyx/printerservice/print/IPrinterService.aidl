package net.nyx.printerservice.print;

import android.graphics.Bitmap;
import net.nyx.printerservice.print.PrintTextFormat;

// Vendor interface reconstructed from incar-postest.apk binder proxy
// (descriptor: net.nyx.printerservice.print.IPrinterService).
interface IPrinterService {
    int a();
    int a(int value);
    int a(int value1, int value2);
    int a(in Bitmap bitmap);
    int a(in Bitmap bitmap, int value1, int value2);
    int a(String value, int value1, int value2, int value3);
    int a(String value, int value1, int value2, int value3, int value4);
    int a(String value, in PrintTextFormat format);
    int a(String value, in PrintTextFormat format, int value1, int value2);
    int a(in byte[] value);
    int a(inout String[] value);
    int b(int value);
    int b(inout String[] value);
    boolean b();
    int c();
    String d();
    int e();
    int f();
    int g();
    int h();
}
