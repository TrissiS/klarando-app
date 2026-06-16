.class public Lb/l/d/d;
.super Ljava/lang/Object;
.source "FragmentAnim.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lb/l/d/d$e;,
        Lb/l/d/d$d;
    }
.end annotation


# direct methods
.method public static a(IZ)I
    .registers 3

    const/16 v0, 0x1001

    if-eq p0, v0, :cond_1e

    const/16 v0, 0x1003

    if-eq p0, v0, :cond_16

    const/16 v0, 0x2002

    if-eq p0, v0, :cond_e

    const/4 p0, -0x1

    goto :goto_25

    :cond_e
    if-eqz p1, :cond_13

    .line 43
    sget p0, Lb/l/a;->fragment_close_enter:I

    goto :goto_25

    :cond_13
    sget p0, Lb/l/a;->fragment_close_exit:I

    goto :goto_25

    :cond_16
    if-eqz p1, :cond_1b

    .line 44
    sget p0, Lb/l/a;->fragment_fade_enter:I

    goto :goto_25

    :cond_1b
    sget p0, Lb/l/a;->fragment_fade_exit:I

    goto :goto_25

    :cond_1e
    if-eqz p1, :cond_23

    .line 45
    sget p0, Lb/l/a;->fragment_open_enter:I

    goto :goto_25

    :cond_23
    sget p0, Lb/l/a;->fragment_open_exit:I

    :goto_25
    return p0
.end method

.method public static a(Landroidx/fragment/app/Fragment;ZZ)I
    .registers 3

    if-eqz p2, :cond_e

    if-eqz p1, :cond_9

    .line 23
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->C()I

    move-result p0

    return p0

    .line 24
    :cond_9
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->D()I

    move-result p0

    return p0

    :cond_e
    if-eqz p1, :cond_15

    .line 25
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->p()I

    move-result p0

    return p0

    .line 26
    :cond_15
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->s()I

    move-result p0

    return p0
.end method

.method public static a(Landroid/content/Context;Landroidx/fragment/app/Fragment;ZZ)Lb/l/d/d$d;
    .registers 9

    .line 1
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->y()I

    move-result v0

    .line 2
    invoke-static {p1, p2, p3}, Lb/l/d/d;->a(Landroidx/fragment/app/Fragment;ZZ)I

    move-result p3

    const/4 v1, 0x0

    .line 3
    invoke-virtual {p1, v1, v1, v1, v1}, Landroidx/fragment/app/Fragment;->a(IIII)V

    .line 4
    iget-object v2, p1, Landroidx/fragment/app/Fragment;->N:Landroid/view/ViewGroup;

    const/4 v3, 0x0

    if-eqz v2, :cond_20

    sget v4, Lb/l/b;->visible_removing_fragment_view_tag:I

    .line 5
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getTag(I)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_20

    .line 6
    iget-object v2, p1, Landroidx/fragment/app/Fragment;->N:Landroid/view/ViewGroup;

    sget v4, Lb/l/b;->visible_removing_fragment_view_tag:I

    invoke-virtual {v2, v4, v3}, Landroid/view/ViewGroup;->setTag(ILjava/lang/Object;)V

    .line 7
    :cond_20
    iget-object v2, p1, Landroidx/fragment/app/Fragment;->N:Landroid/view/ViewGroup;

    if-eqz v2, :cond_2b

    invoke-virtual {v2}, Landroid/view/ViewGroup;->getLayoutTransition()Landroid/animation/LayoutTransition;

    move-result-object v2

    if-eqz v2, :cond_2b

    return-object v3

    .line 8
    :cond_2b
    invoke-virtual {p1, v0, p2, p3}, Landroidx/fragment/app/Fragment;->a(IZI)Landroid/view/animation/Animation;

    move-result-object v2

    if-eqz v2, :cond_37

    .line 9
    new-instance p0, Lb/l/d/d$d;

    invoke-direct {p0, v2}, Lb/l/d/d$d;-><init>(Landroid/view/animation/Animation;)V

    return-object p0

    .line 10
    :cond_37
    invoke-virtual {p1, v0, p2, p3}, Landroidx/fragment/app/Fragment;->b(IZI)Landroid/animation/Animator;

    move-result-object p1

    if-eqz p1, :cond_43

    .line 11
    new-instance p0, Lb/l/d/d$d;

    invoke-direct {p0, p1}, Lb/l/d/d$d;-><init>(Landroid/animation/Animator;)V

    return-object p0

    :cond_43
    if-nez p3, :cond_4b

    if-eqz v0, :cond_4b

    .line 12
    invoke-static {v0, p2}, Lb/l/d/d;->a(IZ)I

    move-result p3

    :cond_4b
    if-eqz p3, :cond_8d

    .line 13
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1, p3}, Landroid/content/res/Resources;->getResourceTypeName(I)Ljava/lang/String;

    move-result-object p1

    const-string p2, "anim"

    .line 14
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_6f

    .line 15
    :try_start_5d
    invoke-static {p0, p3}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object p2

    if-eqz p2, :cond_69

    .line 16
    new-instance v0, Lb/l/d/d$d;

    invoke-direct {v0, p2}, Lb/l/d/d$d;-><init>(Landroid/view/animation/Animation;)V
    :try_end_68
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_5d .. :try_end_68} :catch_6d
    .catch Ljava/lang/RuntimeException; {:try_start_5d .. :try_end_68} :catch_6b

    return-object v0

    :cond_69
    const/4 v1, 0x1

    goto :goto_6f

    :catch_6b
    nop

    goto :goto_6f

    :catch_6d
    move-exception p0

    .line 17
    throw p0

    :cond_6f
    :goto_6f
    if-nez v1, :cond_8d

    .line 18
    :try_start_71
    invoke-static {p0, p3}, Landroid/animation/AnimatorInflater;->loadAnimator(Landroid/content/Context;I)Landroid/animation/Animator;

    move-result-object p2

    if-eqz p2, :cond_8d

    .line 19
    new-instance v0, Lb/l/d/d$d;

    invoke-direct {v0, p2}, Lb/l/d/d$d;-><init>(Landroid/animation/Animator;)V
    :try_end_7c
    .catch Ljava/lang/RuntimeException; {:try_start_71 .. :try_end_7c} :catch_7d

    return-object v0

    :catch_7d
    move-exception p2

    if-nez p1, :cond_8c

    .line 20
    invoke-static {p0, p3}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object p0

    if-eqz p0, :cond_8d

    .line 21
    new-instance p1, Lb/l/d/d$d;

    invoke-direct {p1, p0}, Lb/l/d/d$d;-><init>(Landroid/view/animation/Animation;)V

    return-object p1

    .line 22
    :cond_8c
    throw p2

    :cond_8d
    return-object v3
.end method

.method public static a(Landroidx/fragment/app/Fragment;Lb/l/d/d$d;Lb/l/d/r$g;)V
    .registers 10

    .line 27
    iget-object v2, p0, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    .line 28
    iget-object v1, p0, Landroidx/fragment/app/Fragment;->N:Landroid/view/ViewGroup;

    .line 29
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->startViewTransition(Landroid/view/View;)V

    .line 30
    new-instance v5, Lb/h/i/b;

    invoke-direct {v5}, Lb/h/i/b;-><init>()V

    .line 31
    new-instance v0, Lb/l/d/d$a;

    invoke-direct {v0, p0}, Lb/l/d/d$a;-><init>(Landroidx/fragment/app/Fragment;)V

    invoke-virtual {v5, v0}, Lb/h/i/b;->a(Lb/h/i/b$a;)V

    .line 32
    invoke-interface {p2, p0, v5}, Lb/l/d/r$g;->b(Landroidx/fragment/app/Fragment;Lb/h/i/b;)V

    .line 33
    iget-object v0, p1, Lb/l/d/d$d;->a:Landroid/view/animation/Animation;

    if-eqz v0, :cond_35

    .line 34
    new-instance v0, Lb/l/d/d$e;

    iget-object p1, p1, Lb/l/d/d$d;->a:Landroid/view/animation/Animation;

    invoke-direct {v0, p1, v1, v2}, Lb/l/d/d$e;-><init>(Landroid/view/animation/Animation;Landroid/view/ViewGroup;Landroid/view/View;)V

    .line 35
    iget-object p1, p0, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    invoke-virtual {p0, p1}, Landroidx/fragment/app/Fragment;->a(Landroid/view/View;)V

    .line 36
    new-instance p1, Lb/l/d/d$b;

    invoke-direct {p1, v1, p0, p2, v5}, Lb/l/d/d$b;-><init>(Landroid/view/ViewGroup;Landroidx/fragment/app/Fragment;Lb/l/d/r$g;Lb/h/i/b;)V

    invoke-virtual {v0, p1}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 37
    iget-object p0, p0, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    invoke-virtual {p0, v0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    goto :goto_4d

    .line 38
    :cond_35
    iget-object p1, p1, Lb/l/d/d$d;->b:Landroid/animation/Animator;

    .line 39
    invoke-virtual {p0, p1}, Landroidx/fragment/app/Fragment;->a(Landroid/animation/Animator;)V

    .line 40
    new-instance v6, Lb/l/d/d$c;

    move-object v0, v6

    move-object v3, p0

    move-object v4, p2

    invoke-direct/range {v0 .. v5}, Lb/l/d/d$c;-><init>(Landroid/view/ViewGroup;Landroid/view/View;Landroidx/fragment/app/Fragment;Lb/l/d/r$g;Lb/h/i/b;)V

    invoke-virtual {p1, v6}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 41
    iget-object p0, p0, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    invoke-virtual {p1, p0}, Landroid/animation/Animator;->setTarget(Ljava/lang/Object;)V

    .line 42
    invoke-virtual {p1}, Landroid/animation/Animator;->start()V

    :goto_4d
    return-void
.end method
