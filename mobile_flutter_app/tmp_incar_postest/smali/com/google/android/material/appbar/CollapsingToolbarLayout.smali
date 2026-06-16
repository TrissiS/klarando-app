.class public Lcom/google/android/material/appbar/CollapsingToolbarLayout;
.super Landroid/widget/FrameLayout;
.source "CollapsingToolbarLayout.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/material/appbar/CollapsingToolbarLayout$c;,
        Lcom/google/android/material/appbar/CollapsingToolbarLayout$LayoutParams;
    }
.end annotation


# static fields
.field public static final K:I


# instance fields
.field public A:J

.field public B:I

.field public C:Lcom/google/android/material/appbar/AppBarLayout$d;

.field public D:I

.field public E:I

.field public F:Lb/h/m/g0;

.field public G:I

.field public H:Z

.field public I:I

.field public J:Z

.field public h:Z

.field public i:I

.field public j:Landroid/view/ViewGroup;

.field public k:Landroid/view/View;

.field public l:Landroid/view/View;

.field public m:I

.field public n:I

.field public o:I

.field public p:I

.field public final q:Landroid/graphics/Rect;

.field public final r:Lc/a/a/a/d0/a;

.field public final s:Lc/a/a/a/a0/a;

.field public t:Z

.field public u:Z

.field public v:Landroid/graphics/drawable/Drawable;

.field public w:Landroid/graphics/drawable/Drawable;

.field public x:I

.field public y:Z

.field public z:Landroid/animation/ValueAnimator;


# direct methods
.method public static constructor <clinit>()V
    .registers 1

    .line 1
    sget v0, Lc/a/a/a/k;->Widget_Design_CollapsingToolbar:I

    sput v0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->K:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    .line 2
    sget v0, Lc/a/a/a/b;->collapsingToolbarLayoutStyle:I

    invoke-direct {p0, p1, p2, v0}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 12

    .line 3
    sget v0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->K:I

    invoke-static {p1, p2, p3, v0}, Lc/a/a/a/q0/a/a;->b(Landroid/content/Context;Landroid/util/AttributeSet;II)Landroid/content/Context;

    move-result-object p1

    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x1

    .line 4
    iput-boolean p1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->h:Z

    .line 5
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->q:Landroid/graphics/Rect;

    const/4 v0, -0x1

    .line 6
    iput v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->B:I

    const/4 v1, 0x0

    .line 7
    iput v1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->G:I

    .line 8
    iput v1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->I:I

    .line 9
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v2

    .line 10
    new-instance v3, Lc/a/a/a/d0/a;

    invoke-direct {v3, p0}, Lc/a/a/a/d0/a;-><init>(Landroid/view/View;)V

    iput-object v3, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->r:Lc/a/a/a/d0/a;

    .line 11
    sget-object v4, Lc/a/a/a/m/a;->e:Landroid/animation/TimeInterpolator;

    invoke-virtual {v3, v4}, Lc/a/a/a/d0/a;->b(Landroid/animation/TimeInterpolator;)V

    .line 12
    iget-object v3, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->r:Lc/a/a/a/d0/a;

    invoke-virtual {v3, v1}, Lc/a/a/a/d0/a;->d(Z)V

    .line 13
    new-instance v3, Lc/a/a/a/a0/a;

    invoke-direct {v3, v2}, Lc/a/a/a/a0/a;-><init>(Landroid/content/Context;)V

    iput-object v3, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->s:Lc/a/a/a/a0/a;

    .line 14
    sget-object v4, Lc/a/a/a/l;->CollapsingToolbarLayout:[I

    sget v6, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->K:I

    new-array v7, v1, [I

    move-object v3, p2

    move v5, p3

    .line 15
    invoke-static/range {v2 .. v7}, Lc/a/a/a/d0/m;->c(Landroid/content/Context;Landroid/util/AttributeSet;[III[I)Landroid/content/res/TypedArray;

    move-result-object p2

    .line 16
    iget-object p3, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->r:Lc/a/a/a/d0/a;

    sget v2, Lc/a/a/a/l;->CollapsingToolbarLayout_expandedTitleGravity:I

    const v3, 0x800053

    .line 17
    invoke-virtual {p2, v2, v3}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    .line 18
    invoke-virtual {p3, v2}, Lc/a/a/a/d0/a;->e(I)V

    .line 19
    iget-object p3, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->r:Lc/a/a/a/d0/a;

    sget v2, Lc/a/a/a/l;->CollapsingToolbarLayout_collapsedTitleGravity:I

    const v3, 0x800013

    .line 20
    invoke-virtual {p2, v2, v3}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    .line 21
    invoke-virtual {p3, v2}, Lc/a/a/a/d0/a;->b(I)V

    .line 22
    sget p3, Lc/a/a/a/l;->CollapsingToolbarLayout_expandedTitleMargin:I

    .line 23
    invoke-virtual {p2, p3, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p3

    iput p3, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->p:I

    iput p3, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->o:I

    iput p3, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->n:I

    iput p3, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->m:I

    .line 24
    sget p3, Lc/a/a/a/l;->CollapsingToolbarLayout_expandedTitleMarginStart:I

    invoke-virtual {p2, p3}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p3

    if-eqz p3, :cond_7d

    .line 25
    sget p3, Lc/a/a/a/l;->CollapsingToolbarLayout_expandedTitleMarginStart:I

    .line 26
    invoke-virtual {p2, p3, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p3

    iput p3, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->m:I

    .line 27
    :cond_7d
    sget p3, Lc/a/a/a/l;->CollapsingToolbarLayout_expandedTitleMarginEnd:I

    invoke-virtual {p2, p3}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p3

    if-eqz p3, :cond_8d

    .line 28
    sget p3, Lc/a/a/a/l;->CollapsingToolbarLayout_expandedTitleMarginEnd:I

    .line 29
    invoke-virtual {p2, p3, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p3

    iput p3, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->o:I

    .line 30
    :cond_8d
    sget p3, Lc/a/a/a/l;->CollapsingToolbarLayout_expandedTitleMarginTop:I

    invoke-virtual {p2, p3}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p3

    if-eqz p3, :cond_9d

    .line 31
    sget p3, Lc/a/a/a/l;->CollapsingToolbarLayout_expandedTitleMarginTop:I

    .line 32
    invoke-virtual {p2, p3, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p3

    iput p3, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->n:I

    .line 33
    :cond_9d
    sget p3, Lc/a/a/a/l;->CollapsingToolbarLayout_expandedTitleMarginBottom:I

    invoke-virtual {p2, p3}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p3

    if-eqz p3, :cond_ad

    .line 34
    sget p3, Lc/a/a/a/l;->CollapsingToolbarLayout_expandedTitleMarginBottom:I

    .line 35
    invoke-virtual {p2, p3, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p3

    iput p3, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->p:I

    .line 36
    :cond_ad
    sget p3, Lc/a/a/a/l;->CollapsingToolbarLayout_titleEnabled:I

    invoke-virtual {p2, p3, p1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p3

    iput-boolean p3, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->t:Z

    .line 37
    sget p3, Lc/a/a/a/l;->CollapsingToolbarLayout_title:I

    invoke-virtual {p2, p3}, Landroid/content/res/TypedArray;->getText(I)Ljava/lang/CharSequence;

    move-result-object p3

    invoke-virtual {p0, p3}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->setTitle(Ljava/lang/CharSequence;)V

    .line 38
    iget-object p3, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->r:Lc/a/a/a/d0/a;

    sget v2, Lc/a/a/a/k;->TextAppearance_Design_CollapsingToolbar_Expanded:I

    invoke-virtual {p3, v2}, Lc/a/a/a/d0/a;->d(I)V

    .line 39
    iget-object p3, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->r:Lc/a/a/a/d0/a;

    sget v2, Lb/b/i;->TextAppearance_AppCompat_Widget_ActionBar_Title:I

    invoke-virtual {p3, v2}, Lc/a/a/a/d0/a;->a(I)V

    .line 40
    sget p3, Lc/a/a/a/l;->CollapsingToolbarLayout_expandedTitleTextAppearance:I

    invoke-virtual {p2, p3}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p3

    if-eqz p3, :cond_df

    .line 41
    iget-object p3, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->r:Lc/a/a/a/d0/a;

    sget v2, Lc/a/a/a/l;->CollapsingToolbarLayout_expandedTitleTextAppearance:I

    .line 42
    invoke-virtual {p2, v2, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v2

    .line 43
    invoke-virtual {p3, v2}, Lc/a/a/a/d0/a;->d(I)V

    .line 44
    :cond_df
    sget p3, Lc/a/a/a/l;->CollapsingToolbarLayout_collapsedTitleTextAppearance:I

    invoke-virtual {p2, p3}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p3

    if-eqz p3, :cond_f2

    .line 45
    iget-object p3, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->r:Lc/a/a/a/d0/a;

    sget v2, Lc/a/a/a/l;->CollapsingToolbarLayout_collapsedTitleTextAppearance:I

    .line 46
    invoke-virtual {p2, v2, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v2

    .line 47
    invoke-virtual {p3, v2}, Lc/a/a/a/d0/a;->a(I)V

    .line 48
    :cond_f2
    sget p3, Lc/a/a/a/l;->CollapsingToolbarLayout_scrimVisibleHeightTrigger:I

    .line 49
    invoke-virtual {p2, p3, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p3

    iput p3, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->B:I

    .line 50
    sget p3, Lc/a/a/a/l;->CollapsingToolbarLayout_maxLines:I

    invoke-virtual {p2, p3}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p3

    if-eqz p3, :cond_10d

    .line 51
    iget-object p3, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->r:Lc/a/a/a/d0/a;

    sget v2, Lc/a/a/a/l;->CollapsingToolbarLayout_maxLines:I

    invoke-virtual {p2, v2, p1}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result p1

    invoke-virtual {p3, p1}, Lc/a/a/a/d0/a;->g(I)V

    .line 52
    :cond_10d
    sget p1, Lc/a/a/a/l;->CollapsingToolbarLayout_scrimAnimationDuration:I

    const/16 p3, 0x258

    .line 53
    invoke-virtual {p2, p1, p3}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result p1

    int-to-long v2, p1

    iput-wide v2, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->A:J

    .line 54
    sget p1, Lc/a/a/a/l;->CollapsingToolbarLayout_contentScrim:I

    invoke-virtual {p2, p1}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->setContentScrim(Landroid/graphics/drawable/Drawable;)V

    .line 55
    sget p1, Lc/a/a/a/l;->CollapsingToolbarLayout_statusBarScrim:I

    invoke-virtual {p2, p1}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->setStatusBarScrim(Landroid/graphics/drawable/Drawable;)V

    .line 56
    sget p1, Lc/a/a/a/l;->CollapsingToolbarLayout_titleCollapseMode:I

    .line 57
    invoke-virtual {p2, p1, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result p1

    .line 58
    invoke-virtual {p0, p1}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->setTitleCollapseMode(I)V

    .line 59
    sget p1, Lc/a/a/a/l;->CollapsingToolbarLayout_toolbarId:I

    invoke-virtual {p2, p1, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p1

    iput p1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->i:I

    .line 60
    sget p1, Lc/a/a/a/l;->CollapsingToolbarLayout_forceApplySystemWindowInsetTop:I

    .line 61
    invoke-virtual {p2, p1, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p1

    iput-boolean p1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->H:Z

    .line 62
    sget p1, Lc/a/a/a/l;->CollapsingToolbarLayout_extraMultilineHeightEnabled:I

    .line 63
    invoke-virtual {p2, p1, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p1

    iput-boolean p1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->J:Z

    .line 64
    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    .line 65
    invoke-virtual {p0, v1}, Landroid/widget/FrameLayout;->setWillNotDraw(Z)V

    .line 66
    new-instance p1, Lcom/google/android/material/appbar/CollapsingToolbarLayout$a;

    invoke-direct {p1, p0}, Lcom/google/android/material/appbar/CollapsingToolbarLayout$a;-><init>(Lcom/google/android/material/appbar/CollapsingToolbarLayout;)V

    invoke-static {p0, p1}, Lb/h/m/y;->a(Landroid/view/View;Lb/h/m/s;)V

    return-void
.end method

.method public static d(Landroid/view/View;)I
    .registers 3

    .line 10
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .line 11
    instance-of v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v1, :cond_15

    .line 12
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 13
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    move-result p0

    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    add-int/2addr p0, v1

    iget v0, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    add-int/2addr p0, v0

    return p0

    .line 14
    :cond_15
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    move-result p0

    return p0
.end method

.method public static e(Landroid/view/View;)Ljava/lang/CharSequence;
    .registers 3

    .line 1
    instance-of v0, p0, Landroidx/appcompat/widget/Toolbar;

    if-eqz v0, :cond_b

    .line 2
    check-cast p0, Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {p0}, Landroidx/appcompat/widget/Toolbar;->getTitle()Ljava/lang/CharSequence;

    move-result-object p0

    return-object p0

    .line 3
    :cond_b
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_1c

    instance-of v0, p0, Landroid/widget/Toolbar;

    if-eqz v0, :cond_1c

    .line 4
    check-cast p0, Landroid/widget/Toolbar;

    invoke-virtual {p0}, Landroid/widget/Toolbar;->getTitle()Ljava/lang/CharSequence;

    move-result-object p0

    return-object p0

    :cond_1c
    const/4 p0, 0x0

    return-object p0
.end method

.method public static f(Landroid/view/View;)Lc/a/a/a/n/a;
    .registers 3

    .line 4
    sget v0, Lc/a/a/a/f;->view_offset_helper:I

    invoke-virtual {p0, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lc/a/a/a/n/a;

    if-nez v0, :cond_14

    .line 5
    new-instance v0, Lc/a/a/a/n/a;

    invoke-direct {v0, p0}, Lc/a/a/a/n/a;-><init>(Landroid/view/View;)V

    .line 6
    sget v1, Lc/a/a/a/f;->view_offset_helper:I

    invoke-virtual {p0, v1, v0}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    :cond_14
    return-object v0
.end method

.method public static g(Landroid/view/View;)Z
    .registers 3

    .line 1
    instance-of v0, p0, Landroidx/appcompat/widget/Toolbar;

    if-nez v0, :cond_11

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_f

    instance-of p0, p0, Landroid/widget/Toolbar;

    if-eqz p0, :cond_f

    goto :goto_11

    :cond_f
    const/4 p0, 0x0

    goto :goto_12

    :cond_11
    :goto_11
    const/4 p0, 0x1

    :goto_12
    return p0
.end method


# virtual methods
.method public final a(Landroid/view/View;)Landroid/view/View;
    .registers 4

    .line 26
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    :goto_4
    if-eq v0, p0, :cond_14

    if-eqz v0, :cond_14

    .line 27
    instance-of v1, v0, Landroid/view/View;

    if-eqz v1, :cond_f

    .line 28
    move-object p1, v0

    check-cast p1, Landroid/view/View;

    .line 29
    :cond_f
    invoke-interface {v0}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    goto :goto_4

    :cond_14
    return-object p1
.end method

.method public a(Lb/h/m/g0;)Lb/h/m/g0;
    .registers 4

    .line 1
    invoke-static {p0}, Lb/h/m/y;->o(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_8

    move-object v0, p1

    goto :goto_9

    :cond_8
    const/4 v0, 0x0

    .line 2
    :goto_9
    iget-object v1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->F:Lb/h/m/g0;

    invoke-static {v1, v0}, Lb/h/l/c;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_16

    .line 3
    iput-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->F:Lb/h/m/g0;

    .line 4
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->requestLayout()V

    .line 5
    :cond_16
    invoke-virtual {p1}, Lb/h/m/g0;->c()Lb/h/m/g0;

    move-result-object p1

    return-object p1
.end method

.method public final a()V
    .registers 7

    .line 12
    iget-boolean v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->h:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x0

    .line 13
    iput-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->j:Landroid/view/ViewGroup;

    .line 14
    iput-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->k:Landroid/view/View;

    .line 15
    iget v1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->i:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_1f

    .line 16
    invoke-virtual {p0, v1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    iput-object v1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->j:Landroid/view/ViewGroup;

    if-eqz v1, :cond_1f

    .line 17
    invoke-virtual {p0, v1}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->a(Landroid/view/View;)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->k:Landroid/view/View;

    .line 18
    :cond_1f
    iget-object v1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->j:Landroid/view/ViewGroup;

    const/4 v2, 0x0

    if-nez v1, :cond_3e

    .line 19
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    move-result v1

    const/4 v3, 0x0

    :goto_29
    if-ge v3, v1, :cond_3c

    .line 20
    invoke-virtual {p0, v3}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    .line 21
    invoke-static {v4}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->g(Landroid/view/View;)Z

    move-result v5

    if-eqz v5, :cond_39

    .line 22
    move-object v0, v4

    check-cast v0, Landroid/view/ViewGroup;

    goto :goto_3c

    :cond_39
    add-int/lit8 v3, v3, 0x1

    goto :goto_29

    .line 23
    :cond_3c
    :goto_3c
    iput-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->j:Landroid/view/ViewGroup;

    .line 24
    :cond_3e
    invoke-virtual {p0}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->d()V

    .line 25
    iput-boolean v2, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->h:Z

    return-void
.end method

.method public final a(I)V
    .registers 6

    .line 56
    invoke-virtual {p0}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->a()V

    .line 57
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->z:Landroid/animation/ValueAnimator;

    if-nez v0, :cond_2c

    .line 58
    new-instance v0, Landroid/animation/ValueAnimator;

    invoke-direct {v0}, Landroid/animation/ValueAnimator;-><init>()V

    iput-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->z:Landroid/animation/ValueAnimator;

    .line 59
    iget-wide v1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->A:J

    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 60
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->z:Landroid/animation/ValueAnimator;

    iget v1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->x:I

    if-le p1, v1, :cond_1c

    sget-object v1, Lc/a/a/a/m/a;->c:Landroid/animation/TimeInterpolator;

    goto :goto_1e

    :cond_1c
    sget-object v1, Lc/a/a/a/m/a;->d:Landroid/animation/TimeInterpolator;

    :goto_1e
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 61
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->z:Landroid/animation/ValueAnimator;

    new-instance v1, Lcom/google/android/material/appbar/CollapsingToolbarLayout$b;

    invoke-direct {v1, p0}, Lcom/google/android/material/appbar/CollapsingToolbarLayout$b;-><init>(Lcom/google/android/material/appbar/CollapsingToolbarLayout;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    goto :goto_37

    .line 62
    :cond_2c
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_37

    .line 63
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->z:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 64
    :cond_37
    :goto_37
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->z:Landroid/animation/ValueAnimator;

    const/4 v1, 0x2

    new-array v1, v1, [I

    const/4 v2, 0x0

    iget v3, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->x:I

    aput v3, v1, v2

    const/4 v2, 0x1

    aput p1, v1, v2

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setIntValues([I)V

    .line 65
    iget-object p1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->z:Landroid/animation/ValueAnimator;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    return-void
.end method

.method public final a(IIIIZ)V
    .registers 11

    .line 30
    iget-boolean v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->t:Z

    if-eqz v0, :cond_50

    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->l:Landroid/view/View;

    if-eqz v0, :cond_50

    .line 31
    invoke-static {v0}, Lb/h/m/y;->J(Landroid/view/View;)Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_1a

    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->l:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_1a

    const/4 v0, 0x1

    goto :goto_1b

    :cond_1a
    const/4 v0, 0x0

    :goto_1b
    iput-boolean v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->u:Z

    if-nez v0, :cond_21

    if-eqz p5, :cond_50

    .line 32
    :cond_21
    invoke-static {p0}, Lb/h/m/y;->r(Landroid/view/View;)I

    move-result v0

    if-ne v0, v2, :cond_28

    const/4 v1, 0x1

    .line 33
    :cond_28
    invoke-virtual {p0, v1}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->a(Z)V

    .line 34
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->r:Lc/a/a/a/d0/a;

    if-eqz v1, :cond_32

    iget v2, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->o:I

    goto :goto_34

    :cond_32
    iget v2, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->m:I

    :goto_34
    iget-object v3, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->q:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->top:I

    iget v4, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->n:I

    add-int/2addr v3, v4

    sub-int/2addr p3, p1

    if-eqz v1, :cond_41

    iget p1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->m:I

    goto :goto_43

    :cond_41
    iget p1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->o:I

    :goto_43
    sub-int/2addr p3, p1

    sub-int/2addr p4, p2

    iget p1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->p:I

    sub-int/2addr p4, p1

    invoke-virtual {v0, v2, v3, p3, p4}, Lc/a/a/a/d0/a;->b(IIII)V

    .line 35
    iget-object p1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->r:Lc/a/a/a/d0/a;

    invoke-virtual {p1, p5}, Lc/a/a/a/d0/a;->b(Z)V

    :cond_50
    return-void
.end method

.method public final a(Landroid/graphics/drawable/Drawable;II)V
    .registers 5

    .line 8
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->j:Landroid/view/ViewGroup;

    invoke-virtual {p0, p1, v0, p2, p3}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->a(Landroid/graphics/drawable/Drawable;Landroid/view/View;II)V

    return-void
.end method

.method public final a(Landroid/graphics/drawable/Drawable;Landroid/view/View;II)V
    .registers 6

    .line 9
    invoke-virtual {p0}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->b()Z

    move-result v0

    if-eqz v0, :cond_10

    if-eqz p2, :cond_10

    iget-boolean v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->t:Z

    if-eqz v0, :cond_10

    .line 10
    invoke-virtual {p2}, Landroid/view/View;->getBottom()I

    move-result p4

    :cond_10
    const/4 p2, 0x0

    .line 11
    invoke-virtual {p1, p2, p2, p3, p4}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    return-void
.end method

.method public final a(Lcom/google/android/material/appbar/AppBarLayout;)V
    .registers 3

    .line 6
    invoke-virtual {p0}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->b()Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x0

    .line 7
    invoke-virtual {p1, v0}, Lcom/google/android/material/appbar/AppBarLayout;->setLiftOnScroll(Z)V

    :cond_a
    return-void
.end method

.method public final a(Z)V
    .registers 11

    .line 36
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->k:Landroid/view/View;

    if-eqz v0, :cond_5

    goto :goto_7

    :cond_5
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->j:Landroid/view/ViewGroup;

    .line 37
    :goto_7
    invoke-virtual {p0, v0}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->b(Landroid/view/View;)I

    move-result v0

    .line 38
    iget-object v1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->l:Landroid/view/View;

    iget-object v2, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->q:Landroid/graphics/Rect;

    invoke-static {p0, v1, v2}, Lc/a/a/a/d0/c;->a(Landroid/view/ViewGroup;Landroid/view/View;Landroid/graphics/Rect;)V

    .line 39
    iget-object v1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->j:Landroid/view/ViewGroup;

    instance-of v2, v1, Landroidx/appcompat/widget/Toolbar;

    const/4 v3, 0x0

    if-eqz v2, :cond_2c

    .line 40
    check-cast v1, Landroidx/appcompat/widget/Toolbar;

    .line 41
    invoke-virtual {v1}, Landroidx/appcompat/widget/Toolbar;->getTitleMarginStart()I

    move-result v3

    .line 42
    invoke-virtual {v1}, Landroidx/appcompat/widget/Toolbar;->getTitleMarginEnd()I

    move-result v2

    .line 43
    invoke-virtual {v1}, Landroidx/appcompat/widget/Toolbar;->getTitleMarginTop()I

    move-result v4

    .line 44
    invoke-virtual {v1}, Landroidx/appcompat/widget/Toolbar;->getTitleMarginBottom()I

    move-result v1

    goto :goto_4c

    .line 45
    :cond_2c
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x18

    if-lt v2, v4, :cond_49

    instance-of v2, v1, Landroid/widget/Toolbar;

    if-eqz v2, :cond_49

    .line 46
    check-cast v1, Landroid/widget/Toolbar;

    .line 47
    invoke-virtual {v1}, Landroid/widget/Toolbar;->getTitleMarginStart()I

    move-result v3

    .line 48
    invoke-virtual {v1}, Landroid/widget/Toolbar;->getTitleMarginEnd()I

    move-result v2

    .line 49
    invoke-virtual {v1}, Landroid/widget/Toolbar;->getTitleMarginTop()I

    move-result v4

    .line 50
    invoke-virtual {v1}, Landroid/widget/Toolbar;->getTitleMarginBottom()I

    move-result v1

    goto :goto_4c

    :cond_49
    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v4, 0x0

    .line 51
    :goto_4c
    iget-object v5, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->r:Lc/a/a/a/d0/a;

    iget-object v6, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->q:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->left:I

    if-eqz p1, :cond_56

    move v7, v2

    goto :goto_57

    :cond_56
    move v7, v3

    :goto_57
    add-int/2addr v6, v7

    iget-object v7, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->q:Landroid/graphics/Rect;

    iget v8, v7, Landroid/graphics/Rect;->top:I

    add-int/2addr v8, v0

    add-int/2addr v8, v4

    iget v4, v7, Landroid/graphics/Rect;->right:I

    if-eqz p1, :cond_63

    goto :goto_64

    :cond_63
    move v3, v2

    :goto_64
    sub-int/2addr v4, v3

    iget-object p1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->q:Landroid/graphics/Rect;

    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    add-int/2addr p1, v0

    sub-int/2addr p1, v1

    invoke-virtual {v5, v6, v8, v4, p1}, Lc/a/a/a/d0/a;->a(IIII)V

    return-void
.end method

.method public a(ZZ)V
    .registers 5

    .line 52
    iget-boolean v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->y:Z

    if-eq v0, p1, :cond_1a

    const/16 v0, 0xff

    const/4 v1, 0x0

    if-eqz p2, :cond_11

    if-eqz p1, :cond_c

    goto :goto_d

    :cond_c
    const/4 v0, 0x0

    .line 53
    :goto_d
    invoke-virtual {p0, v0}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->a(I)V

    goto :goto_18

    :cond_11
    if-eqz p1, :cond_14

    goto :goto_15

    :cond_14
    const/4 v0, 0x0

    .line 54
    :goto_15
    invoke-virtual {p0, v0}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->setScrimAlpha(I)V

    .line 55
    :goto_18
    iput-boolean p1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->y:Z

    :cond_1a
    return-void
.end method

.method public final b(Landroid/view/View;)I
    .registers 5

    .line 2
    invoke-static {p1}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->f(Landroid/view/View;)Lc/a/a/a/n/a;

    move-result-object v0

    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Lcom/google/android/material/appbar/CollapsingToolbarLayout$LayoutParams;

    .line 4
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getHeight()I

    move-result v2

    invoke-virtual {v0}, Lc/a/a/a/n/a;->b()I

    move-result v0

    sub-int/2addr v2, v0

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result p1

    sub-int/2addr v2, p1

    iget p1, v1, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    sub-int/2addr v2, p1

    return v2
.end method

.method public final b()Z
    .registers 3

    .line 1
    iget v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->E:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_6

    goto :goto_7

    :cond_6
    const/4 v1, 0x0

    :goto_7
    return v1
.end method

.method public final c()V
    .registers 2

    .line 2
    invoke-virtual {p0}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->getTitle()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setContentDescription(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final c(Landroid/view/View;)Z
    .registers 5

    .line 1
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->k:Landroid/view/View;

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_c

    if-ne v0, p0, :cond_9

    goto :goto_c

    :cond_9
    if-ne p1, v0, :cond_11

    goto :goto_12

    :cond_c
    :goto_c
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->j:Landroid/view/ViewGroup;

    if-ne p1, v0, :cond_11

    goto :goto_12

    :cond_11
    const/4 v1, 0x0

    :goto_12
    return v1
.end method

.method public checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z
    .registers 2

    .line 1
    instance-of p1, p1, Lcom/google/android/material/appbar/CollapsingToolbarLayout$LayoutParams;

    return p1
.end method

.method public final d()V
    .registers 4

    .line 1
    iget-boolean v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->t:Z

    if-nez v0, :cond_17

    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->l:Landroid/view/View;

    if-eqz v0, :cond_17

    .line 2
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    .line 3
    instance-of v1, v0, Landroid/view/ViewGroup;

    if-eqz v1, :cond_17

    .line 4
    check-cast v0, Landroid/view/ViewGroup;

    iget-object v1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->l:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 5
    :cond_17
    iget-boolean v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->t:Z

    if-eqz v0, :cond_3e

    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->j:Landroid/view/ViewGroup;

    if-eqz v0, :cond_3e

    .line 6
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->l:Landroid/view/View;

    if-nez v0, :cond_2e

    .line 7
    new-instance v0, Landroid/view/View;

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->l:Landroid/view/View;

    .line 8
    :cond_2e
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->l:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-nez v0, :cond_3e

    .line 9
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->j:Landroid/view/ViewGroup;

    iget-object v1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->l:Landroid/view/View;

    const/4 v2, -0x1

    invoke-virtual {v0, v1, v2, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V

    :cond_3e
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .registers 8

    .line 1
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->draw(Landroid/graphics/Canvas;)V

    .line 2
    invoke-virtual {p0}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->a()V

    .line 3
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->j:Landroid/view/ViewGroup;

    if-nez v0, :cond_20

    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->v:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_20

    iget v1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->x:I

    if-lez v1, :cond_20

    .line 4
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iget v1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->x:I

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 5
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->v:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 6
    :cond_20
    iget-boolean v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->t:Z

    if-eqz v0, :cond_67

    iget-boolean v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->u:Z

    if-eqz v0, :cond_67

    .line 7
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->j:Landroid/view/ViewGroup;

    if-eqz v0, :cond_62

    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->v:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_62

    iget v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->x:I

    if-lez v0, :cond_62

    .line 8
    invoke-virtual {p0}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->b()Z

    move-result v0

    if-eqz v0, :cond_62

    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->r:Lc/a/a/a/d0/a;

    .line 9
    invoke-virtual {v0}, Lc/a/a/a/d0/a;->p()F

    move-result v0

    iget-object v1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->r:Lc/a/a/a/d0/a;

    .line 10
    invoke-virtual {v1}, Lc/a/a/a/d0/a;->q()F

    move-result v1

    cmpg-float v0, v0, v1

    if-gez v0, :cond_62

    .line 11
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v0

    .line 12
    iget-object v1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->v:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v1

    sget-object v2, Landroid/graphics/Region$Op;->DIFFERENCE:Landroid/graphics/Region$Op;

    invoke-virtual {p1, v1, v2}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/Rect;Landroid/graphics/Region$Op;)Z

    .line 13
    iget-object v1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->r:Lc/a/a/a/d0/a;

    invoke-virtual {v1, p1}, Lc/a/a/a/d0/a;->a(Landroid/graphics/Canvas;)V

    .line 14
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V

    goto :goto_67

    .line 15
    :cond_62
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->r:Lc/a/a/a/d0/a;

    invoke-virtual {v0, p1}, Lc/a/a/a/d0/a;->a(Landroid/graphics/Canvas;)V

    .line 16
    :cond_67
    :goto_67
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->w:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_9b

    iget v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->x:I

    if-lez v0, :cond_9b

    .line 17
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->F:Lb/h/m/g0;

    const/4 v1, 0x0

    if-eqz v0, :cond_79

    invoke-virtual {v0}, Lb/h/m/g0;->h()I

    move-result v0

    goto :goto_7a

    :cond_79
    const/4 v0, 0x0

    :goto_7a
    if-lez v0, :cond_9b

    .line 18
    iget-object v2, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->w:Landroid/graphics/drawable/Drawable;

    iget v3, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->D:I

    neg-int v3, v3

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getWidth()I

    move-result v4

    iget v5, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->D:I

    sub-int/2addr v0, v5

    invoke-virtual {v2, v1, v3, v4, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 19
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->w:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iget v1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->x:I

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 20
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->w:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    :cond_9b
    return-void
.end method

.method public drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z
    .registers 10

    .line 1
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->v:Landroid/graphics/drawable/Drawable;

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_2f

    iget v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->x:I

    if-lez v0, :cond_2f

    invoke-virtual {p0, p2}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->c(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_2f

    .line 2
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->v:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getWidth()I

    move-result v3

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getHeight()I

    move-result v4

    invoke-virtual {p0, v0, p2, v3, v4}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->a(Landroid/graphics/drawable/Drawable;Landroid/view/View;II)V

    .line 3
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->v:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iget v3, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->x:I

    invoke-virtual {v0, v3}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 4
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->v:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    const/4 v0, 0x1

    goto :goto_30

    :cond_2f
    const/4 v0, 0x0

    .line 5
    :goto_30
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/FrameLayout;->drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z

    move-result p1

    if-nez p1, :cond_3a

    if-eqz v0, :cond_39

    goto :goto_3a

    :cond_39
    const/4 v1, 0x0

    :cond_3a
    :goto_3a
    return v1
.end method

.method public drawableStateChanged()V
    .registers 5

    .line 1
    invoke-super {p0}, Landroid/widget/FrameLayout;->drawableStateChanged()V

    .line 2
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getDrawableState()[I

    move-result-object v0

    .line 3
    iget-object v1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->w:Landroid/graphics/drawable/Drawable;

    const/4 v2, 0x0

    if-eqz v1, :cond_17

    .line 4
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    move-result v3

    if-eqz v3, :cond_17

    .line 5
    invoke-virtual {v1, v0}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    move-result v1

    or-int/2addr v2, v1

    .line 6
    :cond_17
    iget-object v1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->v:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_26

    .line 7
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    move-result v3

    if-eqz v3, :cond_26

    .line 8
    invoke-virtual {v1, v0}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    move-result v1

    or-int/2addr v2, v1

    .line 9
    :cond_26
    iget-object v1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->r:Lc/a/a/a/d0/a;

    if-eqz v1, :cond_2f

    .line 10
    invoke-virtual {v1, v0}, Lc/a/a/a/d0/a;->a([I)Z

    move-result v0

    or-int/2addr v2, v0

    :cond_2f
    if-eqz v2, :cond_34

    .line 11
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->invalidate()V

    :cond_34
    return-void
.end method

.method public final e()V
    .registers 3

    .line 5
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->v:Landroid/graphics/drawable/Drawable;

    if-nez v0, :cond_8

    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->w:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_1b

    .line 6
    :cond_8
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getHeight()I

    move-result v0

    iget v1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->D:I

    add-int/2addr v0, v1

    invoke-virtual {p0}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->getScrimVisibleHeightTrigger()I

    move-result v1

    if-ge v0, v1, :cond_17

    const/4 v0, 0x1

    goto :goto_18

    :cond_17
    const/4 v0, 0x0

    :goto_18
    invoke-virtual {p0, v0}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->setScrimsShown(Z)V

    :cond_1b
    return-void
.end method

.method public final f()V
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->j:Landroid/view/ViewGroup;

    if-eqz v0, :cond_1d

    .line 2
    iget-boolean v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->t:Z

    if-eqz v0, :cond_1d

    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->r:Lc/a/a/a/d0/a;

    invoke-virtual {v0}, Lc/a/a/a/d0/a;->w()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1d

    .line 3
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->j:Landroid/view/ViewGroup;

    invoke-static {v0}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->e(Landroid/view/View;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->setTitle(Ljava/lang/CharSequence;)V

    :cond_1d
    return-void
.end method

.method public bridge synthetic generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    .registers 2

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->generateDefaultLayoutParams()Lcom/google/android/material/appbar/CollapsingToolbarLayout$LayoutParams;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic generateDefaultLayoutParams()Landroid/widget/FrameLayout$LayoutParams;
    .registers 2

    .line 2
    invoke-virtual {p0}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->generateDefaultLayoutParams()Lcom/google/android/material/appbar/CollapsingToolbarLayout$LayoutParams;

    move-result-object v0

    return-object v0
.end method

.method public generateDefaultLayoutParams()Lcom/google/android/material/appbar/CollapsingToolbarLayout$LayoutParams;
    .registers 3

    .line 3
    new-instance v0, Lcom/google/android/material/appbar/CollapsingToolbarLayout$LayoutParams;

    const/4 v1, -0x1

    invoke-direct {v0, v1, v1}, Lcom/google/android/material/appbar/CollapsingToolbarLayout$LayoutParams;-><init>(II)V

    return-object v0
.end method

.method public bridge synthetic generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;
    .registers 2

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->generateLayoutParams(Landroid/util/AttributeSet;)Landroid/widget/FrameLayout$LayoutParams;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    .registers 2

    .line 2
    invoke-virtual {p0, p1}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/widget/FrameLayout$LayoutParams;

    move-result-object p1

    return-object p1
.end method

.method public generateLayoutParams(Landroid/util/AttributeSet;)Landroid/widget/FrameLayout$LayoutParams;
    .registers 4

    .line 3
    new-instance v0, Lcom/google/android/material/appbar/CollapsingToolbarLayout$LayoutParams;

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lcom/google/android/material/appbar/CollapsingToolbarLayout$LayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-object v0
.end method

.method public generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/widget/FrameLayout$LayoutParams;
    .registers 3

    .line 4
    new-instance v0, Lcom/google/android/material/appbar/CollapsingToolbarLayout$LayoutParams;

    invoke-direct {v0, p1}, Lcom/google/android/material/appbar/CollapsingToolbarLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    return-object v0
.end method

.method public getCollapsedTitleGravity()I
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->r:Lc/a/a/a/d0/a;

    invoke-virtual {v0}, Lc/a/a/a/d0/a;->g()I

    move-result v0

    return v0
.end method

.method public getCollapsedTitleTypeface()Landroid/graphics/Typeface;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->r:Lc/a/a/a/d0/a;

    invoke-virtual {v0}, Lc/a/a/a/d0/a;->i()Landroid/graphics/Typeface;

    move-result-object v0

    return-object v0
.end method

.method public getContentScrim()Landroid/graphics/drawable/Drawable;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->v:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public getExpandedTitleGravity()I
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->r:Lc/a/a/a/d0/a;

    invoke-virtual {v0}, Lc/a/a/a/d0/a;->m()I

    move-result v0

    return v0
.end method

.method public getExpandedTitleMarginBottom()I
    .registers 2

    .line 1
    iget v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->p:I

    return v0
.end method

.method public getExpandedTitleMarginEnd()I
    .registers 2

    .line 1
    iget v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->o:I

    return v0
.end method

.method public getExpandedTitleMarginStart()I
    .registers 2

    .line 1
    iget v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->m:I

    return v0
.end method

.method public getExpandedTitleMarginTop()I
    .registers 2

    .line 1
    iget v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->n:I

    return v0
.end method

.method public getExpandedTitleTypeface()Landroid/graphics/Typeface;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->r:Lc/a/a/a/d0/a;

    invoke-virtual {v0}, Lc/a/a/a/d0/a;->o()Landroid/graphics/Typeface;

    move-result-object v0

    return-object v0
.end method

.method public getHyphenationFrequency()I
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->r:Lc/a/a/a/d0/a;

    invoke-virtual {v0}, Lc/a/a/a/d0/a;->r()I

    move-result v0

    return v0
.end method

.method public getLineCount()I
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->r:Lc/a/a/a/d0/a;

    invoke-virtual {v0}, Lc/a/a/a/d0/a;->s()I

    move-result v0

    return v0
.end method

.method public getLineSpacingAdd()F
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->r:Lc/a/a/a/d0/a;

    invoke-virtual {v0}, Lc/a/a/a/d0/a;->t()F

    move-result v0

    return v0
.end method

.method public getLineSpacingMultiplier()F
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->r:Lc/a/a/a/d0/a;

    invoke-virtual {v0}, Lc/a/a/a/d0/a;->u()F

    move-result v0

    return v0
.end method

.method public getMaxLines()I
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->r:Lc/a/a/a/d0/a;

    invoke-virtual {v0}, Lc/a/a/a/d0/a;->v()I

    move-result v0

    return v0
.end method

.method public getScrimAlpha()I
    .registers 2

    .line 1
    iget v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->x:I

    return v0
.end method

.method public getScrimAnimationDuration()J
    .registers 3

    .line 1
    iget-wide v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->A:J

    return-wide v0
.end method

.method public getScrimVisibleHeightTrigger()I
    .registers 3

    .line 1
    iget v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->B:I

    if-ltz v0, :cond_b

    .line 2
    iget v1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->G:I

    add-int/2addr v0, v1

    iget v1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->I:I

    add-int/2addr v0, v1

    return v0

    .line 3
    :cond_b
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->F:Lb/h/m/g0;

    if-eqz v0, :cond_14

    invoke-virtual {v0}, Lb/h/m/g0;->h()I

    move-result v0

    goto :goto_15

    :cond_14
    const/4 v0, 0x0

    .line 4
    :goto_15
    invoke-static {p0}, Lb/h/m/y;->s(Landroid/view/View;)I

    move-result v1

    if-lez v1, :cond_27

    mul-int/lit8 v1, v1, 0x2

    add-int/2addr v1, v0

    .line 5
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getHeight()I

    move-result v0

    invoke-static {v1, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    return v0

    .line 6
    :cond_27
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getHeight()I

    move-result v0

    div-int/lit8 v0, v0, 0x3

    return v0
.end method

.method public getStatusBarScrim()Landroid/graphics/drawable/Drawable;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->w:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public getTitle()Ljava/lang/CharSequence;
    .registers 2

    .line 1
    iget-boolean v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->t:Z

    if-eqz v0, :cond_b

    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->r:Lc/a/a/a/d0/a;

    invoke-virtual {v0}, Lc/a/a/a/d0/a;->w()Ljava/lang/CharSequence;

    move-result-object v0

    goto :goto_c

    :cond_b
    const/4 v0, 0x0

    :goto_c
    return-object v0
.end method

.method public getTitleCollapseMode()I
    .registers 2

    .line 1
    iget v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->E:I

    return v0
.end method

.method public onAttachedToWindow()V
    .registers 3

    .line 1
    invoke-super {p0}, Landroid/widget/FrameLayout;->onAttachedToWindow()V

    .line 2
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    .line 3
    instance-of v1, v0, Lcom/google/android/material/appbar/AppBarLayout;

    if-eqz v1, :cond_2a

    .line 4
    check-cast v0, Lcom/google/android/material/appbar/AppBarLayout;

    .line 5
    invoke-virtual {p0, v0}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->a(Lcom/google/android/material/appbar/AppBarLayout;)V

    .line 6
    invoke-static {v0}, Lb/h/m/y;->o(Landroid/view/View;)Z

    move-result v1

    invoke-static {p0, v1}, Lb/h/m/y;->b(Landroid/view/View;Z)V

    .line 7
    iget-object v1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->C:Lcom/google/android/material/appbar/AppBarLayout$d;

    if-nez v1, :cond_22

    .line 8
    new-instance v1, Lcom/google/android/material/appbar/CollapsingToolbarLayout$c;

    invoke-direct {v1, p0}, Lcom/google/android/material/appbar/CollapsingToolbarLayout$c;-><init>(Lcom/google/android/material/appbar/CollapsingToolbarLayout;)V

    iput-object v1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->C:Lcom/google/android/material/appbar/AppBarLayout$d;

    .line 9
    :cond_22
    iget-object v1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->C:Lcom/google/android/material/appbar/AppBarLayout$d;

    invoke-virtual {v0, v1}, Lcom/google/android/material/appbar/AppBarLayout;->a(Lcom/google/android/material/appbar/AppBarLayout$d;)V

    .line 10
    invoke-static {p0}, Lb/h/m/y;->P(Landroid/view/View;)V

    :cond_2a
    return-void
.end method

.method public onDetachedFromWindow()V
    .registers 4

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    .line 2
    iget-object v1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->C:Lcom/google/android/material/appbar/AppBarLayout$d;

    if-eqz v1, :cond_11

    instance-of v2, v0, Lcom/google/android/material/appbar/AppBarLayout;

    if-eqz v2, :cond_11

    .line 3
    check-cast v0, Lcom/google/android/material/appbar/AppBarLayout;

    invoke-virtual {v0, v1}, Lcom/google/android/material/appbar/AppBarLayout;->b(Lcom/google/android/material/appbar/AppBarLayout$d;)V

    .line 4
    :cond_11
    invoke-super {p0}, Landroid/widget/FrameLayout;->onDetachedFromWindow()V

    return-void
.end method

.method public onLayout(ZIIII)V
    .registers 14

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/widget/FrameLayout;->onLayout(ZIIII)V

    .line 2
    iget-object p1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->F:Lb/h/m/g0;

    const/4 v0, 0x0

    if-eqz p1, :cond_29

    .line 3
    invoke-virtual {p1}, Lb/h/m/g0;->h()I

    move-result p1

    .line 4
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    move-result v1

    const/4 v2, 0x0

    :goto_11
    if-ge v2, v1, :cond_29

    .line 5
    invoke-virtual {p0, v2}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 6
    invoke-static {v3}, Lb/h/m/y;->o(Landroid/view/View;)Z

    move-result v4

    if-nez v4, :cond_26

    .line 7
    invoke-virtual {v3}, Landroid/view/View;->getTop()I

    move-result v4

    if-ge v4, p1, :cond_26

    .line 8
    invoke-static {v3, p1}, Lb/h/m/y;->e(Landroid/view/View;I)V

    :cond_26
    add-int/lit8 v2, v2, 0x1

    goto :goto_11

    .line 9
    :cond_29
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    move-result p1

    const/4 v1, 0x0

    :goto_2e
    if-ge v1, p1, :cond_3e

    .line 10
    invoke-virtual {p0, v1}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->f(Landroid/view/View;)Lc/a/a/a/n/a;

    move-result-object v2

    invoke-virtual {v2}, Lc/a/a/a/n/a;->d()V

    add-int/lit8 v1, v1, 0x1

    goto :goto_2e

    :cond_3e
    const/4 v7, 0x0

    move-object v2, p0

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    .line 11
    invoke-virtual/range {v2 .. v7}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->a(IIIIZ)V

    .line 12
    invoke-virtual {p0}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->f()V

    .line 13
    invoke-virtual {p0}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->e()V

    .line 14
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    move-result p1

    :goto_51
    if-ge v0, p1, :cond_61

    .line 15
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    move-result-object p2

    invoke-static {p2}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->f(Landroid/view/View;)Lc/a/a/a/n/a;

    move-result-object p2

    invoke-virtual {p2}, Lc/a/a/a/n/a;->a()V

    add-int/lit8 v0, v0, 0x1

    goto :goto_51

    :cond_61
    return-void
.end method

.method public onMeasure(II)V
    .registers 11

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->a()V

    .line 2
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 3
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result p2

    .line 4
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->F:Lb/h/m/g0;

    if-eqz v0, :cond_13

    invoke-virtual {v0}, Lb/h/m/g0;->h()I

    move-result v0

    goto :goto_14

    :cond_13
    const/4 v0, 0x0

    :goto_14
    const/high16 v1, 0x40000000    # 2.0f

    if-eqz p2, :cond_1c

    .line 5
    iget-boolean p2, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->H:Z

    if-eqz p2, :cond_2c

    :cond_1c
    if-lez v0, :cond_2c

    .line 6
    iput v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->G:I

    .line 7
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    move-result p2

    add-int/2addr p2, v0

    .line 8
    invoke-static {p2, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p2

    .line 9
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 10
    :cond_2c
    iget-boolean p2, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->J:Z

    if-eqz p2, :cond_70

    iget-object p2, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->r:Lc/a/a/a/d0/a;

    invoke-virtual {p2}, Lc/a/a/a/d0/a;->v()I

    move-result p2

    const/4 v0, 0x1

    if-le p2, v0, :cond_70

    .line 11
    invoke-virtual {p0}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->f()V

    const/4 v3, 0x0

    const/4 v4, 0x0

    .line 12
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    move-result v5

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    move-result v6

    const/4 v7, 0x1

    move-object v2, p0

    invoke-virtual/range {v2 .. v7}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->a(IIIIZ)V

    .line 13
    iget-object p2, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->r:Lc/a/a/a/d0/a;

    invoke-virtual {p2}, Lc/a/a/a/d0/a;->s()I

    move-result p2

    if-le p2, v0, :cond_70

    .line 14
    iget-object v2, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->r:Lc/a/a/a/d0/a;

    invoke-virtual {v2}, Lc/a/a/a/d0/a;->l()F

    move-result v2

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    sub-int/2addr p2, v0

    mul-int v2, v2, p2

    .line 15
    iput v2, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->I:I

    .line 16
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    move-result p2

    iget v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->I:I

    add-int/2addr p2, v0

    .line 17
    invoke-static {p2, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p2

    .line 18
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 19
    :cond_70
    iget-object p1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->j:Landroid/view/ViewGroup;

    if-eqz p1, :cond_8c

    .line 20
    iget-object p1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->k:Landroid/view/View;

    if-eqz p1, :cond_83

    if-ne p1, p0, :cond_7b

    goto :goto_83

    .line 21
    :cond_7b
    invoke-static {p1}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->d(Landroid/view/View;)I

    move-result p1

    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->setMinimumHeight(I)V

    goto :goto_8c

    .line 22
    :cond_83
    :goto_83
    iget-object p1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->j:Landroid/view/ViewGroup;

    invoke-static {p1}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->d(Landroid/view/View;)I

    move-result p1

    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->setMinimumHeight(I)V

    :cond_8c
    :goto_8c
    return-void
.end method

.method public onSizeChanged(IIII)V
    .registers 5

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/FrameLayout;->onSizeChanged(IIII)V

    .line 2
    iget-object p3, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->v:Landroid/graphics/drawable/Drawable;

    if-eqz p3, :cond_a

    .line 3
    invoke-virtual {p0, p3, p1, p2}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->a(Landroid/graphics/drawable/Drawable;II)V

    :cond_a
    return-void
.end method

.method public setCollapsedTitleGravity(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->r:Lc/a/a/a/d0/a;

    invoke-virtual {v0, p1}, Lc/a/a/a/d0/a;->b(I)V

    return-void
.end method

.method public setCollapsedTitleTextAppearance(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->r:Lc/a/a/a/d0/a;

    invoke-virtual {v0, p1}, Lc/a/a/a/d0/a;->a(I)V

    return-void
.end method

.method public setCollapsedTitleTextColor(I)V
    .registers 2

    .line 1
    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->setCollapsedTitleTextColor(Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public setCollapsedTitleTextColor(Landroid/content/res/ColorStateList;)V
    .registers 3

    .line 2
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->r:Lc/a/a/a/d0/a;

    invoke-virtual {v0, p1}, Lc/a/a/a/d0/a;->b(Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public setCollapsedTitleTypeface(Landroid/graphics/Typeface;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->r:Lc/a/a/a/d0/a;

    invoke-virtual {v0, p1}, Lc/a/a/a/d0/a;->a(Landroid/graphics/Typeface;)V

    return-void
.end method

.method public setContentScrim(Landroid/graphics/drawable/Drawable;)V
    .registers 4

    .line 1
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->v:Landroid/graphics/drawable/Drawable;

    if-eq v0, p1, :cond_2e

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
    iput-object v1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->v:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_2b

    .line 4
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getWidth()I

    move-result p1

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getHeight()I

    move-result v0

    invoke-virtual {p0, v1, p1, v0}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->a(Landroid/graphics/drawable/Drawable;II)V

    .line 5
    iget-object p1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->v:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p1, p0}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 6
    iget-object p1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->v:Landroid/graphics/drawable/Drawable;

    iget v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->x:I

    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 7
    :cond_2b
    invoke-static {p0}, Lb/h/m/y;->O(Landroid/view/View;)V

    :cond_2e
    return-void
.end method

.method public setContentScrimColor(I)V
    .registers 3

    .line 1
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v0, p1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {p0, v0}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->setContentScrim(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public setContentScrimResource(I)V
    .registers 3

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lb/h/e/a;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->setContentScrim(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public setExpandedTitleColor(I)V
    .registers 2

    .line 1
    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->setExpandedTitleTextColor(Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public setExpandedTitleGravity(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->r:Lc/a/a/a/d0/a;

    invoke-virtual {v0, p1}, Lc/a/a/a/d0/a;->e(I)V

    return-void
.end method

.method public setExpandedTitleMarginBottom(I)V
    .registers 2

    .line 1
    iput p1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->p:I

    .line 2
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->requestLayout()V

    return-void
.end method

.method public setExpandedTitleMarginEnd(I)V
    .registers 2

    .line 1
    iput p1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->o:I

    .line 2
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->requestLayout()V

    return-void
.end method

.method public setExpandedTitleMarginStart(I)V
    .registers 2

    .line 1
    iput p1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->m:I

    .line 2
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->requestLayout()V

    return-void
.end method

.method public setExpandedTitleMarginTop(I)V
    .registers 2

    .line 1
    iput p1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->n:I

    .line 2
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->requestLayout()V

    return-void
.end method

.method public setExpandedTitleTextAppearance(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->r:Lc/a/a/a/d0/a;

    invoke-virtual {v0, p1}, Lc/a/a/a/d0/a;->d(I)V

    return-void
.end method

.method public setExpandedTitleTextColor(Landroid/content/res/ColorStateList;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->r:Lc/a/a/a/d0/a;

    invoke-virtual {v0, p1}, Lc/a/a/a/d0/a;->c(Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public setExpandedTitleTypeface(Landroid/graphics/Typeface;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->r:Lc/a/a/a/d0/a;

    invoke-virtual {v0, p1}, Lc/a/a/a/d0/a;->c(Landroid/graphics/Typeface;)V

    return-void
.end method

.method public setExtraMultilineHeightEnabled(Z)V
    .registers 2

    .line 1
    iput-boolean p1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->J:Z

    return-void
.end method

.method public setForceApplySystemWindowInsetTop(Z)V
    .registers 2

    .line 1
    iput-boolean p1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->H:Z

    return-void
.end method

.method public setHyphenationFrequency(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->r:Lc/a/a/a/d0/a;

    invoke-virtual {v0, p1}, Lc/a/a/a/d0/a;->f(I)V

    return-void
.end method

.method public setLineSpacingAdd(F)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->r:Lc/a/a/a/d0/a;

    invoke-virtual {v0, p1}, Lc/a/a/a/d0/a;->k(F)V

    return-void
.end method

.method public setLineSpacingMultiplier(F)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->r:Lc/a/a/a/d0/a;

    invoke-virtual {v0, p1}, Lc/a/a/a/d0/a;->l(F)V

    return-void
.end method

.method public setMaxLines(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->r:Lc/a/a/a/d0/a;

    invoke-virtual {v0, p1}, Lc/a/a/a/d0/a;->g(I)V

    return-void
.end method

.method public setRtlTextDirectionHeuristicsEnabled(Z)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->r:Lc/a/a/a/d0/a;

    invoke-virtual {v0, p1}, Lc/a/a/a/d0/a;->d(Z)V

    return-void
.end method

.method public setScrimAlpha(I)V
    .registers 3

    .line 1
    iget v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->x:I

    if-eq p1, v0, :cond_14

    .line 2
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->v:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_f

    .line 3
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->j:Landroid/view/ViewGroup;

    if-eqz v0, :cond_f

    .line 4
    invoke-static {v0}, Lb/h/m/y;->O(Landroid/view/View;)V

    .line 5
    :cond_f
    iput p1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->x:I

    .line 6
    invoke-static {p0}, Lb/h/m/y;->O(Landroid/view/View;)V

    :cond_14
    return-void
.end method

.method public setScrimAnimationDuration(J)V
    .registers 3

    .line 1
    iput-wide p1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->A:J

    return-void
.end method

.method public setScrimVisibleHeightTrigger(I)V
    .registers 3

    .line 1
    iget v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->B:I

    if-eq v0, p1, :cond_9

    .line 2
    iput p1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->B:I

    .line 3
    invoke-virtual {p0}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->e()V

    :cond_9
    return-void
.end method

.method public setScrimsShown(Z)V
    .registers 3

    .line 1
    invoke-static {p0}, Lb/h/m/y;->K(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_e

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->isInEditMode()Z

    move-result v0

    if-nez v0, :cond_e

    const/4 v0, 0x1

    goto :goto_f

    :cond_e
    const/4 v0, 0x0

    :goto_f
    invoke-virtual {p0, p1, v0}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->a(ZZ)V

    return-void
.end method

.method public setStatusBarScrim(Landroid/graphics/drawable/Drawable;)V
    .registers 4

    .line 1
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->w:Landroid/graphics/drawable/Drawable;

    if-eq v0, p1, :cond_4a

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
    iput-object v1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->w:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_47

    .line 4
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    move-result p1

    if-eqz p1, :cond_23

    .line 5
    iget-object p1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->w:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getDrawableState()[I

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 6
    :cond_23
    iget-object p1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->w:Landroid/graphics/drawable/Drawable;

    invoke-static {p0}, Lb/h/m/y;->r(Landroid/view/View;)I

    move-result v0

    invoke-static {p1, v0}, Lb/h/f/l/a;->a(Landroid/graphics/drawable/Drawable;I)Z

    .line 7
    iget-object p1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->w:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getVisibility()I

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
    iget-object p1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->w:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p1, p0}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 9
    iget-object p1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->w:Landroid/graphics/drawable/Drawable;

    iget v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->x:I

    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 10
    :cond_47
    invoke-static {p0}, Lb/h/m/y;->O(Landroid/view/View;)V

    :cond_4a
    return-void
.end method

.method public setStatusBarScrimColor(I)V
    .registers 3

    .line 1
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v0, p1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {p0, v0}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->setStatusBarScrim(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public setStatusBarScrimResource(I)V
    .registers 3

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lb/h/e/a;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->setStatusBarScrim(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public setTitle(Ljava/lang/CharSequence;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->r:Lc/a/a/a/d0/a;

    invoke-virtual {v0, p1}, Lc/a/a/a/d0/a;->b(Ljava/lang/CharSequence;)V

    .line 2
    invoke-virtual {p0}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->c()V

    return-void
.end method

.method public setTitleCollapseMode(I)V
    .registers 4

    .line 1
    iput p1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->E:I

    .line 2
    invoke-virtual {p0}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->b()Z

    move-result p1

    .line 3
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->r:Lc/a/a/a/d0/a;

    invoke-virtual {v0, p1}, Lc/a/a/a/d0/a;->c(Z)V

    .line 4
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    .line 5
    instance-of v1, v0, Lcom/google/android/material/appbar/AppBarLayout;

    if-eqz v1, :cond_18

    .line 6
    check-cast v0, Lcom/google/android/material/appbar/AppBarLayout;

    invoke-virtual {p0, v0}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->a(Lcom/google/android/material/appbar/AppBarLayout;)V

    :cond_18
    if-eqz p1, :cond_31

    .line 7
    iget-object p1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->v:Landroid/graphics/drawable/Drawable;

    if-nez p1, :cond_31

    .line 8
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    sget v0, Lc/a/a/a/d;->design_appbar_elevation:I

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    .line 9
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->s:Lc/a/a/a/a0/a;

    .line 10
    invoke-virtual {v0, p1}, Lc/a/a/a/a0/a;->b(F)I

    move-result p1

    .line 11
    invoke-virtual {p0, p1}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->setContentScrimColor(I)V

    :cond_31
    return-void
.end method

.method public setTitleEnabled(Z)V
    .registers 3

    .line 1
    iget-boolean v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->t:Z

    if-eq p1, v0, :cond_f

    .line 2
    iput-boolean p1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->t:Z

    .line 3
    invoke-virtual {p0}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->c()V

    .line 4
    invoke-virtual {p0}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->d()V

    .line 5
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->requestLayout()V

    :cond_f
    return-void
.end method

.method public setVisibility(I)V
    .registers 4

    .line 1
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    const/4 v0, 0x0

    if-nez p1, :cond_8

    const/4 p1, 0x1

    goto :goto_9

    :cond_8
    const/4 p1, 0x0

    .line 2
    :goto_9
    iget-object v1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->w:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_18

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->isVisible()Z

    move-result v1

    if-eq v1, p1, :cond_18

    .line 3
    iget-object v1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->w:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, p1, v0}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    .line 4
    :cond_18
    iget-object v1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->v:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_27

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->isVisible()Z

    move-result v1

    if-eq v1, p1, :cond_27

    .line 5
    iget-object v1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->v:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, p1, v0}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    :cond_27
    return-void
.end method

.method public verifyDrawable(Landroid/graphics/drawable/Drawable;)Z
    .registers 3

    .line 1
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->verifyDrawable(Landroid/graphics/drawable/Drawable;)Z

    move-result v0

    if-nez v0, :cond_11

    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->v:Landroid/graphics/drawable/Drawable;

    if-eq p1, v0, :cond_11

    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->w:Landroid/graphics/drawable/Drawable;

    if-ne p1, v0, :cond_f

    goto :goto_11

    :cond_f
    const/4 p1, 0x0

    goto :goto_12

    :cond_11
    :goto_11
    const/4 p1, 0x1

    :goto_12
    return p1
.end method
