.class public Lcom/google/android/material/appbar/AppBarLayout;
.super Landroid/widget/LinearLayout;
.source "AppBarLayout.java"

# interfaces
.implements Landroidx/coordinatorlayout/widget/CoordinatorLayout$b;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/material/appbar/AppBarLayout$ScrollingViewBehavior;,
        Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;,
        Lcom/google/android/material/appbar/AppBarLayout$Behavior;,
        Lcom/google/android/material/appbar/AppBarLayout$LayoutParams;,
        Lcom/google/android/material/appbar/AppBarLayout$d;,
        Lcom/google/android/material/appbar/AppBarLayout$c;
    }
.end annotation


# static fields
.field public static final y:I


# instance fields
.field public h:I

.field public i:I

.field public j:I

.field public k:I

.field public l:Z

.field public m:I

.field public n:Lb/h/m/g0;

.field public o:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/android/material/appbar/AppBarLayout$c;",
            ">;"
        }
    .end annotation
.end field

.field public p:Z

.field public q:Z

.field public r:Z

.field public s:Z

.field public t:I

.field public u:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public v:Landroid/animation/ValueAnimator;

.field public w:[I

.field public x:Landroid/graphics/drawable/Drawable;


# direct methods
.method public static constructor <clinit>()V
    .registers 1

    .line 1
    sget v0, Lc/a/a/a/k;->Widget_Design_AppBarLayout:I

    sput v0, Lcom/google/android/material/appbar/AppBarLayout;->y:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Lcom/google/android/material/appbar/AppBarLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    .line 2
    sget v0, Lc/a/a/a/b;->appBarLayoutStyle:I

    invoke-direct {p0, p1, p2, v0}, Lcom/google/android/material/appbar/AppBarLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 13

    .line 3
    sget v0, Lcom/google/android/material/appbar/AppBarLayout;->y:I

    invoke-static {p1, p2, p3, v0}, Lc/a/a/a/q0/a/a;->b(Landroid/content/Context;Landroid/util/AttributeSet;II)Landroid/content/Context;

    move-result-object p1

    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, -0x1

    .line 4
    iput p1, p0, Lcom/google/android/material/appbar/AppBarLayout;->i:I

    .line 5
    iput p1, p0, Lcom/google/android/material/appbar/AppBarLayout;->j:I

    .line 6
    iput p1, p0, Lcom/google/android/material/appbar/AppBarLayout;->k:I

    const/4 v0, 0x0

    .line 7
    iput v0, p0, Lcom/google/android/material/appbar/AppBarLayout;->m:I

    .line 8
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v7

    const/4 v1, 0x1

    .line 9
    invoke-virtual {p0, v1}, Lcom/google/android/material/appbar/AppBarLayout;->setOrientation(I)V

    .line 10
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v8, 0x15

    if-lt v1, v8, :cond_29

    .line 11
    invoke-static {p0}, Lc/a/a/a/n/b;->a(Landroid/view/View;)V

    .line 12
    sget v1, Lcom/google/android/material/appbar/AppBarLayout;->y:I

    invoke-static {p0, p2, p3, v1}, Lc/a/a/a/n/b;->a(Landroid/view/View;Landroid/util/AttributeSet;II)V

    .line 13
    :cond_29
    sget-object v3, Lc/a/a/a/l;->AppBarLayout:[I

    sget v5, Lcom/google/android/material/appbar/AppBarLayout;->y:I

    new-array v6, v0, [I

    move-object v1, v7

    move-object v2, p2

    move v4, p3

    .line 14
    invoke-static/range {v1 .. v6}, Lc/a/a/a/d0/m;->c(Landroid/content/Context;Landroid/util/AttributeSet;[III[I)Landroid/content/res/TypedArray;

    move-result-object p2

    .line 15
    sget p3, Lc/a/a/a/l;->AppBarLayout_android_background:I

    invoke-virtual {p2, p3}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p3

    invoke-static {p0, p3}, Lb/h/m/y;->a(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 16
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object p3

    instance-of p3, p3, Landroid/graphics/drawable/ColorDrawable;

    if-eqz p3, :cond_63

    .line 17
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object p3

    check-cast p3, Landroid/graphics/drawable/ColorDrawable;

    .line 18
    new-instance v1, Lc/a/a/a/l0/h;

    invoke-direct {v1}, Lc/a/a/a/l0/h;-><init>()V

    .line 19
    invoke-virtual {p3}, Landroid/graphics/drawable/ColorDrawable;->getColor()I

    move-result p3

    invoke-static {p3}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p3

    invoke-virtual {v1, p3}, Lc/a/a/a/l0/h;->a(Landroid/content/res/ColorStateList;)V

    .line 20
    invoke-virtual {v1, v7}, Lc/a/a/a/l0/h;->a(Landroid/content/Context;)V

    .line 21
    invoke-static {p0, v1}, Lb/h/m/y;->a(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 22
    :cond_63
    sget p3, Lc/a/a/a/l;->AppBarLayout_expanded:I

    invoke-virtual {p2, p3}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p3

    if-eqz p3, :cond_74

    .line 23
    sget p3, Lc/a/a/a/l;->AppBarLayout_expanded:I

    .line 24
    invoke-virtual {p2, p3, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p3

    .line 25
    invoke-virtual {p0, p3, v0, v0}, Lcom/google/android/material/appbar/AppBarLayout;->a(ZZZ)V

    .line 26
    :cond_74
    sget p3, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt p3, v8, :cond_8a

    sget p3, Lc/a/a/a/l;->AppBarLayout_elevation:I

    invoke-virtual {p2, p3}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p3

    if-eqz p3, :cond_8a

    .line 27
    sget p3, Lc/a/a/a/l;->AppBarLayout_elevation:I

    .line 28
    invoke-virtual {p2, p3, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p3

    int-to-float p3, p3

    .line 29
    invoke-static {p0, p3}, Lc/a/a/a/n/b;->a(Landroid/view/View;F)V

    .line 30
    :cond_8a
    sget p3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-lt p3, v1, :cond_b2

    .line 31
    sget p3, Lc/a/a/a/l;->AppBarLayout_android_keyboardNavigationCluster:I

    invoke-virtual {p2, p3}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p3

    if-eqz p3, :cond_a1

    .line 32
    sget p3, Lc/a/a/a/l;->AppBarLayout_android_keyboardNavigationCluster:I

    .line 33
    invoke-virtual {p2, p3, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p3

    .line 34
    invoke-virtual {p0, p3}, Landroid/widget/LinearLayout;->setKeyboardNavigationCluster(Z)V

    .line 35
    :cond_a1
    sget p3, Lc/a/a/a/l;->AppBarLayout_android_touchscreenBlocksFocus:I

    invoke-virtual {p2, p3}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p3

    if-eqz p3, :cond_b2

    .line 36
    sget p3, Lc/a/a/a/l;->AppBarLayout_android_touchscreenBlocksFocus:I

    .line 37
    invoke-virtual {p2, p3, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p3

    .line 38
    invoke-virtual {p0, p3}, Landroid/widget/LinearLayout;->setTouchscreenBlocksFocus(Z)V

    .line 39
    :cond_b2
    sget p3, Lc/a/a/a/l;->AppBarLayout_liftOnScroll:I

    invoke-virtual {p2, p3, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p3

    iput-boolean p3, p0, Lcom/google/android/material/appbar/AppBarLayout;->s:Z

    .line 40
    sget p3, Lc/a/a/a/l;->AppBarLayout_liftOnScrollTargetViewId:I

    .line 41
    invoke-virtual {p2, p3, p1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p1

    iput p1, p0, Lcom/google/android/material/appbar/AppBarLayout;->t:I

    .line 42
    sget p1, Lc/a/a/a/l;->AppBarLayout_statusBarForeground:I

    invoke-virtual {p2, p1}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/android/material/appbar/AppBarLayout;->setStatusBarForeground(Landroid/graphics/drawable/Drawable;)V

    .line 43
    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    .line 44
    new-instance p1, Lcom/google/android/material/appbar/AppBarLayout$a;

    invoke-direct {p1, p0}, Lcom/google/android/material/appbar/AppBarLayout$a;-><init>(Lcom/google/android/material/appbar/AppBarLayout;)V

    invoke-static {p0, p1}, Lb/h/m/y;->a(Landroid/view/View;Lb/h/m/s;)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)Landroid/view/View;
    .registers 5

    .line 28
    iget-object v0, p0, Lcom/google/android/material/appbar/AppBarLayout;->u:Ljava/lang/ref/WeakReference;

    const/4 v1, 0x0

    if-nez v0, :cond_31

    iget v0, p0, Lcom/google/android/material/appbar/AppBarLayout;->t:I

    const/4 v2, -0x1

    if-eq v0, v2, :cond_31

    if-eqz p1, :cond_11

    .line 29
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    goto :goto_12

    :cond_11
    move-object p1, v1

    :goto_12
    if-nez p1, :cond_28

    .line 30
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_28

    .line 31
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup;

    iget v0, p0, Lcom/google/android/material/appbar/AppBarLayout;->t:I

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object p1

    :cond_28
    if-eqz p1, :cond_31

    .line 32
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/google/android/material/appbar/AppBarLayout;->u:Ljava/lang/ref/WeakReference;

    .line 33
    :cond_31
    iget-object p1, p0, Lcom/google/android/material/appbar/AppBarLayout;->u:Ljava/lang/ref/WeakReference;

    if-eqz p1, :cond_3c

    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    move-object v1, p1

    check-cast v1, Landroid/view/View;

    :cond_3c
    return-object v1
.end method

.method public a(Lb/h/m/g0;)Lb/h/m/g0;
    .registers 4

    .line 37
    invoke-static {p0}, Lb/h/m/y;->o(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_8

    move-object v0, p1

    goto :goto_9

    :cond_8
    const/4 v0, 0x0

    .line 38
    :goto_9
    iget-object v1, p0, Lcom/google/android/material/appbar/AppBarLayout;->n:Lb/h/m/g0;

    invoke-static {v1, v0}, Lb/h/l/c;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_19

    .line 39
    iput-object v0, p0, Lcom/google/android/material/appbar/AppBarLayout;->n:Lb/h/m/g0;

    .line 40
    invoke-virtual {p0}, Lcom/google/android/material/appbar/AppBarLayout;->j()V

    .line 41
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->requestLayout()V

    :cond_19
    return-object p1
.end method

.method public final a()V
    .registers 2

    .line 34
    iget-object v0, p0, Lcom/google/android/material/appbar/AppBarLayout;->u:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_7

    .line 35
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->clear()V

    :cond_7
    const/4 v0, 0x0

    .line 36
    iput-object v0, p0, Lcom/google/android/material/appbar/AppBarLayout;->u:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method public a(I)V
    .registers 5

    .line 9
    iput p1, p0, Lcom/google/android/material/appbar/AppBarLayout;->h:I

    .line 10
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->willNotDraw()Z

    move-result v0

    if-nez v0, :cond_b

    .line 11
    invoke-static {p0}, Lb/h/m/y;->O(Landroid/view/View;)V

    .line 12
    :cond_b
    iget-object v0, p0, Lcom/google/android/material/appbar/AppBarLayout;->o:Ljava/util/List;

    if-eqz v0, :cond_26

    const/4 v1, 0x0

    .line 13
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    :goto_14
    if-ge v1, v0, :cond_26

    .line 14
    iget-object v2, p0, Lcom/google/android/material/appbar/AppBarLayout;->o:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/material/appbar/AppBarLayout$c;

    if-eqz v2, :cond_23

    .line 15
    invoke-interface {v2, p0, p1}, Lcom/google/android/material/appbar/AppBarLayout$c;->a(Lcom/google/android/material/appbar/AppBarLayout;I)V

    :cond_23
    add-int/lit8 v1, v1, 0x1

    goto :goto_14

    :cond_26
    return-void
.end method

.method public final a(Lc/a/a/a/l0/h;Z)V
    .registers 6

    .line 19
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lc/a/a/a/d;->design_appbar_elevation:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v0

    const/4 v1, 0x0

    if-eqz p2, :cond_f

    const/4 v2, 0x0

    goto :goto_10

    :cond_f
    move v2, v0

    :goto_10
    if-eqz p2, :cond_13

    goto :goto_14

    :cond_13
    const/4 v0, 0x0

    .line 20
    :goto_14
    iget-object p2, p0, Lcom/google/android/material/appbar/AppBarLayout;->v:Landroid/animation/ValueAnimator;

    if-eqz p2, :cond_1b

    .line 21
    invoke-virtual {p2}, Landroid/animation/ValueAnimator;->cancel()V

    :cond_1b
    const/4 p2, 0x2

    new-array p2, p2, [F

    const/4 v1, 0x0

    aput v2, p2, v1

    const/4 v1, 0x1

    aput v0, p2, v1

    .line 22
    invoke-static {p2}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object p2

    iput-object p2, p0, Lcom/google/android/material/appbar/AppBarLayout;->v:Landroid/animation/ValueAnimator;

    .line 23
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lc/a/a/a/g;->app_bar_elevation_anim_duration:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v0

    int-to-long v0, v0

    .line 24
    invoke-virtual {p2, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 25
    iget-object p2, p0, Lcom/google/android/material/appbar/AppBarLayout;->v:Landroid/animation/ValueAnimator;

    sget-object v0, Lc/a/a/a/m/a;->a:Landroid/animation/TimeInterpolator;

    invoke-virtual {p2, v0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 26
    iget-object p2, p0, Lcom/google/android/material/appbar/AppBarLayout;->v:Landroid/animation/ValueAnimator;

    new-instance v0, Lcom/google/android/material/appbar/AppBarLayout$b;

    invoke-direct {v0, p0, p1}, Lcom/google/android/material/appbar/AppBarLayout$b;-><init>(Lcom/google/android/material/appbar/AppBarLayout;Lc/a/a/a/l0/h;)V

    invoke-virtual {p2, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 27
    iget-object p1, p0, Lcom/google/android/material/appbar/AppBarLayout;->v:Landroid/animation/ValueAnimator;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    return-void
.end method

.method public a(Lcom/google/android/material/appbar/AppBarLayout$c;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/appbar/AppBarLayout;->o:Ljava/util/List;

    if-nez v0, :cond_b

    .line 2
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/material/appbar/AppBarLayout;->o:Ljava/util/List;

    :cond_b
    if-eqz p1, :cond_1a

    .line 3
    iget-object v0, p0, Lcom/google/android/material/appbar/AppBarLayout;->o:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1a

    .line 4
    iget-object v0, p0, Lcom/google/android/material/appbar/AppBarLayout;->o:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_1a
    return-void
.end method

.method public a(Lcom/google/android/material/appbar/AppBarLayout$d;)V
    .registers 2

    .line 5
    invoke-virtual {p0, p1}, Lcom/google/android/material/appbar/AppBarLayout;->a(Lcom/google/android/material/appbar/AppBarLayout$c;)V

    return-void
.end method

.method public a(ZZ)V
    .registers 4

    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0, p1, p2, v0}, Lcom/google/android/material/appbar/AppBarLayout;->a(ZZZ)V

    return-void
.end method

.method public final a(ZZZ)V
    .registers 5

    if-eqz p1, :cond_4

    const/4 p1, 0x1

    goto :goto_5

    :cond_4
    const/4 p1, 0x2

    :goto_5
    const/4 v0, 0x0

    if-eqz p2, :cond_a

    const/4 p2, 0x4

    goto :goto_b

    :cond_a
    const/4 p2, 0x0

    :goto_b
    or-int/2addr p1, p2

    if-eqz p3, :cond_10

    const/16 v0, 0x8

    :cond_10
    or-int/2addr p1, v0

    .line 7
    iput p1, p0, Lcom/google/android/material/appbar/AppBarLayout;->m:I

    .line 8
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->requestLayout()V

    return-void
.end method

.method public final a(Z)Z
    .registers 3

    .line 16
    iget-boolean v0, p0, Lcom/google/android/material/appbar/AppBarLayout;->q:Z

    if-eq v0, p1, :cond_b

    .line 17
    iput-boolean p1, p0, Lcom/google/android/material/appbar/AppBarLayout;->q:Z

    .line 18
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->refreshDrawableState()V

    const/4 p1, 0x1

    return p1

    :cond_b
    const/4 p1, 0x0

    return p1
.end method

.method public b(Lcom/google/android/material/appbar/AppBarLayout$c;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/appbar/AppBarLayout;->o:Ljava/util/List;

    if-eqz v0, :cond_9

    if-eqz p1, :cond_9

    .line 2
    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    :cond_9
    return-void
.end method

.method public b(Lcom/google/android/material/appbar/AppBarLayout$d;)V
    .registers 2

    .line 3
    invoke-virtual {p0, p1}, Lcom/google/android/material/appbar/AppBarLayout;->b(Lcom/google/android/material/appbar/AppBarLayout$c;)V

    return-void
.end method

.method public b()Z
    .registers 2

    .line 4
    iget-boolean v0, p0, Lcom/google/android/material/appbar/AppBarLayout;->l:Z

    return v0
.end method

.method public b(Landroid/view/View;)Z
    .registers 3

    .line 10
    invoke-virtual {p0, p1}, Lcom/google/android/material/appbar/AppBarLayout;->a(Landroid/view/View;)Landroid/view/View;

    move-result-object v0

    if-nez v0, :cond_7

    goto :goto_8

    :cond_7
    move-object p1, v0

    :goto_8
    if-eqz p1, :cond_19

    const/4 v0, -0x1

    .line 11
    invoke-virtual {p1, v0}, Landroid/view/View;->canScrollVertically(I)Z

    move-result v0

    if-nez v0, :cond_17

    invoke-virtual {p1}, Landroid/view/View;->getScrollY()I

    move-result p1

    if-lez p1, :cond_19

    :cond_17
    const/4 p1, 0x1

    goto :goto_1a

    :cond_19
    const/4 p1, 0x0

    :goto_1a
    return p1
.end method

.method public b(Z)Z
    .registers 3

    .line 5
    iget-boolean v0, p0, Lcom/google/android/material/appbar/AppBarLayout;->r:Z

    if-eq v0, p1, :cond_20

    .line 6
    iput-boolean p1, p0, Lcom/google/android/material/appbar/AppBarLayout;->r:Z

    .line 7
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->refreshDrawableState()V

    .line 8
    iget-boolean v0, p0, Lcom/google/android/material/appbar/AppBarLayout;->s:Z

    if-eqz v0, :cond_1e

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    instance-of v0, v0, Lc/a/a/a/l0/h;

    if-eqz v0, :cond_1e

    .line 9
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Lc/a/a/a/l0/h;

    invoke-virtual {p0, v0, p1}, Lcom/google/android/material/appbar/AppBarLayout;->a(Lc/a/a/a/l0/h;Z)V

    :cond_1e
    const/4 p1, 0x1

    return p1

    :cond_20
    const/4 p1, 0x0

    return p1
.end method

.method public final c()Z
    .registers 5

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_6
    if-ge v2, v0, :cond_1d

    .line 2
    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Lcom/google/android/material/appbar/AppBarLayout$LayoutParams;

    invoke-virtual {v3}, Lcom/google/android/material/appbar/AppBarLayout$LayoutParams;->c()Z

    move-result v3

    if-eqz v3, :cond_1a

    const/4 v0, 0x1

    return v0

    :cond_1a
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    :cond_1d
    return v1
.end method

.method public checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z
    .registers 2

    .line 1
    instance-of p1, p1, Lcom/google/android/material/appbar/AppBarLayout$LayoutParams;

    return p1
.end method

.method public d()Z
    .registers 2

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/appbar/AppBarLayout;->getTotalScrollRange()I

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    goto :goto_9

    :cond_8
    const/4 v0, 0x0

    :goto_9
    return v0
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .registers 5

    .line 1
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->draw(Landroid/graphics/Canvas;)V

    .line 2
    invoke-virtual {p0}, Lcom/google/android/material/appbar/AppBarLayout;->h()Z

    move-result v0

    if-eqz v0, :cond_1d

    .line 3
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v0

    const/4 v1, 0x0

    .line 4
    iget v2, p0, Lcom/google/android/material/appbar/AppBarLayout;->h:I

    neg-int v2, v2

    int-to-float v2, v2

    invoke-virtual {p1, v1, v2}, Landroid/graphics/Canvas;->translate(FF)V

    .line 5
    iget-object v1, p0, Lcom/google/android/material/appbar/AppBarLayout;->x:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 6
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V

    :cond_1d
    return-void
.end method

.method public drawableStateChanged()V
    .registers 4

    .line 1
    invoke-super {p0}, Landroid/widget/LinearLayout;->drawableStateChanged()V

    .line 2
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getDrawableState()[I

    move-result-object v0

    .line 3
    iget-object v1, p0, Lcom/google/android/material/appbar/AppBarLayout;->x:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_1a

    .line 4
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    move-result v2

    if-eqz v2, :cond_1a

    invoke-virtual {v1, v0}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    move-result v0

    if-eqz v0, :cond_1a

    .line 5
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->invalidateDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_1a
    return-void
.end method

.method public final e()V
    .registers 2

    const/4 v0, -0x1

    .line 1
    iput v0, p0, Lcom/google/android/material/appbar/AppBarLayout;->i:I

    .line 2
    iput v0, p0, Lcom/google/android/material/appbar/AppBarLayout;->j:I

    .line 3
    iput v0, p0, Lcom/google/android/material/appbar/AppBarLayout;->k:I

    return-void
.end method

.method public f()Z
    .registers 2

    .line 1
    iget-boolean v0, p0, Lcom/google/android/material/appbar/AppBarLayout;->s:Z

    return v0
.end method

.method public g()V
    .registers 2

    const/4 v0, 0x0

    .line 1
    iput v0, p0, Lcom/google/android/material/appbar/AppBarLayout;->m:I

    return-void
.end method

.method public bridge synthetic generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    .registers 2

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/appbar/AppBarLayout;->generateDefaultLayoutParams()Lcom/google/android/material/appbar/AppBarLayout$LayoutParams;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic generateDefaultLayoutParams()Landroid/widget/LinearLayout$LayoutParams;
    .registers 2

    .line 2
    invoke-virtual {p0}, Lcom/google/android/material/appbar/AppBarLayout;->generateDefaultLayoutParams()Lcom/google/android/material/appbar/AppBarLayout$LayoutParams;

    move-result-object v0

    return-object v0
.end method

.method public generateDefaultLayoutParams()Lcom/google/android/material/appbar/AppBarLayout$LayoutParams;
    .registers 4

    .line 3
    new-instance v0, Lcom/google/android/material/appbar/AppBarLayout$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {v0, v1, v2}, Lcom/google/android/material/appbar/AppBarLayout$LayoutParams;-><init>(II)V

    return-object v0
.end method

.method public bridge synthetic generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;
    .registers 2

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/android/material/appbar/AppBarLayout;->generateLayoutParams(Landroid/util/AttributeSet;)Lcom/google/android/material/appbar/AppBarLayout$LayoutParams;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    .registers 2

    .line 2
    invoke-virtual {p0, p1}, Lcom/google/android/material/appbar/AppBarLayout;->generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Lcom/google/android/material/appbar/AppBarLayout$LayoutParams;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic generateLayoutParams(Landroid/util/AttributeSet;)Landroid/widget/LinearLayout$LayoutParams;
    .registers 2

    .line 3
    invoke-virtual {p0, p1}, Lcom/google/android/material/appbar/AppBarLayout;->generateLayoutParams(Landroid/util/AttributeSet;)Lcom/google/android/material/appbar/AppBarLayout$LayoutParams;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/widget/LinearLayout$LayoutParams;
    .registers 2

    .line 4
    invoke-virtual {p0, p1}, Lcom/google/android/material/appbar/AppBarLayout;->generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Lcom/google/android/material/appbar/AppBarLayout$LayoutParams;

    move-result-object p1

    return-object p1
.end method

.method public generateLayoutParams(Landroid/util/AttributeSet;)Lcom/google/android/material/appbar/AppBarLayout$LayoutParams;
    .registers 4

    .line 5
    new-instance v0, Lcom/google/android/material/appbar/AppBarLayout$LayoutParams;

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lcom/google/android/material/appbar/AppBarLayout$LayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-object v0
.end method

.method public generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Lcom/google/android/material/appbar/AppBarLayout$LayoutParams;
    .registers 4

    .line 6
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_12

    instance-of v0, p1, Landroid/widget/LinearLayout$LayoutParams;

    if-eqz v0, :cond_12

    .line 7
    new-instance v0, Lcom/google/android/material/appbar/AppBarLayout$LayoutParams;

    check-cast p1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, p1}, Lcom/google/android/material/appbar/AppBarLayout$LayoutParams;-><init>(Landroid/widget/LinearLayout$LayoutParams;)V

    return-object v0

    .line 8
    :cond_12
    instance-of v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v0, :cond_1e

    .line 9
    new-instance v0, Lcom/google/android/material/appbar/AppBarLayout$LayoutParams;

    check-cast p1, Landroid/view/ViewGroup$MarginLayoutParams;

    invoke-direct {v0, p1}, Lcom/google/android/material/appbar/AppBarLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    return-object v0

    .line 10
    :cond_1e
    new-instance v0, Lcom/google/android/material/appbar/AppBarLayout$LayoutParams;

    invoke-direct {v0, p1}, Lcom/google/android/material/appbar/AppBarLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    return-object v0
.end method

.method public getBehavior()Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior<",
            "Lcom/google/android/material/appbar/AppBarLayout;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/google/android/material/appbar/AppBarLayout$Behavior;

    invoke-direct {v0}, Lcom/google/android/material/appbar/AppBarLayout$Behavior;-><init>()V

    return-object v0
.end method

.method public getDownNestedPreScrollRange()I
    .registers 10

    .line 1
    iget v0, p0, Lcom/google/android/material/appbar/AppBarLayout;->j:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_6

    return v0

    .line 2
    :cond_6
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_e
    if-ltz v0, :cond_59

    .line 3
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 4
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    check-cast v4, Lcom/google/android/material/appbar/AppBarLayout$LayoutParams;

    .line 5
    invoke-virtual {v3}, Landroid/view/View;->getMeasuredHeight()I

    move-result v5

    .line 6
    iget v6, v4, Lcom/google/android/material/appbar/AppBarLayout$LayoutParams;->a:I

    and-int/lit8 v7, v6, 0x5

    const/4 v8, 0x5

    if-ne v7, v8, :cond_53

    .line 7
    iget v7, v4, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    iget v4, v4, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    add-int/2addr v7, v4

    and-int/lit8 v4, v6, 0x8

    if-eqz v4, :cond_34

    .line 8
    invoke-static {v3}, Lb/h/m/y;->s(Landroid/view/View;)I

    move-result v4

    :goto_32
    add-int/2addr v7, v4

    goto :goto_40

    :cond_34
    and-int/lit8 v4, v6, 0x2

    if-eqz v4, :cond_3f

    .line 9
    invoke-static {v3}, Lb/h/m/y;->s(Landroid/view/View;)I

    move-result v4

    sub-int v4, v5, v4

    goto :goto_32

    :cond_3f
    add-int/2addr v7, v5

    :goto_40
    if-nez v0, :cond_51

    .line 10
    invoke-static {v3}, Lb/h/m/y;->o(Landroid/view/View;)Z

    move-result v3

    if-eqz v3, :cond_51

    .line 11
    invoke-virtual {p0}, Lcom/google/android/material/appbar/AppBarLayout;->getTopInset()I

    move-result v3

    sub-int/2addr v5, v3

    invoke-static {v7, v5}, Ljava/lang/Math;->min(II)I

    move-result v7

    :cond_51
    add-int/2addr v2, v7

    goto :goto_56

    :cond_53
    if-lez v2, :cond_56

    goto :goto_59

    :cond_56
    :goto_56
    add-int/lit8 v0, v0, -0x1

    goto :goto_e

    .line 12
    :cond_59
    :goto_59
    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Lcom/google/android/material/appbar/AppBarLayout;->j:I

    return v0
.end method

.method public getDownNestedScrollRange()I
    .registers 10

    .line 1
    iget v0, p0, Lcom/google/android/material/appbar/AppBarLayout;->k:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_6

    return v0

    .line 2
    :cond_6
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_d
    if-ge v2, v0, :cond_37

    .line 3
    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    .line 4
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    check-cast v5, Lcom/google/android/material/appbar/AppBarLayout$LayoutParams;

    .line 5
    invoke-virtual {v4}, Landroid/view/View;->getMeasuredHeight()I

    move-result v6

    .line 6
    iget v7, v5, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    iget v8, v5, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    add-int/2addr v7, v8

    add-int/2addr v6, v7

    .line 7
    iget v5, v5, Lcom/google/android/material/appbar/AppBarLayout$LayoutParams;->a:I

    and-int/lit8 v7, v5, 0x1

    if-eqz v7, :cond_37

    add-int/2addr v3, v6

    and-int/lit8 v5, v5, 0x2

    if-eqz v5, :cond_34

    .line 8
    invoke-static {v4}, Lb/h/m/y;->s(Landroid/view/View;)I

    move-result v0

    sub-int/2addr v3, v0

    goto :goto_37

    :cond_34
    add-int/lit8 v2, v2, 0x1

    goto :goto_d

    .line 9
    :cond_37
    :goto_37
    invoke-static {v1, v3}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Lcom/google/android/material/appbar/AppBarLayout;->k:I

    return v0
.end method

.method public getLiftOnScrollTargetViewId()I
    .registers 2

    .line 1
    iget v0, p0, Lcom/google/android/material/appbar/AppBarLayout;->t:I

    return v0
.end method

.method public final getMinimumHeightForVisibleOverlappingContent()I
    .registers 4

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/appbar/AppBarLayout;->getTopInset()I

    move-result v0

    .line 2
    invoke-static {p0}, Lb/h/m/y;->s(Landroid/view/View;)I

    move-result v1

    if-eqz v1, :cond_e

    :goto_a
    mul-int/lit8 v1, v1, 0x2

    add-int/2addr v1, v0

    return v1

    .line 3
    :cond_e
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v1

    const/4 v2, 0x1

    if-lt v1, v2, :cond_1f

    sub-int/2addr v1, v2

    .line 4
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-static {v1}, Lb/h/m/y;->s(Landroid/view/View;)I

    move-result v1

    goto :goto_20

    :cond_1f
    const/4 v1, 0x0

    :goto_20
    if-eqz v1, :cond_23

    goto :goto_a

    .line 5
    :cond_23
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getHeight()I

    move-result v0

    div-int/lit8 v0, v0, 0x3

    return v0
.end method

.method public getPendingAction()I
    .registers 2

    .line 1
    iget v0, p0, Lcom/google/android/material/appbar/AppBarLayout;->m:I

    return v0
.end method

.method public getStatusBarForeground()Landroid/graphics/drawable/Drawable;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/appbar/AppBarLayout;->x:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public getTargetElevation()F
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 v0, 0x0

    return v0
.end method

.method public final getTopInset()I
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/appbar/AppBarLayout;->n:Lb/h/m/g0;

    if-eqz v0, :cond_9

    invoke-virtual {v0}, Lb/h/m/g0;->h()I

    move-result v0

    goto :goto_a

    :cond_9
    const/4 v0, 0x0

    :goto_a
    return v0
.end method

.method public final getTotalScrollRange()I
    .registers 10

    .line 1
    iget v0, p0, Lcom/google/android/material/appbar/AppBarLayout;->i:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_6

    return v0

    .line 2
    :cond_6
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_d
    if-ge v2, v0, :cond_44

    .line 3
    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    .line 4
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    check-cast v5, Lcom/google/android/material/appbar/AppBarLayout$LayoutParams;

    .line 5
    invoke-virtual {v4}, Landroid/view/View;->getMeasuredHeight()I

    move-result v6

    .line 6
    iget v7, v5, Lcom/google/android/material/appbar/AppBarLayout$LayoutParams;->a:I

    and-int/lit8 v8, v7, 0x1

    if-eqz v8, :cond_44

    .line 7
    iget v8, v5, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    add-int/2addr v6, v8

    iget v5, v5, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    add-int/2addr v6, v5

    add-int/2addr v3, v6

    if-nez v2, :cond_37

    .line 8
    invoke-static {v4}, Lb/h/m/y;->o(Landroid/view/View;)Z

    move-result v5

    if-eqz v5, :cond_37

    .line 9
    invoke-virtual {p0}, Lcom/google/android/material/appbar/AppBarLayout;->getTopInset()I

    move-result v5

    sub-int/2addr v3, v5

    :cond_37
    and-int/lit8 v5, v7, 0x2

    if-eqz v5, :cond_41

    .line 10
    invoke-static {v4}, Lb/h/m/y;->s(Landroid/view/View;)I

    move-result v0

    sub-int/2addr v3, v0

    goto :goto_44

    :cond_41
    add-int/lit8 v2, v2, 0x1

    goto :goto_d

    .line 11
    :cond_44
    :goto_44
    invoke-static {v1, v3}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Lcom/google/android/material/appbar/AppBarLayout;->i:I

    return v0
.end method

.method public getUpNestedPreScrollRange()I
    .registers 2

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/appbar/AppBarLayout;->getTotalScrollRange()I

    move-result v0

    return v0
.end method

.method public final h()Z
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/appbar/AppBarLayout;->x:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_c

    invoke-virtual {p0}, Lcom/google/android/material/appbar/AppBarLayout;->getTopInset()I

    move-result v0

    if-lez v0, :cond_c

    const/4 v0, 0x1

    goto :goto_d

    :cond_c
    const/4 v0, 0x0

    :goto_d
    return v0
.end method

.method public final i()Z
    .registers 5

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    if-lez v0, :cond_1a

    .line 2
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v2

    const/16 v3, 0x8

    if-eq v2, v3, :cond_1a

    invoke-static {v0}, Lb/h/m/y;->o(Landroid/view/View;)Z

    move-result v0

    if-nez v0, :cond_1a

    const/4 v1, 0x1

    :cond_1a
    return v1
.end method

.method public final j()V
    .registers 2

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/appbar/AppBarLayout;->h()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setWillNotDraw(Z)V

    return-void
.end method

.method public onAttachedToWindow()V
    .registers 1

    .line 1
    invoke-super {p0}, Landroid/widget/LinearLayout;->onAttachedToWindow()V

    .line 2
    invoke-static {p0}, Lc/a/a/a/l0/i;->a(Landroid/view/View;)V

    return-void
.end method

.method public onCreateDrawableState(I)[I
    .registers 5

    .line 1
    iget-object v0, p0, Lcom/google/android/material/appbar/AppBarLayout;->w:[I

    if-nez v0, :cond_9

    const/4 v0, 0x4

    new-array v0, v0, [I

    .line 2
    iput-object v0, p0, Lcom/google/android/material/appbar/AppBarLayout;->w:[I

    .line 3
    :cond_9
    iget-object v0, p0, Lcom/google/android/material/appbar/AppBarLayout;->w:[I

    .line 4
    array-length v1, v0

    add-int/2addr p1, v1

    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onCreateDrawableState(I)[I

    move-result-object p1

    const/4 v1, 0x0

    .line 5
    iget-boolean v2, p0, Lcom/google/android/material/appbar/AppBarLayout;->q:Z

    if-eqz v2, :cond_19

    sget v2, Lc/a/a/a/b;->state_liftable:I

    goto :goto_1c

    :cond_19
    sget v2, Lc/a/a/a/b;->state_liftable:I

    neg-int v2, v2

    :goto_1c
    aput v2, v0, v1

    const/4 v1, 0x1

    .line 6
    iget-boolean v2, p0, Lcom/google/android/material/appbar/AppBarLayout;->q:Z

    if-eqz v2, :cond_2a

    iget-boolean v2, p0, Lcom/google/android/material/appbar/AppBarLayout;->r:Z

    if-eqz v2, :cond_2a

    sget v2, Lc/a/a/a/b;->state_lifted:I

    goto :goto_2d

    :cond_2a
    sget v2, Lc/a/a/a/b;->state_lifted:I

    neg-int v2, v2

    :goto_2d
    aput v2, v0, v1

    const/4 v1, 0x2

    .line 7
    iget-boolean v2, p0, Lcom/google/android/material/appbar/AppBarLayout;->q:Z

    if-eqz v2, :cond_37

    sget v2, Lc/a/a/a/b;->state_collapsible:I

    goto :goto_3a

    :cond_37
    sget v2, Lc/a/a/a/b;->state_collapsible:I

    neg-int v2, v2

    :goto_3a
    aput v2, v0, v1

    const/4 v1, 0x3

    .line 8
    iget-boolean v2, p0, Lcom/google/android/material/appbar/AppBarLayout;->q:Z

    if-eqz v2, :cond_48

    iget-boolean v2, p0, Lcom/google/android/material/appbar/AppBarLayout;->r:Z

    if-eqz v2, :cond_48

    sget v2, Lc/a/a/a/b;->state_collapsed:I

    goto :goto_4b

    :cond_48
    sget v2, Lc/a/a/a/b;->state_collapsed:I

    neg-int v2, v2

    :goto_4b
    aput v2, v0, v1

    .line 9
    invoke-static {p1, v0}, Landroid/widget/LinearLayout;->mergeDrawableStates([I[I)[I

    move-result-object p1

    return-object p1
.end method

.method public onDetachedFromWindow()V
    .registers 1

    .line 1
    invoke-super {p0}, Landroid/widget/LinearLayout;->onDetachedFromWindow()V

    .line 2
    invoke-virtual {p0}, Lcom/google/android/material/appbar/AppBarLayout;->a()V

    return-void
.end method

.method public onLayout(ZIIII)V
    .registers 6

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/widget/LinearLayout;->onLayout(ZIIII)V

    .line 2
    invoke-static {p0}, Lb/h/m/y;->o(Landroid/view/View;)Z

    move-result p1

    const/4 p2, 0x1

    if-eqz p1, :cond_25

    invoke-virtual {p0}, Lcom/google/android/material/appbar/AppBarLayout;->i()Z

    move-result p1

    if-eqz p1, :cond_25

    .line 3
    invoke-virtual {p0}, Lcom/google/android/material/appbar/AppBarLayout;->getTopInset()I

    move-result p1

    .line 4
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result p3

    sub-int/2addr p3, p2

    :goto_19
    if-ltz p3, :cond_25

    .line 5
    invoke-virtual {p0, p3}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object p4

    invoke-static {p4, p1}, Lb/h/m/y;->e(Landroid/view/View;I)V

    add-int/lit8 p3, p3, -0x1

    goto :goto_19

    .line 6
    :cond_25
    invoke-virtual {p0}, Lcom/google/android/material/appbar/AppBarLayout;->e()V

    const/4 p1, 0x0

    .line 7
    iput-boolean p1, p0, Lcom/google/android/material/appbar/AppBarLayout;->l:Z

    .line 8
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result p3

    const/4 p4, 0x0

    :goto_30
    if-ge p4, p3, :cond_48

    .line 9
    invoke-virtual {p0, p4}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object p5

    .line 10
    invoke-virtual {p5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p5

    check-cast p5, Lcom/google/android/material/appbar/AppBarLayout$LayoutParams;

    .line 11
    invoke-virtual {p5}, Lcom/google/android/material/appbar/AppBarLayout$LayoutParams;->b()Landroid/view/animation/Interpolator;

    move-result-object p5

    if-eqz p5, :cond_45

    .line 12
    iput-boolean p2, p0, Lcom/google/android/material/appbar/AppBarLayout;->l:Z

    goto :goto_48

    :cond_45
    add-int/lit8 p4, p4, 0x1

    goto :goto_30

    .line 13
    :cond_48
    :goto_48
    iget-object p3, p0, Lcom/google/android/material/appbar/AppBarLayout;->x:Landroid/graphics/drawable/Drawable;

    if-eqz p3, :cond_57

    .line 14
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getWidth()I

    move-result p4

    invoke-virtual {p0}, Lcom/google/android/material/appbar/AppBarLayout;->getTopInset()I

    move-result p5

    invoke-virtual {p3, p1, p1, p4, p5}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 15
    :cond_57
    iget-boolean p3, p0, Lcom/google/android/material/appbar/AppBarLayout;->p:Z

    if-nez p3, :cond_6a

    .line 16
    iget-boolean p3, p0, Lcom/google/android/material/appbar/AppBarLayout;->s:Z

    if-nez p3, :cond_67

    invoke-virtual {p0}, Lcom/google/android/material/appbar/AppBarLayout;->c()Z

    move-result p3

    if-eqz p3, :cond_66

    goto :goto_67

    :cond_66
    const/4 p2, 0x0

    :cond_67
    :goto_67
    invoke-virtual {p0, p2}, Lcom/google/android/material/appbar/AppBarLayout;->a(Z)Z

    :cond_6a
    return-void
.end method

.method public onMeasure(II)V
    .registers 5

    .line 1
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    .line 2
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result p1

    const/high16 v0, 0x40000000    # 2.0f

    if-eq p1, v0, :cond_41

    .line 3
    invoke-static {p0}, Lb/h/m/y;->o(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_41

    .line 4
    invoke-virtual {p0}, Lcom/google/android/material/appbar/AppBarLayout;->i()Z

    move-result v0

    if-eqz v0, :cond_41

    .line 5
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getMeasuredHeight()I

    move-result v0

    const/high16 v1, -0x80000000

    if-eq p1, v1, :cond_28

    if-eqz p1, :cond_22

    goto :goto_3a

    .line 6
    :cond_22
    invoke-virtual {p0}, Lcom/google/android/material/appbar/AppBarLayout;->getTopInset()I

    move-result p1

    add-int/2addr v0, p1

    goto :goto_3a

    .line 7
    :cond_28
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getMeasuredHeight()I

    move-result p1

    invoke-virtual {p0}, Lcom/google/android/material/appbar/AppBarLayout;->getTopInset()I

    move-result v0

    add-int/2addr p1, v0

    const/4 v0, 0x0

    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p2

    .line 8
    invoke-static {p1, v0, p2}, Lb/h/h/a;->a(III)I

    move-result v0

    .line 9
    :goto_3a
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getMeasuredWidth()I

    move-result p1

    invoke-virtual {p0, p1, v0}, Landroid/widget/LinearLayout;->setMeasuredDimension(II)V

    .line 10
    :cond_41
    invoke-virtual {p0}, Lcom/google/android/material/appbar/AppBarLayout;->e()V

    return-void
.end method

.method public setElevation(F)V
    .registers 2

    .line 1
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->setElevation(F)V

    .line 2
    invoke-static {p0, p1}, Lc/a/a/a/l0/i;->a(Landroid/view/View;F)V

    return-void
.end method

.method public setExpanded(Z)V
    .registers 3

    .line 1
    invoke-static {p0}, Lb/h/m/y;->K(Landroid/view/View;)Z

    move-result v0

    invoke-virtual {p0, p1, v0}, Lcom/google/android/material/appbar/AppBarLayout;->a(ZZ)V

    return-void
.end method

.method public setLiftOnScroll(Z)V
    .registers 2

    .line 1
    iput-boolean p1, p0, Lcom/google/android/material/appbar/AppBarLayout;->s:Z

    return-void
.end method

.method public setLiftOnScrollTargetViewId(I)V
    .registers 2

    .line 1
    iput p1, p0, Lcom/google/android/material/appbar/AppBarLayout;->t:I

    .line 2
    invoke-virtual {p0}, Lcom/google/android/material/appbar/AppBarLayout;->a()V

    return-void
.end method

.method public setOrientation(I)V
    .registers 3

    const/4 v0, 0x1

    if-ne p1, v0, :cond_7

    .line 1
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    return-void

    .line 2
    :cond_7
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "AppBarLayout is always vertical and does not support horizontal orientation"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setStatusBarForeground(Landroid/graphics/drawable/Drawable;)V
    .registers 4

    .line 1
    iget-object v0, p0, Lcom/google/android/material/appbar/AppBarLayout;->x:Landroid/graphics/drawable/Drawable;

    if-eq v0, p1, :cond_46

    const/4 v1, 0x0

    if-eqz v0, :cond_a

    .line 2
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    :cond_a
    if-eqz p1, :cond_10

    .line 3
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    :cond_10
    iput-object v1, p0, Lcom/google/android/material/appbar/AppBarLayout;->x:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_40

    .line 4
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    move-result p1

    if-eqz p1, :cond_23

    .line 5
    iget-object p1, p0, Lcom/google/android/material/appbar/AppBarLayout;->x:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getDrawableState()[I

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 6
    :cond_23
    iget-object p1, p0, Lcom/google/android/material/appbar/AppBarLayout;->x:Landroid/graphics/drawable/Drawable;

    invoke-static {p0}, Lb/h/m/y;->r(Landroid/view/View;)I

    move-result v0

    invoke-static {p1, v0}, Lb/h/f/l/a;->a(Landroid/graphics/drawable/Drawable;I)Z

    .line 7
    iget-object p1, p0, Lcom/google/android/material/appbar/AppBarLayout;->x:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getVisibility()I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_37

    const/4 v0, 0x1

    goto :goto_38

    :cond_37
    const/4 v0, 0x0

    :goto_38
    invoke-virtual {p1, v0, v1}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    .line 8
    iget-object p1, p0, Lcom/google/android/material/appbar/AppBarLayout;->x:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p1, p0}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 9
    :cond_40
    invoke-virtual {p0}, Lcom/google/android/material/appbar/AppBarLayout;->j()V

    .line 10
    invoke-static {p0}, Lb/h/m/y;->O(Landroid/view/View;)V

    :cond_46
    return-void
.end method

.method public setStatusBarForegroundColor(I)V
    .registers 3

    .line 1
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v0, p1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {p0, v0}, Lcom/google/android/material/appbar/AppBarLayout;->setStatusBarForeground(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public setStatusBarForegroundResource(I)V
    .registers 3

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lb/b/l/a/a;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/android/material/appbar/AppBarLayout;->setStatusBarForeground(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public setTargetElevation(F)V
    .registers 4
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_9

    .line 2
    invoke-static {p0, p1}, Lc/a/a/a/n/b;->a(Landroid/view/View;F)V

    :cond_9
    return-void
.end method

.method public setVisibility(I)V
    .registers 4

    .line 1
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    const/4 v0, 0x0

    if-nez p1, :cond_8

    const/4 p1, 0x1

    goto :goto_9

    :cond_8
    const/4 p1, 0x0

    .line 2
    :goto_9
    iget-object v1, p0, Lcom/google/android/material/appbar/AppBarLayout;->x:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_10

    .line 3
    invoke-virtual {v1, p1, v0}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    :cond_10
    return-void
.end method

.method public verifyDrawable(Landroid/graphics/drawable/Drawable;)Z
    .registers 3

    .line 1
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->verifyDrawable(Landroid/graphics/drawable/Drawable;)Z

    move-result v0

    if-nez v0, :cond_d

    iget-object v0, p0, Lcom/google/android/material/appbar/AppBarLayout;->x:Landroid/graphics/drawable/Drawable;

    if-ne p1, v0, :cond_b

    goto :goto_d

    :cond_b
    const/4 p1, 0x0

    goto :goto_e

    :cond_d
    :goto_d
    const/4 p1, 0x1

    :goto_e
    return p1
.end method
