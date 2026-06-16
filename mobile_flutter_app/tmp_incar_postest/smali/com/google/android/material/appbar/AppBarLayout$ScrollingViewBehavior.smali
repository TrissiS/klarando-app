.class public Lcom/google/android/material/appbar/AppBarLayout$ScrollingViewBehavior;
.super Lcom/google/android/material/appbar/HeaderScrollingViewBehavior;
.source "AppBarLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/material/appbar/AppBarLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ScrollingViewBehavior"
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Lcom/google/android/material/appbar/HeaderScrollingViewBehavior;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    .line 2
    invoke-direct {p0, p1, p2}, Lcom/google/android/material/appbar/HeaderScrollingViewBehavior;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 3
    sget-object v0, Lc/a/a/a/l;->ScrollingViewBehavior_Layout:[I

    .line 4
    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    .line 5
    sget p2, Lc/a/a/a/l;->ScrollingViewBehavior_Layout_behavior_overlapTop:I

    const/4 v0, 0x0

    .line 6
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p2

    .line 7
    invoke-virtual {p0, p2}, Lcom/google/android/material/appbar/HeaderScrollingViewBehavior;->b(I)V

    .line 8
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    return-void
.end method

.method public static a(Lcom/google/android/material/appbar/AppBarLayout;)I
    .registers 2

    .line 17
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p0

    check-cast p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;

    invoke-virtual {p0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->d()Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;

    move-result-object p0

    .line 18
    instance-of v0, p0, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;

    if-eqz v0, :cond_15

    .line 19
    check-cast p0, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;

    invoke-virtual {p0}, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->d()I

    move-result p0

    return p0

    :cond_15
    const/4 p0, 0x0

    return p0
.end method


# virtual methods
.method public bridge synthetic a(Ljava/util/List;)Landroid/view/View;
    .registers 2

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/android/material/appbar/AppBarLayout$ScrollingViewBehavior;->a(Ljava/util/List;)Lcom/google/android/material/appbar/AppBarLayout;

    move-result-object p1

    return-object p1
.end method

.method public a(Ljava/util/List;)Lcom/google/android/material/appbar/AppBarLayout;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;)",
            "Lcom/google/android/material/appbar/AppBarLayout;"
        }
    .end annotation

    .line 20
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_5
    if-ge v1, v0, :cond_17

    .line 21
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    .line 22
    instance-of v3, v2, Lcom/google/android/material/appbar/AppBarLayout;

    if-eqz v3, :cond_14

    .line 23
    check-cast v2, Lcom/google/android/material/appbar/AppBarLayout;

    return-object v2

    :cond_14
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    :cond_17
    const/4 p1, 0x0

    return-object p1
.end method

.method public final a(Landroid/view/View;Landroid/view/View;)V
    .registers 6

    .line 9
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;

    invoke-virtual {v0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->d()Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;

    move-result-object v0

    .line 10
    instance-of v1, v0, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;

    if-eqz v1, :cond_2b

    .line 11
    check-cast v0, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;

    .line 12
    invoke-virtual {p2}, Landroid/view/View;->getBottom()I

    move-result v1

    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result v2

    sub-int/2addr v1, v2

    .line 13
    invoke-static {v0}, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->a(Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;)I

    move-result v0

    add-int/2addr v1, v0

    .line 14
    invoke-virtual {p0}, Lcom/google/android/material/appbar/HeaderScrollingViewBehavior;->d()I

    move-result v0

    add-int/2addr v1, v0

    .line 15
    invoke-virtual {p0, p2}, Lcom/google/android/material/appbar/HeaderScrollingViewBehavior;->a(Landroid/view/View;)I

    move-result p2

    sub-int/2addr v1, p2

    .line 16
    invoke-static {p1, v1}, Lb/h/m/y;->e(Landroid/view/View;I)V

    :cond_2b
    return-void
.end method

.method public a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/graphics/Rect;Z)Z
    .registers 8

    .line 3
    invoke-virtual {p1, p2}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->b(Landroid/view/View;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/android/material/appbar/AppBarLayout$ScrollingViewBehavior;->a(Ljava/util/List;)Lcom/google/android/material/appbar/AppBarLayout;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_30

    .line 4
    invoke-virtual {p2}, Landroid/view/View;->getLeft()I

    move-result v2

    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    move-result p2

    invoke-virtual {p3, v2, p2}, Landroid/graphics/Rect;->offset(II)V

    .line 5
    iget-object p2, p0, Lcom/google/android/material/appbar/HeaderScrollingViewBehavior;->d:Landroid/graphics/Rect;

    .line 6
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getWidth()I

    move-result v2

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getHeight()I

    move-result p1

    invoke-virtual {p2, v1, v1, v2, p1}, Landroid/graphics/Rect;->set(IIII)V

    .line 7
    invoke-virtual {p2, p3}, Landroid/graphics/Rect;->contains(Landroid/graphics/Rect;)Z

    move-result p1

    if-nez p1, :cond_30

    const/4 p1, 0x1

    xor-int/lit8 p2, p4, 0x1

    .line 8
    invoke-virtual {v0, v1, p2}, Lcom/google/android/material/appbar/AppBarLayout;->a(ZZ)V

    return p1

    :cond_30
    return v1
.end method

.method public a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;)Z
    .registers 4

    .line 2
    instance-of p1, p3, Lcom/google/android/material/appbar/AppBarLayout;

    return p1
.end method

.method public b(Landroid/view/View;)F
    .registers 6

    .line 3
    instance-of v0, p1, Lcom/google/android/material/appbar/AppBarLayout;

    const/4 v1, 0x0

    if-eqz v0, :cond_24

    .line 4
    check-cast p1, Lcom/google/android/material/appbar/AppBarLayout;

    .line 5
    invoke-virtual {p1}, Lcom/google/android/material/appbar/AppBarLayout;->getTotalScrollRange()I

    move-result v0

    .line 6
    invoke-virtual {p1}, Lcom/google/android/material/appbar/AppBarLayout;->getDownNestedPreScrollRange()I

    move-result v2

    .line 7
    invoke-static {p1}, Lcom/google/android/material/appbar/AppBarLayout$ScrollingViewBehavior;->a(Lcom/google/android/material/appbar/AppBarLayout;)I

    move-result p1

    if-eqz v2, :cond_1a

    add-int v3, v0, p1

    if-gt v3, v2, :cond_1a

    return v1

    :cond_1a
    sub-int/2addr v0, v2

    if-eqz v0, :cond_24

    const/high16 v1, 0x3f800000    # 1.0f

    int-to-float p1, p1

    int-to-float v0, v0

    div-float/2addr p1, v0

    add-float/2addr p1, v1

    return p1

    :cond_24
    return v1
.end method

.method public final b(Landroid/view/View;Landroid/view/View;)V
    .registers 4

    .line 8
    instance-of v0, p2, Lcom/google/android/material/appbar/AppBarLayout;

    if-eqz v0, :cond_13

    .line 9
    check-cast p2, Lcom/google/android/material/appbar/AppBarLayout;

    .line 10
    invoke-virtual {p2}, Lcom/google/android/material/appbar/AppBarLayout;->f()Z

    move-result v0

    if-eqz v0, :cond_13

    .line 11
    invoke-virtual {p2, p1}, Lcom/google/android/material/appbar/AppBarLayout;->b(Landroid/view/View;)Z

    move-result p1

    invoke-virtual {p2, p1}, Lcom/google/android/material/appbar/AppBarLayout;->b(Z)Z

    :cond_13
    return-void
.end method

.method public b(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;)Z
    .registers 4

    .line 1
    invoke-virtual {p0, p2, p3}, Lcom/google/android/material/appbar/AppBarLayout$ScrollingViewBehavior;->a(Landroid/view/View;Landroid/view/View;)V

    .line 2
    invoke-virtual {p0, p2, p3}, Lcom/google/android/material/appbar/AppBarLayout$ScrollingViewBehavior;->b(Landroid/view/View;Landroid/view/View;)V

    const/4 p1, 0x0

    return p1
.end method

.method public c(Landroid/view/View;)I
    .registers 3

    .line 4
    instance-of v0, p1, Lcom/google/android/material/appbar/AppBarLayout;

    if-eqz v0, :cond_b

    .line 5
    check-cast p1, Lcom/google/android/material/appbar/AppBarLayout;

    invoke-virtual {p1}, Lcom/google/android/material/appbar/AppBarLayout;->getTotalScrollRange()I

    move-result p1

    return p1

    .line 6
    :cond_b
    invoke-super {p0, p1}, Lcom/google/android/material/appbar/HeaderScrollingViewBehavior;->c(Landroid/view/View;)I

    move-result p1

    return p1
.end method

.method public c(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;)V
    .registers 4

    .line 1
    instance-of p2, p3, Lcom/google/android/material/appbar/AppBarLayout;

    if-eqz p2, :cond_16

    .line 2
    sget-object p2, Lb/h/m/h0/c$a;->h:Lb/h/m/h0/c$a;

    invoke-virtual {p2}, Lb/h/m/h0/c$a;->a()I

    move-result p2

    invoke-static {p1, p2}, Lb/h/m/y;->f(Landroid/view/View;I)V

    .line 3
    sget-object p2, Lb/h/m/h0/c$a;->i:Lb/h/m/h0/c$a;

    invoke-virtual {p2}, Lb/h/m/h0/c$a;->a()I

    move-result p2

    invoke-static {p1, p2}, Lb/h/m/y;->f(Landroid/view/View;I)V

    :cond_16
    return-void
.end method
