.class public Lc/b/a/a;
.super Ljava/lang/Object;
.source "BarConfig.java"


# instance fields
.field public final a:I

.field public final b:I

.field public final c:Z

.field public final d:I

.field public final e:I

.field public final f:Z

.field public final g:F


# direct methods
.method public constructor <init>(Landroid/app/Activity;)V
    .registers 5

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 3
    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->orientation:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_13

    const/4 v0, 0x1

    goto :goto_14

    :cond_13
    const/4 v0, 0x0

    :goto_14
    iput-boolean v0, p0, Lc/b/a/a;->f:Z

    .line 4
    invoke-virtual {p0, p1}, Lc/b/a/a;->b(Landroid/app/Activity;)F

    move-result v0

    iput v0, p0, Lc/b/a/a;->g:F

    const-string v0, "status_bar_height"

    .line 5
    invoke-virtual {p0, p1, v0}, Lc/b/a/a;->a(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lc/b/a/a;->a:I

    .line 6
    invoke-virtual {p0, p1}, Lc/b/a/a;->a(Landroid/app/Activity;)I

    move-result v0

    iput v0, p0, Lc/b/a/a;->b:I

    .line 7
    invoke-virtual {p0, p1}, Lc/b/a/a;->a(Landroid/content/Context;)I

    move-result v0

    iput v0, p0, Lc/b/a/a;->d:I

    .line 8
    invoke-virtual {p0, p1}, Lc/b/a/a;->b(Landroid/content/Context;)I

    move-result p1

    iput p1, p0, Lc/b/a/a;->e:I

    .line 9
    iget p1, p0, Lc/b/a/a;->d:I

    if-lez p1, :cond_3b

    const/4 v1, 0x1

    :cond_3b
    iput-boolean v1, p0, Lc/b/a/a;->c:Z

    return-void
.end method


# virtual methods
.method public a()I
    .registers 2

    .line 16
    iget v0, p0, Lc/b/a/a;->b:I

    return v0
.end method

.method public final a(Landroid/app/Activity;)I
    .registers 6
    .annotation build Landroid/annotation/TargetApi;
        value = 0xe
    .end annotation

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/4 v1, 0x0

    const/16 v2, 0xe

    if-lt v0, v2, :cond_37

    .line 2
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    sget v2, Lc/b/a/q;->action_bar_container:I

    invoke-virtual {v0, v2}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_17

    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v1

    :cond_17
    if-nez v1, :cond_37

    .line 4
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 5
    invoke-virtual {p1}, Landroid/app/Activity;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    const v2, 0x10102eb

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v0, v3}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 6
    iget v0, v0, Landroid/util/TypedValue;->data:I

    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/TypedValue;->complexToDimensionPixelSize(ILandroid/util/DisplayMetrics;)I

    move-result v1

    :cond_37
    return v1
.end method

.method public final a(Landroid/content/Context;)I
    .registers 4
    .annotation build Landroid/annotation/TargetApi;
        value = 0xe
    .end annotation

    .line 7
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xe

    if-lt v0, v1, :cond_1d

    .line 8
    move-object v0, p1

    check-cast v0, Landroid/app/Activity;

    invoke-virtual {p0, v0}, Lc/b/a/a;->c(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_1d

    .line 9
    iget-boolean v0, p0, Lc/b/a/a;->f:Z

    if-eqz v0, :cond_16

    const-string v0, "navigation_bar_height"

    goto :goto_18

    :cond_16
    const-string v0, "navigation_bar_height_landscape"

    .line 10
    :goto_18
    invoke-virtual {p0, p1, v0}, Lc/b/a/a;->a(Landroid/content/Context;Ljava/lang/String;)I

    move-result p1

    return p1

    :cond_1d
    const/4 p1, 0x0

    return p1
.end method

.method public final a(Landroid/content/Context;Ljava/lang/String;)I
    .registers 7

    const/4 v0, 0x0

    .line 11
    :try_start_1
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v1

    const-string v2, "dimen"

    const-string v3, "android"

    invoke-virtual {v1, p2, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result p2

    if-lez p2, :cond_46

    .line 12
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    .line 13
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    if-lt p2, v1, :cond_22

    return p2

    .line 14
    :cond_22
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    iget p1, p1, Landroid/util/DisplayMetrics;->density:F

    .line 15
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p2

    iget p2, p2, Landroid/util/DisplayMetrics;->density:F
    :try_end_36
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_1 .. :try_end_36} :catch_46

    int-to-float v0, v1

    mul-float v0, v0, p2

    div-float/2addr v0, p1

    const/4 p1, 0x0

    const/high16 p2, 0x3f000000    # 0.5f

    cmpl-float p1, v0, p1

    if-ltz p1, :cond_43

    add-float/2addr v0, p2

    goto :goto_44

    :cond_43
    sub-float/2addr v0, p2

    :goto_44
    float-to-int p1, v0

    return p1

    :catch_46
    :cond_46
    return v0
.end method

.method public final b(Landroid/app/Activity;)F
    .registers 5
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .line 4
    new-instance v0, Landroid/util/DisplayMetrics;

    invoke-direct {v0}, Landroid/util/DisplayMetrics;-><init>()V

    .line 5
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x10

    if-lt v1, v2, :cond_17

    .line 6
    invoke-virtual {p1}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object p1

    invoke-interface {p1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/view/Display;->getRealMetrics(Landroid/util/DisplayMetrics;)V

    goto :goto_22

    .line 7
    :cond_17
    invoke-virtual {p1}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object p1

    invoke-interface {p1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 8
    :goto_22
    iget p1, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float p1, p1

    iget v1, v0, Landroid/util/DisplayMetrics;->density:F

    div-float/2addr p1, v1

    .line 9
    iget v0, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    int-to-float v0, v0

    div-float/2addr v0, v1

    .line 10
    invoke-static {p1, v0}, Ljava/lang/Math;->min(FF)F

    move-result p1

    return p1
.end method

.method public b()I
    .registers 2

    .line 11
    iget v0, p0, Lc/b/a/a;->d:I

    return v0
.end method

.method public final b(Landroid/content/Context;)I
    .registers 4
    .annotation build Landroid/annotation/TargetApi;
        value = 0xe
    .end annotation

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xe

    if-lt v0, v1, :cond_16

    .line 2
    move-object v0, p1

    check-cast v0, Landroid/app/Activity;

    invoke-virtual {p0, v0}, Lc/b/a/a;->c(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_16

    const-string v0, "navigation_bar_width"

    .line 3
    invoke-virtual {p0, p1, v0}, Lc/b/a/a;->a(Landroid/content/Context;Ljava/lang/String;)I

    move-result p1

    return p1

    :cond_16
    const/4 p1, 0x0

    return p1
.end method

.method public c()I
    .registers 2

    .line 18
    iget v0, p0, Lc/b/a/a;->e:I

    return v0
.end method

.method public final c(Landroid/app/Activity;)Z
    .registers 7
    .annotation build Landroid/annotation/TargetApi;
        value = 0xe
    .end annotation

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x11

    const/4 v2, 0x0

    if-lt v0, v1, :cond_3f

    .line 2
    invoke-virtual {p1}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v3, "force_fsg_nav_bar"

    invoke-static {v0, v3, v2}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    if-eqz v0, :cond_14

    return v2

    .line 3
    :cond_14
    invoke-static {}, Lc/b/a/m;->e()Z

    move-result v0

    if-eqz v0, :cond_3f

    .line 4
    invoke-static {}, Lc/b/a/m;->h()Z

    move-result v0

    const-string v3, "navigationbar_is_min"

    if-nez v0, :cond_34

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x15

    if-ge v0, v4, :cond_29

    goto :goto_34

    .line 5
    :cond_29
    invoke-virtual {p1}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-static {v0, v3, v2}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    if-eqz v0, :cond_3f

    return v2

    .line 6
    :cond_34
    :goto_34
    invoke-virtual {p1}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-static {v0, v3, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    if-eqz v0, :cond_3f

    return v2

    .line 7
    :cond_3f
    invoke-virtual {p1}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object p1

    .line 8
    invoke-interface {p1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object p1

    .line 9
    new-instance v0, Landroid/util/DisplayMetrics;

    invoke-direct {v0}, Landroid/util/DisplayMetrics;-><init>()V

    .line 10
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v3, v1, :cond_53

    .line 11
    invoke-virtual {p1, v0}, Landroid/view/Display;->getRealMetrics(Landroid/util/DisplayMetrics;)V

    .line 12
    :cond_53
    iget v1, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 13
    iget v0, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 14
    new-instance v3, Landroid/util/DisplayMetrics;

    invoke-direct {v3}, Landroid/util/DisplayMetrics;-><init>()V

    .line 15
    invoke-virtual {p1, v3}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 16
    iget p1, v3, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 17
    iget v3, v3, Landroid/util/DisplayMetrics;->widthPixels:I

    sub-int/2addr v0, v3

    if-gtz v0, :cond_69

    sub-int/2addr v1, p1

    if-lez v1, :cond_6a

    :cond_69
    const/4 v2, 0x1

    :cond_6a
    return v2
.end method

.method public d()I
    .registers 2

    .line 1
    iget v0, p0, Lc/b/a/a;->a:I

    return v0
.end method

.method public e()Z
    .registers 2

    .line 1
    iget-boolean v0, p0, Lc/b/a/a;->c:Z

    return v0
.end method

.method public f()Z
    .registers 3

    .line 1
    iget v0, p0, Lc/b/a/a;->g:F

    const/high16 v1, 0x44160000    # 600.0f

    cmpl-float v0, v0, v1

    if-gez v0, :cond_f

    iget-boolean v0, p0, Lc/b/a/a;->f:Z

    if-eqz v0, :cond_d

    goto :goto_f

    :cond_d
    const/4 v0, 0x0

    goto :goto_10

    :cond_f
    :goto_f
    const/4 v0, 0x1

    :goto_10
    return v0
.end method
