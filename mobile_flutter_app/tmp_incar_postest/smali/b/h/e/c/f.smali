.class public final Lb/h/e/c/f;
.super Ljava/lang/Object;
.source "ResourcesCompat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lb/h/e/c/f$b;,
        Lb/h/e/c/f$a;
    }
.end annotation


# direct methods
.method public static a(Landroid/content/Context;I)Landroid/graphics/Typeface;
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/res/Resources$NotFoundException;
        }
    .end annotation

    .line 4
    invoke-virtual {p0}, Landroid/content/Context;->isRestricted()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 p0, 0x0

    return-object p0

    .line 5
    :cond_8
    new-instance v2, Landroid/util/TypedValue;

    invoke-direct {v2}, Landroid/util/TypedValue;-><init>()V

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x1

    move-object v0, p0

    move v1, p1

    invoke-static/range {v0 .. v7}, Lb/h/e/c/f;->a(Landroid/content/Context;ILandroid/util/TypedValue;ILb/h/e/c/f$a;Landroid/os/Handler;ZZ)Landroid/graphics/Typeface;

    move-result-object p0

    return-object p0
.end method

.method public static a(Landroid/content/Context;ILandroid/util/TypedValue;ILb/h/e/c/f$a;)Landroid/graphics/Typeface;
    .registers 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/res/Resources$NotFoundException;
        }
    .end annotation

    .line 10
    invoke-virtual {p0}, Landroid/content/Context;->isRestricted()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 p0, 0x0

    return-object p0

    :cond_8
    const/4 v5, 0x0

    const/4 v6, 0x1

    const/4 v7, 0x0

    move-object v0, p0

    move v1, p1

    move-object v2, p2

    move v3, p3

    move-object v4, p4

    .line 11
    invoke-static/range {v0 .. v7}, Lb/h/e/c/f;->a(Landroid/content/Context;ILandroid/util/TypedValue;ILb/h/e/c/f$a;Landroid/os/Handler;ZZ)Landroid/graphics/Typeface;

    move-result-object p0

    return-object p0
.end method

.method public static a(Landroid/content/Context;ILandroid/util/TypedValue;ILb/h/e/c/f$a;Landroid/os/Handler;ZZ)Landroid/graphics/Typeface;
    .registers 18

    .line 12
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const/4 v0, 0x1

    move v9, p1

    move-object v2, p2

    .line 13
    invoke-virtual {v1, p1, p2, v0}, Landroid/content/res/Resources;->getValue(ILandroid/util/TypedValue;Z)V

    move-object v0, p0

    move v3, p1

    move v4, p3

    move-object v5, p4

    move-object v6, p5

    move/from16 v7, p6

    move/from16 v8, p7

    .line 14
    invoke-static/range {v0 .. v8}, Lb/h/e/c/f;->a(Landroid/content/Context;Landroid/content/res/Resources;Landroid/util/TypedValue;IILb/h/e/c/f$a;Landroid/os/Handler;ZZ)Landroid/graphics/Typeface;

    move-result-object v0

    if-nez v0, :cond_3e

    if-nez p4, :cond_3e

    if-eqz p7, :cond_1e

    goto :goto_3e

    .line 15
    :cond_1e
    new-instance v0, Landroid/content/res/Resources$NotFoundException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Font resource ID #0x"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    invoke-static {p1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " could not be retrieved."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/content/res/Resources$NotFoundException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_3e
    :goto_3e
    return-object v0
.end method

.method public static a(Landroid/content/Context;Landroid/content/res/Resources;Landroid/util/TypedValue;IILb/h/e/c/f$a;Landroid/os/Handler;ZZ)Landroid/graphics/Typeface;
    .registers 24

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move/from16 v4, p3

    move/from16 v5, p4

    move-object/from16 v9, p5

    move-object/from16 v10, p6

    const-string v11, "ResourcesCompat"

    .line 17
    iget-object v2, v1, Landroid/util/TypedValue;->string:Ljava/lang/CharSequence;

    if-eqz v2, :cond_aa

    .line 18
    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v12

    const-string v1, "res/"

    .line 19
    invoke-virtual {v12, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    const/4 v13, -0x3

    const/4 v14, 0x0

    if-nez v1, :cond_26

    if-eqz v9, :cond_25

    .line 20
    invoke-virtual {v9, v13, v10}, Lb/h/e/c/f$a;->a(ILandroid/os/Handler;)V

    :cond_25
    return-object v14

    .line 21
    :cond_26
    invoke-static {v0, v4, v5}, Lb/h/f/d;->b(Landroid/content/res/Resources;II)Landroid/graphics/Typeface;

    move-result-object v1

    if-eqz v1, :cond_32

    if-eqz v9, :cond_31

    .line 22
    invoke-virtual {v9, v1, v10}, Lb/h/e/c/f$a;->a(Landroid/graphics/Typeface;Landroid/os/Handler;)V

    :cond_31
    return-object v1

    :cond_32
    if-eqz p8, :cond_35

    return-object v14

    .line 23
    :cond_35
    :try_start_35
    invoke-virtual {v12}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-string v2, ".xml"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_68

    .line 24
    invoke-virtual {v0, v4}, Landroid/content/res/Resources;->getXml(I)Landroid/content/res/XmlResourceParser;

    move-result-object v1

    .line 25
    invoke-static {v1, v0}, Lb/h/e/c/c;->a(Lorg/xmlpull/v1/XmlPullParser;Landroid/content/res/Resources;)Lb/h/e/c/c$a;

    move-result-object v2

    if-nez v2, :cond_56

    const-string v0, "Failed to find font-family tag"

    .line 26
    invoke-static {v11, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz v9, :cond_55

    .line 27
    invoke-virtual {v9, v13, v10}, Lb/h/e/c/f$a;->a(ILandroid/os/Handler;)V

    :cond_55
    return-object v14

    :cond_56
    move-object v1, p0

    move-object/from16 v3, p1

    move/from16 v4, p3

    move/from16 v5, p4

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    move/from16 v8, p7

    .line 28
    invoke-static/range {v1 .. v8}, Lb/h/f/d;->a(Landroid/content/Context;Lb/h/e/c/c$a;Landroid/content/res/Resources;IILb/h/e/c/f$a;Landroid/os/Handler;Z)Landroid/graphics/Typeface;

    move-result-object v0

    return-object v0

    :cond_68
    move-object v1, p0

    .line 29
    invoke-static {p0, v0, v4, v12, v5}, Lb/h/f/d;->a(Landroid/content/Context;Landroid/content/res/Resources;ILjava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v0

    if-eqz v9, :cond_78

    if-eqz v0, :cond_75

    .line 30
    invoke-virtual {v9, v0, v10}, Lb/h/e/c/f$a;->a(Landroid/graphics/Typeface;Landroid/os/Handler;)V

    goto :goto_78

    .line 31
    :cond_75
    invoke-virtual {v9, v13, v10}, Lb/h/e/c/f$a;->a(ILandroid/os/Handler;)V
    :try_end_78
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_35 .. :try_end_78} :catch_8f
    .catch Ljava/io/IOException; {:try_start_35 .. :try_end_78} :catch_79

    :cond_78
    :goto_78
    return-object v0

    :catch_79
    move-exception v0

    .line 32
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Failed to read xml resource "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v11, v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_a4

    :catch_8f
    move-exception v0

    .line 33
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Failed to parse xml resource "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v11, v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_a4
    if-eqz v9, :cond_a9

    .line 34
    invoke-virtual {v9, v13, v10}, Lb/h/e/c/f$a;->a(ILandroid/os/Handler;)V

    :cond_a9
    return-object v14

    .line 35
    :cond_aa
    new-instance v2, Landroid/content/res/Resources$NotFoundException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Resource \""

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v4}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\" ("

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    invoke-static/range {p3 .. p3}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ") is not a Font: "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Landroid/content/res/Resources$NotFoundException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public static a(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/res/Resources$NotFoundException;
        }
    .end annotation

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_b

    .line 2
    invoke-virtual {p0, p1, p2}, Landroid/content/res/Resources;->getDrawable(ILandroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0

    .line 3
    :cond_b
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0
.end method

.method public static a(Landroid/content/Context;ILb/h/e/c/f$a;Landroid/os/Handler;)V
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/res/Resources$NotFoundException;
        }
    .end annotation

    .line 6
    invoke-static {p2}, Lb/h/l/h;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    invoke-virtual {p0}, Landroid/content/Context;->isRestricted()Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 p0, -0x4

    .line 8
    invoke-virtual {p2, p0, p3}, Lb/h/e/c/f$a;->a(ILandroid/os/Handler;)V

    return-void

    .line 9
    :cond_e
    new-instance v2, Landroid/util/TypedValue;

    invoke-direct {v2}, Landroid/util/TypedValue;-><init>()V

    const/4 v3, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v0, p0

    move v1, p1

    move-object v4, p2

    move-object v5, p3

    invoke-static/range {v0 .. v7}, Lb/h/e/c/f;->a(Landroid/content/Context;ILandroid/util/TypedValue;ILb/h/e/c/f$a;Landroid/os/Handler;ZZ)Landroid/graphics/Typeface;

    return-void
.end method

.method public static b(Landroid/content/Context;I)Landroid/graphics/Typeface;
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/res/Resources$NotFoundException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->isRestricted()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 p0, 0x0

    return-object p0

    .line 2
    :cond_8
    new-instance v2, Landroid/util/TypedValue;

    invoke-direct {v2}, Landroid/util/TypedValue;-><init>()V

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v0, p0

    move v1, p1

    invoke-static/range {v0 .. v7}, Lb/h/e/c/f;->a(Landroid/content/Context;ILandroid/util/TypedValue;ILb/h/e/c/f$a;Landroid/os/Handler;ZZ)Landroid/graphics/Typeface;

    move-result-object p0

    return-object p0
.end method
