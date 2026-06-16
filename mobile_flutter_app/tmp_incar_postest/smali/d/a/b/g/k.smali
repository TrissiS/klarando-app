.class public Ld/a/b/g/k;
.super Ljava/lang/Object;
.source "Sys.java"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "MissingPermission",
        "HardwareIds"
    }
.end annotation


# direct methods
.method public static a()Ljava/lang/String;
    .registers 2

    const-string v0, "ro.build.display.tlid"

    .line 5
    invoke-static {v0}, Ld/a/b/g/k;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 6
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_e

    sget-object v0, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    :cond_e
    return-object v0
.end method

.method public static a(Ljava/lang/String;)Z
    .registers 3

    const/4 v0, 0x0

    if-nez p0, :cond_4

    return v0

    .line 1
    :cond_4
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 2
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result p0

    if-eqz p0, :cond_1c

    invoke-virtual {v1}, Ljava/io/File;->canWrite()Z

    move-result p0

    if-eqz p0, :cond_1c

    invoke-virtual {v1}, Ljava/io/File;->canRead()Z

    move-result p0

    if-eqz p0, :cond_1c

    const/4 v0, 0x1

    :cond_1c
    return v0
.end method

.method public static varargs a([Ljava/lang/String;)Z
    .registers 5

    .line 3
    array-length v0, p0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_3
    if-ge v2, v0, :cond_12

    aget-object v3, p0, v2

    .line 4
    invoke-static {v3}, Ld/a/b/g/k;->a(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_f

    const/4 p0, 0x1

    return p0

    :cond_f
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    :cond_12
    return v1
.end method

.method public static b(Ljava/lang/String;)Ljava/lang/String;
    .registers 7

    :try_start_0
    const-string v0, "android.os.SystemProperties"

    .line 13
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "get"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Class;

    .line 14
    const-class v4, Ljava/lang/String;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    new-array v2, v2, [Ljava/lang/Object;

    aput-object p0, v2, v5

    .line 15
    invoke-virtual {v1, v0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;
    :try_end_1e
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_1e} :catch_1f

    goto :goto_24

    :catch_1f
    move-exception p0

    .line 16
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    const/4 p0, 0x0

    :goto_24
    return-object p0
.end method

.method public static b()[I
    .registers 12

    const/4 v0, 0x2

    new-array v0, v0, [I

    .line 1
    invoke-static {}, Ld/a/b/a;->b()Landroid/app/Application;

    move-result-object v1

    const-string v2, "camera"

    invoke-virtual {v1, v2}, Landroid/app/Application;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/hardware/camera2/CameraManager;

    if-nez v1, :cond_13

    const/4 v0, 0x0

    return-object v0

    .line 2
    :cond_13
    :try_start_13
    invoke-virtual {v1}, Landroid/hardware/camera2/CameraManager;->getCameraIdList()[Ljava/lang/String;

    move-result-object v2

    .line 3
    array-length v3, v2

    const/4 v4, 0x0

    const/4 v5, 0x0

    :goto_1a
    if-ge v5, v3, :cond_71

    aget-object v6, v2, v5

    .line 4
    invoke-virtual {v1, v6}, Landroid/hardware/camera2/CameraManager;->getCameraCharacteristics(Ljava/lang/String;)Landroid/hardware/camera2/CameraCharacteristics;

    move-result-object v6

    .line 5
    sget-object v7, Landroid/hardware/camera2/CameraCharacteristics;->LENS_FACING:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v6, v7}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    const-string v8, "camera face: %s"

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    .line 6
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v9, v4

    invoke-static {v8, v9}, Lf/a/a;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 7
    sget-object v8, Landroid/hardware/camera2/CameraCharacteristics;->SENSOR_INFO_PHYSICAL_SIZE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v6, v8}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/util/SizeF;

    .line 8
    sget-object v9, Landroid/hardware/camera2/CameraCharacteristics;->SENSOR_INFO_ACTIVE_ARRAY_SIZE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v6, v9}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/graphics/Rect;

    if-eqz v8, :cond_6a

    if-eqz v6, :cond_6a

    .line 9
    iget v8, v6, Landroid/graphics/Rect;->right:I

    iget v9, v6, Landroid/graphics/Rect;->left:I

    sub-int/2addr v8, v9

    .line 10
    iget v9, v6, Landroid/graphics/Rect;->bottom:I

    iget v6, v6, Landroid/graphics/Rect;->top:I

    sub-int/2addr v9, v6

    mul-int v8, v8, v9

    int-to-double v8, v8

    const-wide v10, 0x412e848000000000L    # 1000000.0

    div-double/2addr v8, v10

    .line 11
    invoke-static {v8, v9}, Ljava/lang/Math;->round(D)J

    move-result-wide v8

    long-to-int v6, v8

    aput v6, v0, v7
    :try_end_6a
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_13 .. :try_end_6a} :catch_6d

    :cond_6a
    add-int/lit8 v5, v5, 0x1

    goto :goto_1a

    :catch_6d
    move-exception v1

    .line 12
    invoke-virtual {v1}, Landroid/hardware/camera2/CameraAccessException;->printStackTrace()V

    :cond_71
    return-object v0
.end method

.method public static c()Ljava/lang/String;
    .registers 2

    .line 1
    invoke-static {}, Ld/a/b/a;->b()Landroid/app/Application;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Application;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "nyx_cash_box_path"

    invoke-static {v0, v1}, Landroid/provider/Settings$Global;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static c(Ljava/lang/String;)Z
    .registers 4

    .line 2
    invoke-static {}, Ld/a/b/a;->b()Landroid/app/Application;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Application;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    const/4 v1, 0x0

    .line 3
    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->getInstalledPackages(I)Ljava/util/List;

    move-result-object v0

    .line 4
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_11
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_27

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/pm/PackageInfo;

    .line 5
    iget-object v2, v2, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_11

    const/4 p0, 0x1

    return p0

    :cond_27
    return v1
.end method

.method public static d()Ljava/lang/String;
    .registers 1

    .line 1
    invoke-static {}, Ld/a/b/g/k;->u()Z

    move-result v0

    if-eqz v0, :cond_d

    const-string v0, "ro.romtool.cpu_platform"

    .line 2
    invoke-static {v0}, Ld/a/b/g/k;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_d
    const-string v0, "ro.soc.model"

    .line 3
    invoke-static {v0}, Ld/a/b/g/k;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static e()I
    .registers 1

    .line 1
    invoke-static {}, Ld/a/b/a;->b()Landroid/app/Application;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Application;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    .line 2
    iget v0, v0, Landroid/util/DisplayMetrics;->densityDpi:I

    return v0
.end method

.method public static f()Ljava/lang/String;
    .registers 2

    .line 1
    invoke-static {}, Ld/a/b/a;->b()Landroid/app/Application;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Application;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "nyx_lcd_uart_path"

    invoke-static {v0, v1}, Landroid/provider/Settings$Global;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static g()Ljava/lang/String;
    .registers 2

    .line 1
    invoke-static {}, Ld/a/b/a;->e()Ljava/lang/String;

    move-result-object v0

    const-string v1, "com.incar"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_19

    invoke-static {}, Ld/a/b/g/k;->h()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_19

    const-string v0, "Handheld POS"

    return-object v0

    .line 2
    :cond_19
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    return-object v0
.end method

.method public static h()Ljava/lang/String;
    .registers 1

    const-string v0, "ro.nyx.platform.tag"

    .line 1
    invoke-static {v0}, Ld/a/b/g/k;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static i()Z
    .registers 3

    .line 1
    invoke-static {}, Ld/a/b/a;->b()Landroid/app/Application;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Application;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const/4 v1, 0x0

    const-string v2, "nyx_pos_test_home_def"

    invoke-static {v0, v2, v1}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_13

    const/4 v1, 0x1

    :cond_13
    return v1
.end method

.method public static j()Ljava/lang/String;
    .registers 2

    .line 1
    invoke-static {}, Ld/a/b/a;->b()Landroid/app/Application;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Application;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "nyx_pos_test_home_path"

    invoke-static {v0, v1}, Landroid/provider/Settings$Global;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static k()I
    .registers 3

    .line 1
    invoke-static {}, Ld/a/b/a;->b()Landroid/app/Application;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Application;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "nyx_printer_aging_delay_time"

    const/16 v2, 0x12c

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static l()Ljava/lang/String;
    .registers 2

    .line 1
    invoke-static {}, Ld/a/b/a;->b()Landroid/app/Application;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Application;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "nyx_qsc_enable_path"

    invoke-static {v0, v1}, Landroid/provider/Settings$Global;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static m()Ljava/lang/String;
    .registers 3

    .line 1
    invoke-static {}, Ld/a/b/a;->b()Landroid/app/Application;

    move-result-object v0

    const-string v1, "window"

    invoke-virtual {v0, v1}, Landroid/app/Application;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    .line 2
    new-instance v1, Landroid/util/DisplayMetrics;

    invoke-direct {v1}, Landroid/util/DisplayMetrics;-><init>()V

    .line 3
    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/Display;->getRealMetrics(Landroid/util/DisplayMetrics;)V

    .line 4
    iget v0, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 5
    iget v1, v1, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 6
    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 7
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 8
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "x"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static n()Ljava/lang/String;
    .registers 2

    .line 1
    :try_start_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-ge v0, v1, :cond_d

    const-string v0, "ro.serialno"

    .line 2
    invoke-static {v0}, Ld/a/b/g/k;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_20

    .line 3
    :cond_d
    invoke-static {}, Landroid/os/Build;->getSerial()Ljava/lang/String;

    move-result-object v0
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_11} :catch_12

    goto :goto_20

    .line 4
    :catch_12
    invoke-static {}, Ld/a/b/a;->b()Landroid/app/Application;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Application;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "nyx_sn"

    invoke-static {v0, v1}, Landroid/provider/Settings$Global;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_20
    return-object v0
.end method

.method public static o()[D
    .registers 8

    const/4 v0, 0x2

    new-array v0, v0, [D

    .line 1
    invoke-static {}, Ld/a/b/a;->b()Landroid/app/Application;

    move-result-object v1

    const-string v2, "activity"

    invoke-virtual {v1, v2}, Landroid/app/Application;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/ActivityManager;

    .line 2
    new-instance v2, Landroid/app/ActivityManager$MemoryInfo;

    invoke-direct {v2}, Landroid/app/ActivityManager$MemoryInfo;-><init>()V

    .line 3
    invoke-virtual {v1, v2}, Landroid/app/ActivityManager;->getMemoryInfo(Landroid/app/ActivityManager$MemoryInfo;)V

    .line 4
    iget-wide v3, v2, Landroid/app/ActivityManager$MemoryInfo;->totalMem:J

    .line 5
    iget-wide v1, v2, Landroid/app/ActivityManager$MemoryInfo;->availMem:J

    sub-long v1, v3, v1

    long-to-float v3, v3

    const/high16 v4, 0x3f800000    # 1.0f

    mul-float v3, v3, v4

    const-wide/32 v5, 0x40000000

    long-to-float v5, v5

    div-float/2addr v3, v5

    float-to-double v6, v3

    .line 6
    invoke-static {v6, v7}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v6

    const/4 v3, 0x0

    aput-wide v6, v0, v3

    long-to-float v1, v1

    mul-float v1, v1, v4

    div-float/2addr v1, v5

    float-to-double v1, v1

    const/4 v3, 0x1

    aput-wide v1, v0, v3

    return-object v0
.end method

.method public static p()[D
    .registers 14

    const/4 v0, 0x2

    new-array v1, v0, [D

    .line 1
    invoke-static {}, Landroid/os/Environment;->getDataDirectory()Ljava/io/File;

    move-result-object v2

    .line 2
    new-instance v3, Landroid/os/StatFs;

    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v3, v2}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    .line 3
    invoke-virtual {v3}, Landroid/os/StatFs;->getBlockCountLong()J

    move-result-wide v4

    .line 4
    invoke-virtual {v3}, Landroid/os/StatFs;->getAvailableBlocksLong()J

    move-result-wide v6

    .line 5
    invoke-virtual {v3}, Landroid/os/StatFs;->getBlockSizeLong()J

    move-result-wide v2

    mul-long v6, v6, v2

    mul-long v4, v4, v2

    const/16 v2, 0xb

    new-array v3, v2, [J

    const-wide/32 v8, 0x77359400

    const/4 v10, 0x0

    aput-wide v8, v3, v10

    const-wide v8, 0xee6b2800L

    const/4 v11, 0x1

    aput-wide v8, v3, v11

    const-wide v8, 0x1dcd65000L

    aput-wide v8, v3, v0

    const/4 v8, 0x3

    const-wide v12, 0x3b9aca000L

    aput-wide v12, v3, v8

    const/4 v8, 0x4

    const-wide v12, 0x773594000L

    aput-wide v12, v3, v8

    const/4 v8, 0x5

    const-wide v12, 0xee6b28000L

    aput-wide v12, v3, v8

    const/4 v8, 0x6

    const-wide v12, 0x1dcd650000L

    aput-wide v12, v3, v8

    const/4 v8, 0x7

    const-wide v12, 0x3b9aca0000L

    aput-wide v12, v3, v8

    const/16 v8, 0x8

    const-wide v12, 0x7735940000L

    aput-wide v12, v3, v8

    const/16 v8, 0x9

    const-wide v12, 0xee6b280000L

    aput-wide v12, v3, v8

    const/16 v8, 0xa

    const-wide v12, 0x1dcd6500000L

    aput-wide v12, v3, v8

    const/4 v8, 0x0

    :goto_7d
    if-ge v8, v2, :cond_89

    .line 6
    aget-wide v12, v3, v8

    cmp-long v9, v4, v12

    if-gtz v9, :cond_86

    goto :goto_89

    :cond_86
    add-int/lit8 v8, v8, 0x1

    goto :goto_7d

    :cond_89
    :goto_89
    shl-int/2addr v0, v8

    int-to-double v2, v0

    aput-wide v2, v1, v10

    int-to-long v2, v0

    const-wide/32 v4, 0x3b9aca00

    mul-long v2, v2, v4

    sub-long/2addr v2, v6

    long-to-float v0, v2

    const/high16 v2, 0x3f800000    # 1.0f

    mul-float v0, v0, v2

    long-to-float v2, v4

    div-float/2addr v0, v2

    float-to-double v2, v0

    aput-wide v2, v1, v11

    return-object v1
.end method

.method public static q()Ljava/lang/String;
    .registers 1

    .line 1
    sget-object v0, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    return-object v0
.end method

.method public static r()Z
    .registers 2

    .line 1
    invoke-static {}, Ld/a/b/g/k;->h()Ljava/lang/String;

    move-result-object v0

    const-string v1, "nyxpt1401"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static s()Z
    .registers 2

    .line 1
    invoke-static {}, Ld/a/b/g/k;->g()Ljava/lang/String;

    move-result-object v0

    .line 2
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_14

    const-string v1, "NB"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_14

    const/4 v0, 0x1

    goto :goto_15

    :cond_14
    const/4 v0, 0x0

    :goto_15
    return v0
.end method

.method public static t()Z
    .registers 2

    .line 1
    invoke-static {}, Ld/a/b/g/k;->h()Ljava/lang/String;

    move-result-object v0

    const-string v1, "nyxpt1301"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static u()Z
    .registers 2

    .line 1
    invoke-static {}, Ld/a/b/g/k;->h()Ljava/lang/String;

    move-result-object v0

    const-string v1, "nyxpt002"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static v()Z
    .registers 2

    .line 1
    invoke-static {}, Ld/a/b/g/k;->h()Ljava/lang/String;

    move-result-object v0

    const-string v1, "nyxpt1103"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method
