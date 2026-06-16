.class public Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$ExtendedFloatingActionButtonBehavior;
.super Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;
.source "ExtendedFloatingActionButton.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ExtendedFloatingActionButtonBehavior"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;",
        ">",
        "Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior<",
        "TT;>;"
    }
.end annotation


# instance fields
.field public a:Landroid/graphics/Rect;

.field public b:Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$j;

.field public c:Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$j;

.field public d:Z

.field public e:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 1
    invoke-direct {p0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$ExtendedFloatingActionButtonBehavior;->d:Z

    const/4 v0, 0x1

    .line 3
    iput-boolean v0, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$ExtendedFloatingActionButtonBehavior;->e:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    .line 4
    invoke-direct {p0, p1, p2}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 5
    sget-object v0, Lc/a/a/a/l;->ExtendedFloatingActionButton_Behavior_Layout:[I

    .line 6
    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    .line 7
    sget p2, Lc/a/a/a/l;->ExtendedFloatingActionButton_Behavior_Layout_behavior_autoHide:I

    const/4 v0, 0x0

    .line 8
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p2

    iput-boolean p2, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$ExtendedFloatingActionButtonBehavior;->d:Z

    .line 9
    sget p2, Lc/a/a/a/l;->ExtendedFloatingActionButton_Behavior_Layout_behavior_autoShrink:I

    const/4 v0, 0x1

    .line 10
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p2

    iput-boolean p2, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$ExtendedFloatingActionButtonBehavior;->e:Z

    .line 11
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    return-void
.end method

.method public static a(Landroid/view/View;)Z
    .registers 2

    .line 10
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p0

    .line 11
    instance-of v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;

    if-eqz v0, :cond_11

    .line 12
    check-cast p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;

    invoke-virtual {p0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->d()Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;

    move-result-object p0

    instance-of p0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    return p0

    :cond_11
    const/4 p0, 0x0

    return p0
.end method


# virtual methods
.method public a(Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;)V
    .registers 3

    .line 4
    iget v0, p1, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->h:I

    if-nez v0, :cond_8

    const/16 v0, 0x50

    .line 5
    iput v0, p1, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->h:I

    :cond_8
    return-void
.end method

.method public a(Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;)V
    .registers 4

    .line 24
    iget-boolean v0, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$ExtendedFloatingActionButtonBehavior;->e:Z

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$ExtendedFloatingActionButtonBehavior;->c:Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$j;

    goto :goto_9

    :cond_7
    iget-object v0, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$ExtendedFloatingActionButtonBehavior;->b:Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$j;

    .line 25
    :goto_9
    iget-boolean v1, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$ExtendedFloatingActionButtonBehavior;->e:Z

    if-eqz v1, :cond_12

    .line 26
    invoke-static {p1}, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->g(Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;)Lc/a/a/a/c0/f;

    move-result-object v1

    goto :goto_16

    .line 27
    :cond_12
    invoke-static {p1}, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->h(Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;)Lc/a/a/a/c0/f;

    move-result-object v1

    .line 28
    :goto_16
    invoke-static {p1, v1, v0}, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->a(Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;Lc/a/a/a/c0/f;Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$j;)V

    return-void
.end method

.method public final a(Landroid/view/View;Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;)Z
    .registers 5

    .line 13
    invoke-virtual {p2}, Landroid/widget/Button;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p2

    check-cast p2, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;

    .line 14
    iget-boolean v0, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$ExtendedFloatingActionButtonBehavior;->d:Z

    const/4 v1, 0x0

    if-nez v0, :cond_10

    iget-boolean v0, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$ExtendedFloatingActionButtonBehavior;->e:Z

    if-nez v0, :cond_10

    return v1

    .line 15
    :cond_10
    invoke-virtual {p2}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->c()I

    move-result p2

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    if-eq p2, p1, :cond_1b

    return v1

    :cond_1b
    const/4 p1, 0x1

    return p1
.end method

.method public bridge synthetic a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;I)Z
    .registers 4

    .line 2
    check-cast p2, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;

    invoke-virtual {p0, p1, p2, p3}, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$ExtendedFloatingActionButtonBehavior;->a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;I)Z

    move-result p1

    return p1
.end method

.method public bridge synthetic a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/graphics/Rect;)Z
    .registers 4

    .line 1
    check-cast p2, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;

    invoke-virtual {p0, p1, p2, p3}, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$ExtendedFloatingActionButtonBehavior;->a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;Landroid/graphics/Rect;)Z

    move-result p1

    return p1
.end method

.method public final a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Lcom/google/android/material/appbar/AppBarLayout;Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;)Z
    .registers 5

    .line 16
    invoke-virtual {p0, p2, p3}, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$ExtendedFloatingActionButtonBehavior;->a(Landroid/view/View;Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;)Z

    move-result v0

    if-nez v0, :cond_8

    const/4 p1, 0x0

    return p1

    .line 17
    :cond_8
    iget-object v0, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$ExtendedFloatingActionButtonBehavior;->a:Landroid/graphics/Rect;

    if-nez v0, :cond_13

    .line 18
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$ExtendedFloatingActionButtonBehavior;->a:Landroid/graphics/Rect;

    .line 19
    :cond_13
    iget-object v0, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$ExtendedFloatingActionButtonBehavior;->a:Landroid/graphics/Rect;

    .line 20
    invoke-static {p1, p2, v0}, Lc/a/a/a/d0/c;->a(Landroid/view/ViewGroup;Landroid/view/View;Landroid/graphics/Rect;)V

    .line 21
    iget p1, v0, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {p2}, Lcom/google/android/material/appbar/AppBarLayout;->getMinimumHeightForVisibleOverlappingContent()I

    move-result p2

    if-gt p1, p2, :cond_24

    .line 22
    invoke-virtual {p0, p3}, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$ExtendedFloatingActionButtonBehavior;->b(Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;)V

    goto :goto_27

    .line 23
    :cond_24
    invoke-virtual {p0, p3}, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$ExtendedFloatingActionButtonBehavior;->a(Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;)V

    :goto_27
    const/4 p1, 0x1

    return p1
.end method

.method public a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;I)Z
    .registers 9

    .line 29
    invoke-virtual {p1, p2}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->b(Landroid/view/View;)Ljava/util/List;

    move-result-object v0

    .line 30
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x0

    :goto_9
    if-ge v2, v1, :cond_2e

    .line 31
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    .line 32
    instance-of v4, v3, Lcom/google/android/material/appbar/AppBarLayout;

    if-eqz v4, :cond_1e

    .line 33
    check-cast v3, Lcom/google/android/material/appbar/AppBarLayout;

    invoke-virtual {p0, p1, v3, p2}, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$ExtendedFloatingActionButtonBehavior;->a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Lcom/google/android/material/appbar/AppBarLayout;Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;)Z

    move-result v3

    if-eqz v3, :cond_2b

    goto :goto_2e

    .line 34
    :cond_1e
    invoke-static {v3}, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$ExtendedFloatingActionButtonBehavior;->a(Landroid/view/View;)Z

    move-result v4

    if-eqz v4, :cond_2b

    .line 35
    invoke-virtual {p0, v3, p2}, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$ExtendedFloatingActionButtonBehavior;->b(Landroid/view/View;Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;)Z

    move-result v3

    if-eqz v3, :cond_2b

    goto :goto_2e

    :cond_2b
    add-int/lit8 v2, v2, 0x1

    goto :goto_9

    .line 36
    :cond_2e
    :goto_2e
    invoke-virtual {p1, p2, p3}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->d(Landroid/view/View;I)V

    const/4 p1, 0x1

    return p1
.end method

.method public a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;Landroid/graphics/Rect;)Z
    .registers 4

    .line 3
    invoke-super {p0, p1, p2, p3}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;->a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/graphics/Rect;)Z

    move-result p1

    return p1
.end method

.method public a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;Landroid/view/View;)Z
    .registers 5

    .line 6
    instance-of v0, p3, Lcom/google/android/material/appbar/AppBarLayout;

    if-eqz v0, :cond_a

    .line 7
    check-cast p3, Lcom/google/android/material/appbar/AppBarLayout;

    invoke-virtual {p0, p1, p3, p2}, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$ExtendedFloatingActionButtonBehavior;->a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Lcom/google/android/material/appbar/AppBarLayout;Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;)Z

    goto :goto_13

    .line 8
    :cond_a
    invoke-static {p3}, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$ExtendedFloatingActionButtonBehavior;->a(Landroid/view/View;)Z

    move-result p1

    if-eqz p1, :cond_13

    .line 9
    invoke-virtual {p0, p3, p2}, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$ExtendedFloatingActionButtonBehavior;->b(Landroid/view/View;Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;)Z

    :cond_13
    :goto_13
    const/4 p1, 0x0

    return p1
.end method

.method public b(Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;)V
    .registers 4

    .line 7
    iget-boolean v0, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$ExtendedFloatingActionButtonBehavior;->e:Z

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$ExtendedFloatingActionButtonBehavior;->c:Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$j;

    goto :goto_9

    :cond_7
    iget-object v0, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$ExtendedFloatingActionButtonBehavior;->b:Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$j;

    .line 8
    :goto_9
    iget-boolean v1, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$ExtendedFloatingActionButtonBehavior;->e:Z

    if-eqz v1, :cond_12

    .line 9
    invoke-static {p1}, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->e(Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;)Lc/a/a/a/c0/f;

    move-result-object v1

    goto :goto_16

    .line 10
    :cond_12
    invoke-static {p1}, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->f(Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;)Lc/a/a/a/c0/f;

    move-result-object v1

    .line 11
    :goto_16
    invoke-static {p1, v1, v0}, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->a(Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;Lc/a/a/a/c0/f;Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$j;)V

    return-void
.end method

.method public final b(Landroid/view/View;Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;)Z
    .registers 5

    .line 2
    invoke-virtual {p0, p1, p2}, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$ExtendedFloatingActionButtonBehavior;->a(Landroid/view/View;Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;)Z

    move-result v0

    if-nez v0, :cond_8

    const/4 p1, 0x0

    return p1

    .line 3
    :cond_8
    invoke-virtual {p2}, Landroid/widget/Button;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;

    .line 4
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result p1

    invoke-virtual {p2}, Landroid/widget/Button;->getHeight()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    iget v0, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    add-int/2addr v1, v0

    if-ge p1, v1, :cond_21

    .line 5
    invoke-virtual {p0, p2}, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$ExtendedFloatingActionButtonBehavior;->b(Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;)V

    goto :goto_24

    .line 6
    :cond_21
    invoke-virtual {p0, p2}, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$ExtendedFloatingActionButtonBehavior;->a(Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;)V

    :goto_24
    const/4 p1, 0x1

    return p1
.end method

.method public bridge synthetic b(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;)Z
    .registers 4

    .line 1
    check-cast p2, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;

    invoke-virtual {p0, p1, p2, p3}, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$ExtendedFloatingActionButtonBehavior;->a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;Landroid/view/View;)Z

    move-result p1

    return p1
.end method
