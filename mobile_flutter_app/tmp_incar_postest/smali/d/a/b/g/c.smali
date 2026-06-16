.class public Ld/a/b/g/c;
.super Ljava/lang/Object;
.source "BitmapUtils.java"


# direct methods
.method public static varargs a(III[Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .registers 9

    .line 40
    invoke-static {p3}, Ld/a/b/g/c;->a([Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object p3

    .line 41
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {p0, p1, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 42
    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    const/4 v2, 0x0

    const/high16 v3, 0x40000000    # 2.0f

    if-eqz p2, :cond_3e

    const/4 v4, 0x1

    if-eq p2, v4, :cond_2c

    const/4 v4, 0x2

    if-eq p2, v4, :cond_1b

    goto :goto_49

    .line 43
    :cond_1b
    invoke-virtual {p3}, Landroid/graphics/Bitmap;->getWidth()I

    move-result p2

    sub-int/2addr p0, p2

    int-to-float p0, p0

    invoke-virtual {p3}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p2

    sub-int/2addr p1, p2

    int-to-float p1, p1

    div-float/2addr p1, v3

    invoke-virtual {v1, p3, p0, p1, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    goto :goto_49

    .line 44
    :cond_2c
    invoke-virtual {p3}, Landroid/graphics/Bitmap;->getWidth()I

    move-result p2

    sub-int/2addr p0, p2

    int-to-float p0, p0

    div-float/2addr p0, v3

    invoke-virtual {p3}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p2

    sub-int/2addr p1, p2

    int-to-float p1, p1

    div-float/2addr p1, v3

    invoke-virtual {v1, p3, p0, p1, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    goto :goto_49

    :cond_3e
    const/4 p0, 0x0

    .line 45
    invoke-virtual {p3}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p2

    sub-int/2addr p1, p2

    int-to-float p1, p1

    div-float/2addr p1, v3

    invoke-virtual {v1, p3, p0, p1, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    :goto_49
    return-object v0
.end method

.method public static a(Ljava/lang/String;I)Landroid/graphics/Bitmap;
    .registers 11

    .line 1
    new-instance v2, Landroid/text/TextPaint;

    invoke-direct {v2}, Landroid/text/TextPaint;-><init>()V

    const/high16 v0, -0x1000000

    .line 2
    invoke-virtual {v2, v0}, Landroid/text/TextPaint;->setColor(I)V

    const/high16 v0, 0x41c00000    # 24.0f

    .line 3
    invoke-virtual {v2, v0}, Landroid/text/TextPaint;->setTextSize(F)V

    .line 4
    sget-object v4, Landroid/text/Layout$Alignment;->ALIGN_NORMAL:Landroid/text/Layout$Alignment;

    .line 5
    new-instance v8, Landroid/text/StaticLayout;

    const/high16 v5, 0x3f800000    # 1.0f

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v0, v8

    move-object v1, p0

    move v3, p1

    invoke-direct/range {v0 .. v7}, Landroid/text/StaticLayout;-><init>(Ljava/lang/CharSequence;Landroid/text/TextPaint;ILandroid/text/Layout$Alignment;FFZ)V

    .line 6
    invoke-virtual {v8}, Landroid/text/StaticLayout;->getHeight()I

    move-result p0

    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {p1, p0, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p0

    .line 7
    new-instance p1, Landroid/graphics/Canvas;

    invoke-direct {p1, p0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    const/4 v0, -0x1

    .line 8
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->drawColor(I)V

    .line 9
    invoke-virtual {v8, p1}, Landroid/text/StaticLayout;->draw(Landroid/graphics/Canvas;)V

    return-object p0
.end method

.method public static a(Ljava/lang/String;II)Landroid/graphics/Bitmap;
    .registers 19

    move-object/from16 v0, p0

    if-eqz v0, :cond_87

    const-string v1, ""

    .line 10
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_e

    goto/16 :goto_87

    .line 11
    :cond_e
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 12
    sget-object v1, Lc/a/b/c;->CHARACTER_SET:Lc/a/b/c;

    const-string v2, "utf-8"

    invoke-interface {v6, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    sget-object v1, Lc/a/b/c;->ERROR_CORRECTION:Lc/a/b/c;

    sget-object v2, Lc/a/b/n/b/a;->M:Lc/a/b/n/b/a;

    invoke-interface {v6, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    sget-object v1, Lc/a/b/c;->MARGIN:Lc/a/b/c;

    const/4 v7, 0x0

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v6, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    :try_start_2b
    new-instance v1, Lc/a/b/n/a;

    invoke-direct {v1}, Lc/a/b/n/a;-><init>()V

    sget-object v3, Lc/a/b/a;->QR_CODE:Lc/a/b/a;

    move-object/from16 v2, p0

    move/from16 v4, p1

    move/from16 v5, p2

    invoke-virtual/range {v1 .. v6}, Lc/a/b/n/a;->a(Ljava/lang/String;Lc/a/b/a;IILjava/util/Map;)Lc/a/b/j/b;

    move-result-object v0

    .line 16
    invoke-virtual {v0}, Lc/a/b/j/b;->c()I

    move-result v1

    move/from16 v2, p1

    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    move-result v14

    .line 17
    invoke-virtual {v0}, Lc/a/b/j/b;->b()I

    move-result v1

    move/from16 v2, p2

    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    move-result v15

    mul-int v1, v14, v15

    .line 18
    new-array v9, v1, [I

    const/4 v1, 0x0

    :goto_55
    if-ge v1, v15, :cond_6f

    const/4 v2, 0x0

    :goto_58
    if-ge v2, v14, :cond_6c

    mul-int v3, v1, v14

    add-int/2addr v3, v2

    .line 19
    invoke-virtual {v0, v2, v1}, Lc/a/b/j/b;->a(II)Z

    move-result v4

    if-eqz v4, :cond_66

    const/high16 v4, -0x1000000

    goto :goto_67

    :cond_66
    const/4 v4, -0x1

    :goto_67
    aput v4, v9, v3

    add-int/lit8 v2, v2, 0x1

    goto :goto_58

    :cond_6c
    add-int/lit8 v1, v1, 0x1

    goto :goto_55

    .line 20
    :cond_6f
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v14, v15, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    const/4 v10, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    move-object v8, v0

    move v11, v14

    .line 21
    invoke-virtual/range {v8 .. v15}, Landroid/graphics/Bitmap;->setPixels([IIIIIII)V
    :try_end_7d
    .catch Lc/a/b/h; {:try_start_2b .. :try_end_7d} :catch_7e

    return-object v0

    :catch_7e
    move-exception v0

    .line 22
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "CreateQRCode failed"

    invoke-direct {v1, v2, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    :cond_87
    :goto_87
    const/4 v0, 0x0

    return-object v0
.end method

.method public static a(Ljava/lang/String;III)Landroid/graphics/Bitmap;
    .registers 5

    .line 29
    sget-object v0, Lc/a/b/a;->CODE_128:Lc/a/b/a;

    invoke-static {p0, p1, p2, p3, v0}, Ld/a/b/g/c;->a(Ljava/lang/String;IIILc/a/b/a;)Landroid/graphics/Bitmap;

    move-result-object p0

    return-object p0
.end method

.method public static a(Ljava/lang/String;IIILc/a/b/a;)Landroid/graphics/Bitmap;
    .registers 7

    if-nez p3, :cond_7

    .line 23
    invoke-static {p0, p1, p2, p4}, Ld/a/b/g/c;->a(Ljava/lang/String;IILc/a/b/a;)Landroid/graphics/Bitmap;

    move-result-object p0

    goto :goto_3c

    :cond_7
    const/16 v0, 0x14

    const/4 v1, 0x4

    .line 24
    invoke-static {p0, p1, v0, v1}, Ld/a/b/g/c;->b(Ljava/lang/String;III)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 25
    invoke-static {p0, p1, p2, p4}, Ld/a/b/g/c;->a(Ljava/lang/String;IILc/a/b/a;)Landroid/graphics/Bitmap;

    move-result-object p0

    const/4 p1, 0x0

    const/4 p2, 0x2

    const/4 p4, 0x1

    if-ne p3, p4, :cond_22

    new-array p2, p2, [Landroid/graphics/Bitmap;

    aput-object v0, p2, p1

    aput-object p0, p2, p4

    .line 26
    invoke-static {p2}, Ld/a/b/g/c;->a([Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object p0

    goto :goto_3c

    :cond_22
    const/4 v1, 0x3

    if-ne p3, v1, :cond_32

    new-array p3, v1, [Landroid/graphics/Bitmap;

    aput-object v0, p3, p1

    aput-object p0, p3, p4

    aput-object v0, p3, p2

    .line 27
    invoke-static {p3}, Ld/a/b/g/c;->a([Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object p0

    goto :goto_3c

    :cond_32
    new-array p2, p2, [Landroid/graphics/Bitmap;

    aput-object p0, p2, p1

    aput-object v0, p2, p4

    .line 28
    invoke-static {p2}, Ld/a/b/g/c;->a([Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object p0

    :goto_3c
    return-object p0
.end method

.method public static a(Ljava/lang/String;IILc/a/b/a;)Landroid/graphics/Bitmap;
    .registers 15

    .line 30
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 31
    sget-object v1, Lc/a/b/c;->CHARACTER_SET:Lc/a/b/c;

    const-string v2, "utf-8"

    invoke-interface {v6, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    sget-object v1, Lc/a/b/c;->MARGIN:Lc/a/b/c;

    const/4 v2, 0x4

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v6, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    new-instance v1, Lc/a/b/e;

    invoke-direct {v1}, Lc/a/b/e;-><init>()V

    const/4 v7, 0x0

    move-object v2, p0

    move-object v3, p3

    move v4, p1

    move v5, p2

    .line 34
    :try_start_20
    invoke-virtual/range {v1 .. v6}, Lc/a/b/e;->a(Ljava/lang/String;Lc/a/b/a;IILjava/util/Map;)Lc/a/b/j/b;

    move-result-object v1

    mul-int v2, p1, p2

    .line 35
    new-array v2, v2, [I

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_2a
    if-ge v4, p2, :cond_45

    mul-int v5, v4, p1

    const/4 v6, 0x0

    :goto_2f
    if-ge v6, p1, :cond_42

    add-int v9, v5, v6

    .line 36
    invoke-virtual {v1, v6, v4}, Lc/a/b/j/b;->a(II)Z

    move-result v10

    if-eqz v10, :cond_3c

    const/high16 v10, -0x1000000

    goto :goto_3d

    :cond_3c
    const/4 v10, -0x1

    :goto_3d
    aput v10, v2, v9

    add-int/lit8 v6, v6, 0x1

    goto :goto_2f

    :cond_42
    add-int/lit8 v4, v4, 0x1

    goto :goto_2a

    .line 37
    :cond_45
    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {p1, p2, v1}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v9
    :try_end_4b
    .catch Lc/a/b/h; {:try_start_20 .. :try_end_4b} :catch_59

    const/4 v3, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v1, v9

    move v4, p1

    move v7, p1

    move v8, p2

    .line 38
    :try_start_52
    invoke-virtual/range {v1 .. v8}, Landroid/graphics/Bitmap;->setPixels([IIIIIII)V
    :try_end_55
    .catch Lc/a/b/h; {:try_start_52 .. :try_end_55} :catch_56

    goto :goto_5e

    :catch_56
    move-exception v0

    move-object v7, v9

    goto :goto_5a

    :catch_59
    move-exception v0

    .line 39
    :goto_5a
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    move-object v9, v7

    :goto_5e
    return-object v9
.end method

.method public static varargs a([Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .registers 10

    .line 46
    array-length v0, p0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_5
    if-ge v2, v0, :cond_1e

    aget-object v5, p0, v2

    if-nez v5, :cond_c

    goto :goto_1b

    .line 47
    :cond_c
    invoke-virtual {v5}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v6

    add-int/2addr v4, v6

    .line 48
    invoke-virtual {v5}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v6

    if-ge v3, v6, :cond_1b

    .line 49
    invoke-virtual {v5}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    :cond_1b
    :goto_1b
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    .line 50
    :cond_1e
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v3, v4, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 51
    new-instance v2, Landroid/graphics/Canvas;

    invoke-direct {v2, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 52
    array-length v3, p0

    const/4 v4, 0x0

    :goto_2b
    if-ge v1, v3, :cond_40

    aget-object v5, p0, v1

    if-nez v5, :cond_32

    goto :goto_3d

    :cond_32
    const/4 v6, 0x0

    int-to-float v7, v4

    const/4 v8, 0x0

    .line 53
    invoke-virtual {v2, v5, v6, v7, v8}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 54
    invoke-virtual {v5}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    add-int/2addr v4, v5

    :goto_3d
    add-int/lit8 v1, v1, 0x1

    goto :goto_2b

    :cond_40
    return-object v0
.end method

.method public static b(Ljava/lang/String;III)Landroid/graphics/Bitmap;
    .registers 11

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_8

    return-object v1

    :cond_8
    mul-int/lit8 v0, p3, 0x2

    add-int/2addr v0, p2

    .line 2
    :try_start_b
    new-instance v2, Landroid/text/TextPaint;

    invoke-direct {v2}, Landroid/text/TextPaint;-><init>()V

    int-to-float p2, p2

    .line 3
    invoke-virtual {v2, p2}, Landroid/text/TextPaint;->setTextSize(F)V

    const/high16 p2, -0x1000000

    .line 4
    invoke-virtual {v2, p2}, Landroid/text/TextPaint;->setColor(I)V

    .line 5
    sget-object p2, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v2, p2}, Landroid/text/TextPaint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 6
    invoke-virtual {v2, p0}, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F

    move-result p2

    int-to-float p1, p1

    invoke-static {p2, p1}, Ljava/lang/Math;->max(FF)F

    move-result p1

    float-to-int p1, p1

    .line 7
    sget-object p2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {p1, v0, p2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p2

    .line 8
    new-instance v3, Landroid/graphics/Canvas;

    invoke-direct {v3, p2}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    const/4 v4, -0x1

    .line 9
    invoke-virtual {v3, v4}, Landroid/graphics/Canvas;->drawColor(I)V

    .line 10
    invoke-virtual {v2}, Landroid/text/TextPaint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    move-result-object v4

    .line 11
    iget v5, v4, Landroid/graphics/Paint$FontMetrics;->top:F

    .line 12
    iget v4, v4, Landroid/graphics/Paint$FontMetrics;->bottom:F

    .line 13
    div-int/lit8 v0, v0, 0x3

    int-to-float v0, v0

    sub-float v5, v4, v5

    const/high16 v6, 0x40000000    # 2.0f

    div-float/2addr v5, v6

    add-float/2addr v0, v5

    sub-float/2addr v0, v4

    .line 14
    div-int/lit8 p1, p1, 0x2

    int-to-float p1, p1

    int-to-float p3, p3

    add-float/2addr v0, p3

    invoke-virtual {v3, p0, p1, v0, v2}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 15
    invoke-virtual {v3}, Landroid/graphics/Canvas;->save()I

    .line 16
    invoke-virtual {v3}, Landroid/graphics/Canvas;->restore()V
    :try_end_57
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_57} :catch_59

    move-object v1, p2

    goto :goto_5d

    :catch_59
    move-exception p0

    .line 17
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    :goto_5d
    return-object v1
.end method
