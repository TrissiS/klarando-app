.class public Lb/h/m/y$h;
.super Ljava/lang/Object;
.source "ViewCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/h/m/y;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "h"
.end annotation


# direct methods
.method public static a(Landroid/view/View;)Lb/h/m/g0;
    .registers 1

    .line 1
    invoke-static {p0}, Lb/h/m/g0$a;->a(Landroid/view/View;)Lb/h/m/g0;

    move-result-object p0

    return-object p0
.end method

.method public static a(Landroid/view/View;Lb/h/m/g0;Landroid/graphics/Rect;)Lb/h/m/g0;
    .registers 4

    .line 2
    invoke-virtual {p1}, Lb/h/m/g0;->k()Landroid/view/WindowInsets;

    move-result-object v0

    if-eqz v0, :cond_f

    .line 3
    invoke-virtual {p0, v0, p2}, Landroid/view/View;->computeSystemWindowInsets(Landroid/view/WindowInsets;Landroid/graphics/Rect;)Landroid/view/WindowInsets;

    move-result-object p1

    .line 4
    invoke-static {p1, p0}, Lb/h/m/g0;->a(Landroid/view/WindowInsets;Landroid/view/View;)Lb/h/m/g0;

    move-result-object p0

    return-object p0

    .line 5
    :cond_f
    invoke-virtual {p2}, Landroid/graphics/Rect;->setEmpty()V

    return-object p1
.end method

.method public static a(Landroid/view/View;Lb/h/m/s;)V
    .registers 4

    .line 6
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    if-ge v0, v1, :cond_b

    .line 7
    sget v0, Lb/h/b;->tag_on_apply_window_listener:I

    invoke-virtual {p0, v0, p1}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    :cond_b
    if-nez p1, :cond_19

    .line 8
    sget p1, Lb/h/b;->tag_window_insets_animation_callback:I

    .line 9
    invoke-virtual {p0, p1}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View$OnApplyWindowInsetsListener;

    .line 10
    invoke-virtual {p0, p1}, Landroid/view/View;->setOnApplyWindowInsetsListener(Landroid/view/View$OnApplyWindowInsetsListener;)V

    return-void

    .line 11
    :cond_19
    new-instance v0, Lb/h/m/y$h$a;

    invoke-direct {v0, p0, p1}, Lb/h/m/y$h$a;-><init>(Landroid/view/View;Lb/h/m/s;)V

    invoke-virtual {p0, v0}, Landroid/view/View;->setOnApplyWindowInsetsListener(Landroid/view/View$OnApplyWindowInsetsListener;)V

    return-void
.end method

.method public static a(Landroid/view/WindowInsets;Landroid/view/View;)V
    .registers 3

    .line 12
    sget v0, Lb/h/b;->tag_window_insets_animation_callback:I

    .line 13
    invoke-virtual {p1, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View$OnApplyWindowInsetsListener;

    if-eqz v0, :cond_d

    .line 14
    invoke-interface {v0, p1, p0}, Landroid/view/View$OnApplyWindowInsetsListener;->onApplyWindowInsets(Landroid/view/View;Landroid/view/WindowInsets;)Landroid/view/WindowInsets;

    :cond_d
    return-void
.end method
