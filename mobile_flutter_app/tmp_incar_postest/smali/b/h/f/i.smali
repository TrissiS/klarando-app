.class public Lb/h/f/i;
.super Lb/h/f/j;
.source "TypefaceCompatApi29Impl.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Lb/h/f/j;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Landroid/content/Context;Landroid/content/res/Resources;ILjava/lang/String;I)Landroid/graphics/Typeface;
    .registers 6

    .line 34
    :try_start_0
    new-instance p1, Landroid/graphics/fonts/Font$Builder;

    invoke-direct {p1, p2, p3}, Landroid/graphics/fonts/Font$Builder;-><init>(Landroid/content/res/Resources;I)V

    invoke-virtual {p1}, Landroid/graphics/fonts/Font$Builder;->build()Landroid/graphics/fonts/Font;

    move-result-object p1

    .line 35
    new-instance p2, Landroid/graphics/fonts/FontFamily$Builder;

    invoke-direct {p2, p1}, Landroid/graphics/fonts/FontFamily$Builder;-><init>(Landroid/graphics/fonts/Font;)V

    invoke-virtual {p2}, Landroid/graphics/fonts/FontFamily$Builder;->build()Landroid/graphics/fonts/FontFamily;

    move-result-object p2

    .line 36
    new-instance p3, Landroid/graphics/Typeface$CustomFallbackBuilder;

    invoke-direct {p3, p2}, Landroid/graphics/Typeface$CustomFallbackBuilder;-><init>(Landroid/graphics/fonts/FontFamily;)V

    .line 37
    invoke-virtual {p1}, Landroid/graphics/fonts/Font;->getStyle()Landroid/graphics/fonts/FontStyle;

    move-result-object p1

    invoke-virtual {p3, p1}, Landroid/graphics/Typeface$CustomFallbackBuilder;->setStyle(Landroid/graphics/fonts/FontStyle;)Landroid/graphics/Typeface$CustomFallbackBuilder;

    move-result-object p1

    .line 38
    invoke-virtual {p1}, Landroid/graphics/Typeface$CustomFallbackBuilder;->build()Landroid/graphics/Typeface;

    move-result-object p1
    :try_end_23
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_23} :catch_24

    return-object p1

    :catch_24
    const/4 p1, 0x0

    return-object p1
.end method

.method public a(Landroid/content/Context;Landroid/os/CancellationSignal;[Lb/h/j/f$b;I)Landroid/graphics/Typeface;
    .registers 15

    .line 3
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    const/4 v0, 0x0

    .line 4
    :try_start_5
    array-length v1, p3

    const/4 v2, 0x0

    move-object v4, v0

    const/4 v3, 0x0

    :goto_9
    const/4 v5, 0x1

    if-ge v3, v1, :cond_63

    aget-object v6, p3, v3
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_e} :catch_8b

    .line 5
    :try_start_e
    invoke-virtual {v6}, Lb/h/j/f$b;->c()Landroid/net/Uri;

    move-result-object v7

    const-string v8, "r"

    invoke-virtual {p1, v7, v8, p2}, Landroid/content/ContentResolver;->openFileDescriptor(Landroid/net/Uri;Ljava/lang/String;Landroid/os/CancellationSignal;)Landroid/os/ParcelFileDescriptor;

    move-result-object v7

    if-nez v7, :cond_20

    if-eqz v7, :cond_60

    .line 6
    :goto_1c
    invoke-virtual {v7}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_1f
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_1f} :catch_60
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_1f} :catch_8b

    goto :goto_60

    .line 7
    :cond_20
    :try_start_20
    new-instance v8, Landroid/graphics/fonts/Font$Builder;

    invoke-direct {v8, v7}, Landroid/graphics/fonts/Font$Builder;-><init>(Landroid/os/ParcelFileDescriptor;)V

    .line 8
    invoke-virtual {v6}, Lb/h/j/f$b;->d()I

    move-result v9

    invoke-virtual {v8, v9}, Landroid/graphics/fonts/Font$Builder;->setWeight(I)Landroid/graphics/fonts/Font$Builder;

    move-result-object v8

    .line 9
    invoke-virtual {v6}, Lb/h/j/f$b;->e()Z

    move-result v9

    if-eqz v9, :cond_34

    goto :goto_35

    :cond_34
    const/4 v5, 0x0

    :goto_35
    invoke-virtual {v8, v5}, Landroid/graphics/fonts/Font$Builder;->setSlant(I)Landroid/graphics/fonts/Font$Builder;

    move-result-object v5

    .line 10
    invoke-virtual {v6}, Lb/h/j/f$b;->b()I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/graphics/fonts/Font$Builder;->setTtcIndex(I)Landroid/graphics/fonts/Font$Builder;

    move-result-object v5

    .line 11
    invoke-virtual {v5}, Landroid/graphics/fonts/Font$Builder;->build()Landroid/graphics/fonts/Font;

    move-result-object v5

    if-nez v4, :cond_4e

    .line 12
    new-instance v6, Landroid/graphics/fonts/FontFamily$Builder;

    invoke-direct {v6, v5}, Landroid/graphics/fonts/FontFamily$Builder;-><init>(Landroid/graphics/fonts/Font;)V

    move-object v4, v6

    goto :goto_51

    .line 13
    :cond_4e
    invoke-virtual {v4, v5}, Landroid/graphics/fonts/FontFamily$Builder;->addFont(Landroid/graphics/fonts/Font;)Landroid/graphics/fonts/FontFamily$Builder;
    :try_end_51
    .catchall {:try_start_20 .. :try_end_51} :catchall_54

    :goto_51
    if-eqz v7, :cond_60

    goto :goto_1c

    :catchall_54
    move-exception v5

    if-eqz v7, :cond_5f

    .line 14
    :try_start_57
    invoke-virtual {v7}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_5a
    .catchall {:try_start_57 .. :try_end_5a} :catchall_5b

    goto :goto_5f

    :catchall_5b
    move-exception v6

    :try_start_5c
    invoke-virtual {v5, v6}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_5f
    :goto_5f
    throw v5
    :try_end_60
    .catch Ljava/io/IOException; {:try_start_5c .. :try_end_60} :catch_60
    .catch Ljava/lang/Exception; {:try_start_5c .. :try_end_60} :catch_8b

    :catch_60
    :cond_60
    :goto_60
    add-int/lit8 v3, v3, 0x1

    goto :goto_9

    :cond_63
    if-nez v4, :cond_66

    return-object v0

    .line 15
    :cond_66
    :try_start_66
    new-instance p1, Landroid/graphics/fonts/FontStyle;

    and-int/lit8 p2, p4, 0x1

    if-eqz p2, :cond_6f

    const/16 p2, 0x2bc

    goto :goto_71

    :cond_6f
    const/16 p2, 0x190

    :goto_71
    and-int/lit8 p3, p4, 0x2

    if-eqz p3, :cond_76

    const/4 v2, 0x1

    .line 16
    :cond_76
    invoke-direct {p1, p2, v2}, Landroid/graphics/fonts/FontStyle;-><init>(II)V

    .line 17
    new-instance p2, Landroid/graphics/Typeface$CustomFallbackBuilder;

    invoke-virtual {v4}, Landroid/graphics/fonts/FontFamily$Builder;->build()Landroid/graphics/fonts/FontFamily;

    move-result-object p3

    invoke-direct {p2, p3}, Landroid/graphics/Typeface$CustomFallbackBuilder;-><init>(Landroid/graphics/fonts/FontFamily;)V

    .line 18
    invoke-virtual {p2, p1}, Landroid/graphics/Typeface$CustomFallbackBuilder;->setStyle(Landroid/graphics/fonts/FontStyle;)Landroid/graphics/Typeface$CustomFallbackBuilder;

    move-result-object p1

    .line 19
    invoke-virtual {p1}, Landroid/graphics/Typeface$CustomFallbackBuilder;->build()Landroid/graphics/Typeface;

    move-result-object p1
    :try_end_8a
    .catch Ljava/lang/Exception; {:try_start_66 .. :try_end_8a} :catch_8b

    return-object p1

    :catch_8b
    return-object v0
.end method

.method public a(Landroid/content/Context;Lb/h/e/c/c$b;Landroid/content/res/Resources;I)Landroid/graphics/Typeface;
    .registers 13

    const/4 p1, 0x0

    .line 20
    :try_start_1
    invoke-virtual {p2}, Lb/h/e/c/c$b;->a()[Lb/h/e/c/c$c;

    move-result-object p2

    array-length v0, p2

    const/4 v1, 0x0

    move-object v3, p1

    const/4 v2, 0x0

    :goto_9
    const/4 v4, 0x1

    if-ge v2, v0, :cond_4e

    aget-object v5, p2, v2
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_e} :catch_75

    .line 21
    :try_start_e
    new-instance v6, Landroid/graphics/fonts/Font$Builder;

    invoke-virtual {v5}, Lb/h/e/c/c$c;->b()I

    move-result v7

    invoke-direct {v6, p3, v7}, Landroid/graphics/fonts/Font$Builder;-><init>(Landroid/content/res/Resources;I)V

    .line 22
    invoke-virtual {v5}, Lb/h/e/c/c$c;->e()I

    move-result v7

    invoke-virtual {v6, v7}, Landroid/graphics/fonts/Font$Builder;->setWeight(I)Landroid/graphics/fonts/Font$Builder;

    move-result-object v6

    .line 23
    invoke-virtual {v5}, Lb/h/e/c/c$c;->f()Z

    move-result v7

    if-eqz v7, :cond_26

    goto :goto_27

    :cond_26
    const/4 v4, 0x0

    :goto_27
    invoke-virtual {v6, v4}, Landroid/graphics/fonts/Font$Builder;->setSlant(I)Landroid/graphics/fonts/Font$Builder;

    move-result-object v4

    .line 24
    invoke-virtual {v5}, Lb/h/e/c/c$c;->c()I

    move-result v6

    invoke-virtual {v4, v6}, Landroid/graphics/fonts/Font$Builder;->setTtcIndex(I)Landroid/graphics/fonts/Font$Builder;

    move-result-object v4

    .line 25
    invoke-virtual {v5}, Lb/h/e/c/c$c;->d()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/graphics/fonts/Font$Builder;->setFontVariationSettings(Ljava/lang/String;)Landroid/graphics/fonts/Font$Builder;

    move-result-object v4

    .line 26
    invoke-virtual {v4}, Landroid/graphics/fonts/Font$Builder;->build()Landroid/graphics/fonts/Font;

    move-result-object v4

    if-nez v3, :cond_48

    .line 27
    new-instance v5, Landroid/graphics/fonts/FontFamily$Builder;

    invoke-direct {v5, v4}, Landroid/graphics/fonts/FontFamily$Builder;-><init>(Landroid/graphics/fonts/Font;)V

    move-object v3, v5

    goto :goto_4b

    .line 28
    :cond_48
    invoke-virtual {v3, v4}, Landroid/graphics/fonts/FontFamily$Builder;->addFont(Landroid/graphics/fonts/Font;)Landroid/graphics/fonts/FontFamily$Builder;
    :try_end_4b
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_4b} :catch_4b
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_4b} :catch_75

    :catch_4b
    :goto_4b
    add-int/lit8 v2, v2, 0x1

    goto :goto_9

    :cond_4e
    if-nez v3, :cond_51

    return-object p1

    .line 29
    :cond_51
    :try_start_51
    new-instance p2, Landroid/graphics/fonts/FontStyle;

    and-int/lit8 p3, p4, 0x1

    if-eqz p3, :cond_5a

    const/16 p3, 0x2bc

    goto :goto_5c

    :cond_5a
    const/16 p3, 0x190

    :goto_5c
    and-int/lit8 p4, p4, 0x2

    if-eqz p4, :cond_61

    const/4 v1, 0x1

    .line 30
    :cond_61
    invoke-direct {p2, p3, v1}, Landroid/graphics/fonts/FontStyle;-><init>(II)V

    .line 31
    new-instance p3, Landroid/graphics/Typeface$CustomFallbackBuilder;

    invoke-virtual {v3}, Landroid/graphics/fonts/FontFamily$Builder;->build()Landroid/graphics/fonts/FontFamily;

    move-result-object p4

    invoke-direct {p3, p4}, Landroid/graphics/Typeface$CustomFallbackBuilder;-><init>(Landroid/graphics/fonts/FontFamily;)V

    .line 32
    invoke-virtual {p3, p2}, Landroid/graphics/Typeface$CustomFallbackBuilder;->setStyle(Landroid/graphics/fonts/FontStyle;)Landroid/graphics/Typeface$CustomFallbackBuilder;

    move-result-object p2

    .line 33
    invoke-virtual {p2}, Landroid/graphics/Typeface$CustomFallbackBuilder;->build()Landroid/graphics/Typeface;

    move-result-object p1
    :try_end_75
    .catch Ljava/lang/Exception; {:try_start_51 .. :try_end_75} :catch_75

    :catch_75
    return-object p1
.end method

.method public a(Landroid/content/Context;Ljava/io/InputStream;)Landroid/graphics/Typeface;
    .registers 3

    .line 2
    new-instance p1, Ljava/lang/RuntimeException;

    const-string p2, "Do not use this function in API 29 or later."

    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public a([Lb/h/j/f$b;I)Lb/h/j/f$b;
    .registers 3

    .line 1
    new-instance p1, Ljava/lang/RuntimeException;

    const-string p2, "Do not use this function in API 29 or later."

    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
