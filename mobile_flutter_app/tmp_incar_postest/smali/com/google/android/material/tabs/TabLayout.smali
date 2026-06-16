.class public Lcom/google/android/material/tabs/TabLayout;
.super Landroid/widget/HorizontalScrollView;
.source "TabLayout.java"


# annotations
.annotation runtime Landroidx/viewpager/widget/ViewPager$e;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/material/tabs/TabLayout$b;,
        Lcom/google/android/material/tabs/TabLayout$e;,
        Lcom/google/android/material/tabs/TabLayout$j;,
        Lcom/google/android/material/tabs/TabLayout$h;,
        Lcom/google/android/material/tabs/TabLayout$f;,
        Lcom/google/android/material/tabs/TabLayout$i;,
        Lcom/google/android/material/tabs/TabLayout$g;,
        Lcom/google/android/material/tabs/TabLayout$c;,
        Lcom/google/android/material/tabs/TabLayout$d;
    }
.end annotation


# static fields
.field public static final a0:I

.field public static final b0:Lb/h/l/e;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lb/h/l/e<",
            "Lcom/google/android/material/tabs/TabLayout$g;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final A:I

.field public final B:I

.field public C:I

.field public D:I

.field public E:I

.field public F:I

.field public G:I

.field public H:Z

.field public I:Z

.field public J:I

.field public K:Z

.field public L:Lc/a/a/a/o0/b;

.field public M:Lcom/google/android/material/tabs/TabLayout$c;

.field public final N:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/google/android/material/tabs/TabLayout$c;",
            ">;"
        }
    .end annotation
.end field

.field public O:Lcom/google/android/material/tabs/TabLayout$c;

.field public P:Landroid/animation/ValueAnimator;

.field public Q:Landroidx/viewpager/widget/ViewPager;

.field public R:Lb/v/a/a;

.field public S:Landroid/database/DataSetObserver;

.field public T:Lcom/google/android/material/tabs/TabLayout$h;

.field public U:Lcom/google/android/material/tabs/TabLayout$b;

.field public V:Z

.field public final W:Lb/h/l/e;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lb/h/l/e<",
            "Lcom/google/android/material/tabs/TabLayout$i;",
            ">;"
        }
    .end annotation
.end field

.field public final h:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/google/android/material/tabs/TabLayout$g;",
            ">;"
        }
    .end annotation
.end field

.field public i:Lcom/google/android/material/tabs/TabLayout$g;

.field public final j:Lcom/google/android/material/tabs/TabLayout$f;

.field public k:I

.field public l:I

.field public m:I

.field public n:I

.field public o:I

.field public p:Landroid/content/res/ColorStateList;

.field public q:Landroid/content/res/ColorStateList;

.field public r:Landroid/content/res/ColorStateList;

.field public s:Landroid/graphics/drawable/Drawable;

.field public t:I

.field public u:Landroid/graphics/PorterDuff$Mode;

.field public v:F

.field public w:F

.field public final x:I

.field public y:I

.field public final z:I


# direct methods
.method public static constructor <clinit>()V
    .registers 2

    .line 1
    sget v0, Lc/a/a/a/k;->Widget_Design_TabLayout:I

    sput v0, Lcom/google/android/material/tabs/TabLayout;->a0:I

    .line 2
    new-instance v0, Lb/h/l/g;

    const/16 v1, 0x10

    invoke-direct {v0, v1}, Lb/h/l/g;-><init>(I)V

    sput-object v0, Lcom/google/android/material/tabs/TabLayout;->b0:Lb/h/l/e;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Lcom/google/android/material/tabs/TabLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    .line 2
    sget v0, Lc/a/a/a/b;->tabStyle:I

    invoke-direct {p0, p1, p2, v0}, Lcom/google/android/material/tabs/TabLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 13

    .line 3
    sget v0, Lcom/google/android/material/tabs/TabLayout;->a0:I

    invoke-static {p1, p2, p3, v0}, Lc/a/a/a/q0/a/a;->b(Landroid/content/Context;Landroid/util/AttributeSet;II)Landroid/content/Context;

    move-result-object p1

    invoke-direct {p0, p1, p2, p3}, Landroid/widget/HorizontalScrollView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 4
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/google/android/material/tabs/TabLayout;->h:Ljava/util/ArrayList;

    .line 5
    new-instance p1, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {p1}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    iput-object p1, p0, Lcom/google/android/material/tabs/TabLayout;->s:Landroid/graphics/drawable/Drawable;

    const/4 p1, 0x0

    .line 6
    iput p1, p0, Lcom/google/android/material/tabs/TabLayout;->t:I

    const v0, 0x7fffffff

    .line 7
    iput v0, p0, Lcom/google/android/material/tabs/TabLayout;->y:I

    .line 8
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->N:Ljava/util/ArrayList;

    .line 9
    new-instance v0, Lb/h/l/f;

    const/16 v1, 0xc

    invoke-direct {v0, v1}, Lb/h/l/f;-><init>(I)V

    iput-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->W:Lb/h/l/e;

    .line 10
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 11
    invoke-virtual {p0, p1}, Landroid/widget/HorizontalScrollView;->setHorizontalScrollBarEnabled(Z)V

    .line 12
    new-instance v1, Lcom/google/android/material/tabs/TabLayout$f;

    invoke-direct {v1, p0, v0}, Lcom/google/android/material/tabs/TabLayout$f;-><init>(Lcom/google/android/material/tabs/TabLayout;Landroid/content/Context;)V

    iput-object v1, p0, Lcom/google/android/material/tabs/TabLayout;->j:Lcom/google/android/material/tabs/TabLayout$f;

    .line 13
    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v8, -0x1

    const/4 v3, -0x2

    invoke-direct {v2, v3, v8}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-super {p0, v1, p1, v2}, Landroid/widget/HorizontalScrollView;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 14
    sget-object v4, Lc/a/a/a/l;->TabLayout:[I

    sget v6, Lcom/google/android/material/tabs/TabLayout;->a0:I

    const/4 v1, 0x1

    new-array v7, v1, [I

    sget v2, Lc/a/a/a/l;->TabLayout_tabTextAppearance:I

    aput v2, v7, p1

    move-object v2, v0

    move-object v3, p2

    move v5, p3

    .line 15
    invoke-static/range {v2 .. v7}, Lc/a/a/a/d0/m;->c(Landroid/content/Context;Landroid/util/AttributeSet;[III[I)Landroid/content/res/TypedArray;

    move-result-object p2

    .line 16
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object p3

    instance-of p3, p3, Landroid/graphics/drawable/ColorDrawable;

    if-eqz p3, :cond_84

    .line 17
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object p3

    check-cast p3, Landroid/graphics/drawable/ColorDrawable;

    .line 18
    new-instance v2, Lc/a/a/a/l0/h;

    invoke-direct {v2}, Lc/a/a/a/l0/h;-><init>()V

    .line 19
    invoke-virtual {p3}, Landroid/graphics/drawable/ColorDrawable;->getColor()I

    move-result p3

    invoke-static {p3}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p3

    invoke-virtual {v2, p3}, Lc/a/a/a/l0/h;->a(Landroid/content/res/ColorStateList;)V

    .line 20
    invoke-virtual {v2, v0}, Lc/a/a/a/l0/h;->a(Landroid/content/Context;)V

    .line 21
    invoke-static {p0}, Lb/h/m/y;->m(Landroid/view/View;)F

    move-result p3

    invoke-virtual {v2, p3}, Lc/a/a/a/l0/h;->b(F)V

    .line 22
    invoke-static {p0, v2}, Lb/h/m/y;->a(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 23
    :cond_84
    sget p3, Lc/a/a/a/l;->TabLayout_tabIndicator:I

    .line 24
    invoke-static {v0, p2, p3}, Lc/a/a/a/i0/c;->b(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/graphics/drawable/Drawable;

    move-result-object p3

    .line 25
    invoke-virtual {p0, p3}, Lcom/google/android/material/tabs/TabLayout;->setSelectedTabIndicator(Landroid/graphics/drawable/Drawable;)V

    .line 26
    sget p3, Lc/a/a/a/l;->TabLayout_tabIndicatorColor:I

    .line 27
    invoke-virtual {p2, p3, p1}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p3

    .line 28
    invoke-virtual {p0, p3}, Lcom/google/android/material/tabs/TabLayout;->setSelectedTabIndicatorColor(I)V

    .line 29
    iget-object p3, p0, Lcom/google/android/material/tabs/TabLayout;->j:Lcom/google/android/material/tabs/TabLayout$f;

    sget v2, Lc/a/a/a/l;->TabLayout_tabIndicatorHeight:I

    .line 30
    invoke-virtual {p2, v2, v8}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    .line 31
    invoke-virtual {p3, v2}, Lcom/google/android/material/tabs/TabLayout$f;->a(I)V

    .line 32
    sget p3, Lc/a/a/a/l;->TabLayout_tabIndicatorGravity:I

    .line 33
    invoke-virtual {p2, p3, p1}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result p3

    .line 34
    invoke-virtual {p0, p3}, Lcom/google/android/material/tabs/TabLayout;->setSelectedTabIndicatorGravity(I)V

    .line 35
    sget p3, Lc/a/a/a/l;->TabLayout_tabIndicatorFullWidth:I

    invoke-virtual {p2, p3, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p3

    invoke-virtual {p0, p3}, Lcom/google/android/material/tabs/TabLayout;->setTabIndicatorFullWidth(Z)V

    .line 36
    sget p3, Lc/a/a/a/l;->TabLayout_tabIndicatorAnimationMode:I

    .line 37
    invoke-virtual {p2, p3, p1}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result p3

    .line 38
    invoke-virtual {p0, p3}, Lcom/google/android/material/tabs/TabLayout;->setTabIndicatorAnimationMode(I)V

    .line 39
    sget p3, Lc/a/a/a/l;->TabLayout_tabPadding:I

    .line 40
    invoke-virtual {p2, p3, p1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p3

    iput p3, p0, Lcom/google/android/material/tabs/TabLayout;->n:I

    iput p3, p0, Lcom/google/android/material/tabs/TabLayout;->m:I

    iput p3, p0, Lcom/google/android/material/tabs/TabLayout;->l:I

    iput p3, p0, Lcom/google/android/material/tabs/TabLayout;->k:I

    .line 41
    sget v2, Lc/a/a/a/l;->TabLayout_tabPaddingStart:I

    .line 42
    invoke-virtual {p2, v2, p3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p3

    iput p3, p0, Lcom/google/android/material/tabs/TabLayout;->k:I

    .line 43
    sget p3, Lc/a/a/a/l;->TabLayout_tabPaddingTop:I

    iget v2, p0, Lcom/google/android/material/tabs/TabLayout;->l:I

    invoke-virtual {p2, p3, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p3

    iput p3, p0, Lcom/google/android/material/tabs/TabLayout;->l:I

    .line 44
    sget p3, Lc/a/a/a/l;->TabLayout_tabPaddingEnd:I

    iget v2, p0, Lcom/google/android/material/tabs/TabLayout;->m:I

    invoke-virtual {p2, p3, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p3

    iput p3, p0, Lcom/google/android/material/tabs/TabLayout;->m:I

    .line 45
    sget p3, Lc/a/a/a/l;->TabLayout_tabPaddingBottom:I

    iget v2, p0, Lcom/google/android/material/tabs/TabLayout;->n:I

    .line 46
    invoke-virtual {p2, p3, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p3

    iput p3, p0, Lcom/google/android/material/tabs/TabLayout;->n:I

    .line 47
    sget p3, Lc/a/a/a/l;->TabLayout_tabTextAppearance:I

    sget v2, Lc/a/a/a/k;->TextAppearance_Design_Tab:I

    .line 48
    invoke-virtual {p2, p3, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p3

    iput p3, p0, Lcom/google/android/material/tabs/TabLayout;->o:I

    .line 49
    sget-object v2, Lb/b/j;->TextAppearance:[I

    .line 50
    invoke-virtual {v0, p3, v2}, Landroid/content/Context;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object p3

    .line 51
    :try_start_100
    sget v2, Lb/b/j;->TextAppearance_android_textSize:I

    .line 52
    invoke-virtual {p3, v2, p1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    int-to-float v2, v2

    iput v2, p0, Lcom/google/android/material/tabs/TabLayout;->v:F

    .line 53
    sget v2, Lb/b/j;->TextAppearance_android_textColor:I

    .line 54
    invoke-static {v0, p3, v2}, Lc/a/a/a/i0/c;->a(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/content/res/ColorStateList;

    move-result-object v2

    iput-object v2, p0, Lcom/google/android/material/tabs/TabLayout;->p:Landroid/content/res/ColorStateList;
    :try_end_111
    .catchall {:try_start_100 .. :try_end_111} :catchall_1c1

    .line 55
    invoke-virtual {p3}, Landroid/content/res/TypedArray;->recycle()V

    .line 56
    sget p3, Lc/a/a/a/l;->TabLayout_tabTextColor:I

    invoke-virtual {p2, p3}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p3

    if-eqz p3, :cond_124

    .line 57
    sget p3, Lc/a/a/a/l;->TabLayout_tabTextColor:I

    .line 58
    invoke-static {v0, p2, p3}, Lc/a/a/a/i0/c;->a(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/content/res/ColorStateList;

    move-result-object p3

    iput-object p3, p0, Lcom/google/android/material/tabs/TabLayout;->p:Landroid/content/res/ColorStateList;

    .line 59
    :cond_124
    sget p3, Lc/a/a/a/l;->TabLayout_tabSelectedTextColor:I

    invoke-virtual {p2, p3}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p3

    if-eqz p3, :cond_13e

    .line 60
    sget p3, Lc/a/a/a/l;->TabLayout_tabSelectedTextColor:I

    invoke-virtual {p2, p3, p1}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p3

    .line 61
    iget-object v2, p0, Lcom/google/android/material/tabs/TabLayout;->p:Landroid/content/res/ColorStateList;

    invoke-virtual {v2}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v2

    invoke-static {v2, p3}, Lcom/google/android/material/tabs/TabLayout;->a(II)Landroid/content/res/ColorStateList;

    move-result-object p3

    iput-object p3, p0, Lcom/google/android/material/tabs/TabLayout;->p:Landroid/content/res/ColorStateList;

    .line 62
    :cond_13e
    sget p3, Lc/a/a/a/l;->TabLayout_tabIconTint:I

    .line 63
    invoke-static {v0, p2, p3}, Lc/a/a/a/i0/c;->a(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/content/res/ColorStateList;

    move-result-object p3

    iput-object p3, p0, Lcom/google/android/material/tabs/TabLayout;->q:Landroid/content/res/ColorStateList;

    .line 64
    sget p3, Lc/a/a/a/l;->TabLayout_tabIconTintMode:I

    .line 65
    invoke-virtual {p2, p3, v8}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result p3

    const/4 v2, 0x0

    invoke-static {p3, v2}, Lc/a/a/a/d0/t;->a(ILandroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuff$Mode;

    move-result-object p3

    iput-object p3, p0, Lcom/google/android/material/tabs/TabLayout;->u:Landroid/graphics/PorterDuff$Mode;

    .line 66
    sget p3, Lc/a/a/a/l;->TabLayout_tabRippleColor:I

    .line 67
    invoke-static {v0, p2, p3}, Lc/a/a/a/i0/c;->a(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/content/res/ColorStateList;

    move-result-object p3

    iput-object p3, p0, Lcom/google/android/material/tabs/TabLayout;->r:Landroid/content/res/ColorStateList;

    .line 68
    sget p3, Lc/a/a/a/l;->TabLayout_tabIndicatorAnimationDuration:I

    const/16 v0, 0x12c

    .line 69
    invoke-virtual {p2, p3, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result p3

    iput p3, p0, Lcom/google/android/material/tabs/TabLayout;->E:I

    .line 70
    sget p3, Lc/a/a/a/l;->TabLayout_tabMinWidth:I

    .line 71
    invoke-virtual {p2, p3, v8}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p3

    iput p3, p0, Lcom/google/android/material/tabs/TabLayout;->z:I

    .line 72
    sget p3, Lc/a/a/a/l;->TabLayout_tabMaxWidth:I

    .line 73
    invoke-virtual {p2, p3, v8}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p3

    iput p3, p0, Lcom/google/android/material/tabs/TabLayout;->A:I

    .line 74
    sget p3, Lc/a/a/a/l;->TabLayout_tabBackground:I

    invoke-virtual {p2, p3, p1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p3

    iput p3, p0, Lcom/google/android/material/tabs/TabLayout;->x:I

    .line 75
    sget p3, Lc/a/a/a/l;->TabLayout_tabContentStart:I

    invoke-virtual {p2, p3, p1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p3

    iput p3, p0, Lcom/google/android/material/tabs/TabLayout;->C:I

    .line 76
    sget p3, Lc/a/a/a/l;->TabLayout_tabMode:I

    invoke-virtual {p2, p3, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result p3

    iput p3, p0, Lcom/google/android/material/tabs/TabLayout;->G:I

    .line 77
    sget p3, Lc/a/a/a/l;->TabLayout_tabGravity:I

    invoke-virtual {p2, p3, p1}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result p3

    iput p3, p0, Lcom/google/android/material/tabs/TabLayout;->D:I

    .line 78
    sget p3, Lc/a/a/a/l;->TabLayout_tabInlineLabel:I

    invoke-virtual {p2, p3, p1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p3

    iput-boolean p3, p0, Lcom/google/android/material/tabs/TabLayout;->H:Z

    .line 79
    sget p3, Lc/a/a/a/l;->TabLayout_tabUnboundedRipple:I

    invoke-virtual {p2, p3, p1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p1

    iput-boolean p1, p0, Lcom/google/android/material/tabs/TabLayout;->K:Z

    .line 80
    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    .line 81
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    .line 82
    sget p2, Lc/a/a/a/d;->design_tab_text_size_2line:I

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    int-to-float p2, p2

    iput p2, p0, Lcom/google/android/material/tabs/TabLayout;->w:F

    .line 83
    sget p2, Lc/a/a/a/d;->design_tab_scrollable_min_width:I

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/google/android/material/tabs/TabLayout;->B:I

    .line 84
    invoke-virtual {p0}, Lcom/google/android/material/tabs/TabLayout;->a()V

    return-void

    :catchall_1c1
    move-exception p1

    .line 85
    invoke-virtual {p3}, Landroid/content/res/TypedArray;->recycle()V

    .line 86
    throw p1
.end method

.method public static a(II)Landroid/content/res/ColorStateList;
    .registers 6

    const/4 v0, 0x2

    new-array v1, v0, [[I

    new-array v0, v0, [I

    .line 107
    sget-object v2, Landroid/widget/HorizontalScrollView;->SELECTED_STATE_SET:[I

    const/4 v3, 0x0

    aput-object v2, v1, v3

    aput p1, v0, v3

    .line 108
    sget-object p1, Landroid/widget/HorizontalScrollView;->EMPTY_STATE_SET:[I

    const/4 v2, 0x1

    aput-object p1, v1, v2

    aput p0, v0, v2

    .line 109
    new-instance p0, Landroid/content/res/ColorStateList;

    invoke-direct {p0, v1, v0}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    return-object p0
.end method

.method public static synthetic a(Lcom/google/android/material/tabs/TabLayout;)Lc/a/a/a/o0/b;
    .registers 1

    .line 1
    iget-object p0, p0, Lcom/google/android/material/tabs/TabLayout;->L:Lc/a/a/a/o0/b;

    return-object p0
.end method

.method public static synthetic b(Lcom/google/android/material/tabs/TabLayout;)I
    .registers 1

    .line 1
    iget p0, p0, Lcom/google/android/material/tabs/TabLayout;->t:I

    return p0
.end method

.method private getDefaultHeight()I
    .registers 6

    .line 1
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->h:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_8
    if-ge v2, v0, :cond_29

    .line 2
    iget-object v3, p0, Lcom/google/android/material/tabs/TabLayout;->h:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/material/tabs/TabLayout$g;

    if-eqz v3, :cond_26

    .line 3
    invoke-virtual {v3}, Lcom/google/android/material/tabs/TabLayout$g;->b()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    if-eqz v4, :cond_26

    invoke-virtual {v3}, Lcom/google/android/material/tabs/TabLayout$g;->e()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_26

    const/4 v1, 0x1

    goto :goto_29

    :cond_26
    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    :cond_29
    :goto_29
    if-eqz v1, :cond_32

    .line 4
    iget-boolean v0, p0, Lcom/google/android/material/tabs/TabLayout;->H:Z

    if-nez v0, :cond_32

    const/16 v0, 0x48

    goto :goto_34

    :cond_32
    const/16 v0, 0x30

    :goto_34
    return v0
.end method

.method private getTabMinWidth()I
    .registers 3

    .line 1
    iget v0, p0, Lcom/google/android/material/tabs/TabLayout;->z:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_6

    return v0

    .line 2
    :cond_6
    iget v0, p0, Lcom/google/android/material/tabs/TabLayout;->G:I

    if-eqz v0, :cond_10

    const/4 v1, 0x2

    if-ne v0, v1, :cond_e

    goto :goto_10

    :cond_e
    const/4 v0, 0x0

    goto :goto_12

    :cond_10
    :goto_10
    iget v0, p0, Lcom/google/android/material/tabs/TabLayout;->B:I

    :goto_12
    return v0
.end method

.method private getTabScrollRange()I
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->j:Lcom/google/android/material/tabs/TabLayout$f;

    .line 2
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getWidth()I

    move-result v1

    sub-int/2addr v0, v1

    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getPaddingLeft()I

    move-result v1

    sub-int/2addr v0, v1

    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getPaddingRight()I

    move-result v1

    sub-int/2addr v0, v1

    const/4 v1, 0x0

    .line 3
    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    return v0
.end method

.method private setSelectedTabView(I)V
    .registers 8

    .line 1
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->j:Lcom/google/android/material/tabs/TabLayout$f;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    if-ge p1, v0, :cond_25

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_a
    if-ge v2, v0, :cond_25

    .line 2
    iget-object v3, p0, Lcom/google/android/material/tabs/TabLayout;->j:Lcom/google/android/material/tabs/TabLayout$f;

    invoke-virtual {v3, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    const/4 v4, 0x1

    if-ne v2, p1, :cond_17

    const/4 v5, 0x1

    goto :goto_18

    :cond_17
    const/4 v5, 0x0

    .line 3
    :goto_18
    invoke-virtual {v3, v5}, Landroid/view/View;->setSelected(Z)V

    if-ne v2, p1, :cond_1e

    goto :goto_1f

    :cond_1e
    const/4 v4, 0x0

    .line 4
    :goto_1f
    invoke-virtual {v3, v4}, Landroid/view/View;->setActivated(Z)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_a

    :cond_25
    return-void
.end method


# virtual methods
.method public final a(IF)I
    .registers 7

    .line 84
    iget v0, p0, Lcom/google/android/material/tabs/TabLayout;->G:I

    const/4 v1, 0x0

    const/4 v2, 0x2

    if-eqz v0, :cond_a

    if-ne v0, v2, :cond_9

    goto :goto_a

    :cond_9
    return v1

    .line 85
    :cond_a
    :goto_a
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->j:Lcom/google/android/material/tabs/TabLayout$f;

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    add-int/lit8 p1, p1, 0x1

    .line 86
    iget-object v3, p0, Lcom/google/android/material/tabs/TabLayout;->j:Lcom/google/android/material/tabs/TabLayout$f;

    .line 87
    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v3

    if-ge p1, v3, :cond_21

    iget-object v3, p0, Lcom/google/android/material/tabs/TabLayout;->j:Lcom/google/android/material/tabs/TabLayout$f;

    .line 88
    invoke-virtual {v3, p1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object p1

    goto :goto_22

    :cond_21
    const/4 p1, 0x0

    :goto_22
    if-eqz v0, :cond_29

    .line 89
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v3

    goto :goto_2a

    :cond_29
    const/4 v3, 0x0

    :goto_2a
    if-eqz p1, :cond_30

    .line 90
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v1

    .line 91
    :cond_30
    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    move-result p1

    div-int/lit8 v0, v3, 0x2

    add-int/2addr p1, v0

    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getWidth()I

    move-result v0

    div-int/2addr v0, v2

    sub-int/2addr p1, v0

    add-int/2addr v3, v1

    int-to-float v0, v3

    const/high16 v1, 0x3f000000    # 0.5f

    mul-float v0, v0, v1

    mul-float v0, v0, p2

    float-to-int p2, v0

    .line 92
    invoke-static {p0}, Lb/h/m/y;->r(Landroid/view/View;)I

    move-result v0

    if-nez v0, :cond_4e

    add-int/2addr p1, p2

    goto :goto_4f

    :cond_4e
    sub-int/2addr p1, p2

    :goto_4f
    return p1
.end method

.method public final a()V
    .registers 5

    .line 93
    iget v0, p0, Lcom/google/android/material/tabs/TabLayout;->G:I

    const/4 v1, 0x2

    const/4 v2, 0x0

    if-eqz v0, :cond_b

    if-ne v0, v1, :cond_9

    goto :goto_b

    :cond_9
    const/4 v0, 0x0

    goto :goto_14

    .line 94
    :cond_b
    :goto_b
    iget v0, p0, Lcom/google/android/material/tabs/TabLayout;->C:I

    iget v3, p0, Lcom/google/android/material/tabs/TabLayout;->k:I

    sub-int/2addr v0, v3

    invoke-static {v2, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 95
    :goto_14
    iget-object v3, p0, Lcom/google/android/material/tabs/TabLayout;->j:Lcom/google/android/material/tabs/TabLayout$f;

    invoke-static {v3, v0, v2, v2, v2}, Lb/h/m/y;->a(Landroid/view/View;IIII)V

    .line 96
    iget v0, p0, Lcom/google/android/material/tabs/TabLayout;->G:I

    const/4 v2, 0x1

    if-eqz v0, :cond_34

    if-eq v0, v2, :cond_23

    if-eq v0, v1, :cond_23

    goto :goto_39

    .line 97
    :cond_23
    iget v0, p0, Lcom/google/android/material/tabs/TabLayout;->D:I

    if-ne v0, v1, :cond_2e

    const-string v0, "TabLayout"

    const-string v1, "GRAVITY_START is not supported with the current tab mode, GRAVITY_CENTER will be used instead"

    .line 98
    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 99
    :cond_2e
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->j:Lcom/google/android/material/tabs/TabLayout$f;

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setGravity(I)V

    goto :goto_39

    .line 100
    :cond_34
    iget v0, p0, Lcom/google/android/material/tabs/TabLayout;->D:I

    invoke-virtual {p0, v0}, Lcom/google/android/material/tabs/TabLayout;->b(I)V

    .line 101
    :goto_39
    invoke-virtual {p0, v2}, Lcom/google/android/material/tabs/TabLayout;->a(Z)V

    return-void
.end method

.method public final a(I)V
    .registers 8

    const/4 v0, -0x1

    if-ne p1, v0, :cond_4

    return-void

    .line 74
    :cond_4
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getWindowToken()Landroid/os/IBinder;

    move-result-object v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_42

    .line 75
    invoke-static {p0}, Lb/h/m/y;->K(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_42

    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->j:Lcom/google/android/material/tabs/TabLayout$f;

    .line 76
    invoke-virtual {v0}, Lcom/google/android/material/tabs/TabLayout$f;->a()Z

    move-result v0

    if-eqz v0, :cond_1b

    goto :goto_42

    .line 77
    :cond_1b
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getScrollX()I

    move-result v0

    .line 78
    invoke-virtual {p0, p1, v2}, Lcom/google/android/material/tabs/TabLayout;->a(IF)I

    move-result v2

    if-eq v0, v2, :cond_3a

    .line 79
    invoke-virtual {p0}, Lcom/google/android/material/tabs/TabLayout;->d()V

    .line 80
    iget-object v3, p0, Lcom/google/android/material/tabs/TabLayout;->P:Landroid/animation/ValueAnimator;

    const/4 v4, 0x2

    new-array v4, v4, [I

    const/4 v5, 0x0

    aput v0, v4, v5

    aput v2, v4, v1

    invoke-virtual {v3, v4}, Landroid/animation/ValueAnimator;->setIntValues([I)V

    .line 81
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->P:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 82
    :cond_3a
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->j:Lcom/google/android/material/tabs/TabLayout$f;

    iget v1, p0, Lcom/google/android/material/tabs/TabLayout;->E:I

    invoke-virtual {v0, p1, v1}, Lcom/google/android/material/tabs/TabLayout$f;->a(II)V

    return-void

    .line 83
    :cond_42
    :goto_42
    invoke-virtual {p0, p1, v2, v1}, Lcom/google/android/material/tabs/TabLayout;->a(IFZ)V

    return-void
.end method

.method public a(IFZ)V
    .registers 5

    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/google/android/material/tabs/TabLayout;->a(IFZZ)V

    return-void
.end method

.method public a(IFZZ)V
    .registers 7

    int-to-float v0, p1

    add-float/2addr v0, p2

    .line 3
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    if-ltz v0, :cond_34

    .line 4
    iget-object v1, p0, Lcom/google/android/material/tabs/TabLayout;->j:Lcom/google/android/material/tabs/TabLayout$f;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v1

    if-lt v0, v1, :cond_11

    goto :goto_34

    :cond_11
    if-eqz p4, :cond_18

    .line 5
    iget-object p4, p0, Lcom/google/android/material/tabs/TabLayout;->j:Lcom/google/android/material/tabs/TabLayout$f;

    invoke-virtual {p4, p1, p2}, Lcom/google/android/material/tabs/TabLayout$f;->a(IF)V

    .line 6
    :cond_18
    iget-object p4, p0, Lcom/google/android/material/tabs/TabLayout;->P:Landroid/animation/ValueAnimator;

    if-eqz p4, :cond_27

    invoke-virtual {p4}, Landroid/animation/ValueAnimator;->isRunning()Z

    move-result p4

    if-eqz p4, :cond_27

    .line 7
    iget-object p4, p0, Lcom/google/android/material/tabs/TabLayout;->P:Landroid/animation/ValueAnimator;

    invoke-virtual {p4}, Landroid/animation/ValueAnimator;->cancel()V

    .line 8
    :cond_27
    invoke-virtual {p0, p1, p2}, Lcom/google/android/material/tabs/TabLayout;->a(IF)I

    move-result p1

    const/4 p2, 0x0

    invoke-virtual {p0, p1, p2}, Landroid/widget/HorizontalScrollView;->scrollTo(II)V

    if-eqz p3, :cond_34

    .line 9
    invoke-direct {p0, v0}, Lcom/google/android/material/tabs/TabLayout;->setSelectedTabView(I)V

    :cond_34
    :goto_34
    return-void
.end method

.method public final a(Landroid/view/View;)V
    .registers 3

    .line 66
    instance-of v0, p1, Lcom/google/android/material/tabs/TabItem;

    if-eqz v0, :cond_a

    .line 67
    check-cast p1, Lcom/google/android/material/tabs/TabItem;

    invoke-virtual {p0, p1}, Lcom/google/android/material/tabs/TabLayout;->a(Lcom/google/android/material/tabs/TabItem;)V

    return-void

    .line 68
    :cond_a
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Only TabItem instances can be added to TabLayout"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final a(Landroid/widget/LinearLayout$LayoutParams;)V
    .registers 4

    .line 69
    iget v0, p0, Lcom/google/android/material/tabs/TabLayout;->G:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_11

    iget v0, p0, Lcom/google/android/material/tabs/TabLayout;->D:I

    if-nez v0, :cond_11

    const/4 v0, 0x0

    .line 70
    iput v0, p1, Landroid/widget/LinearLayout$LayoutParams;->width:I

    const/high16 v0, 0x3f800000    # 1.0f

    .line 71
    iput v0, p1, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    goto :goto_17

    :cond_11
    const/4 v0, -0x2

    .line 72
    iput v0, p1, Landroid/widget/LinearLayout$LayoutParams;->width:I

    const/4 v0, 0x0

    .line 73
    iput v0, p1, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    :goto_17
    return-void
.end method

.method public a(Landroidx/viewpager/widget/ViewPager;Z)V
    .registers 4

    const/4 v0, 0x0

    .line 29
    invoke-virtual {p0, p1, p2, v0}, Lcom/google/android/material/tabs/TabLayout;->a(Landroidx/viewpager/widget/ViewPager;ZZ)V

    return-void
.end method

.method public final a(Landroidx/viewpager/widget/ViewPager;ZZ)V
    .registers 6

    .line 30
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->Q:Landroidx/viewpager/widget/ViewPager;

    if-eqz v0, :cond_14

    .line 31
    iget-object v1, p0, Lcom/google/android/material/tabs/TabLayout;->T:Lcom/google/android/material/tabs/TabLayout$h;

    if-eqz v1, :cond_b

    .line 32
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->b(Landroidx/viewpager/widget/ViewPager$i;)V

    .line 33
    :cond_b
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->U:Lcom/google/android/material/tabs/TabLayout$b;

    if-eqz v0, :cond_14

    .line 34
    iget-object v1, p0, Lcom/google/android/material/tabs/TabLayout;->Q:Landroidx/viewpager/widget/ViewPager;

    invoke-virtual {v1, v0}, Landroidx/viewpager/widget/ViewPager;->b(Landroidx/viewpager/widget/ViewPager$h;)V

    .line 35
    :cond_14
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->O:Lcom/google/android/material/tabs/TabLayout$c;

    const/4 v1, 0x0

    if-eqz v0, :cond_1e

    .line 36
    invoke-virtual {p0, v0}, Lcom/google/android/material/tabs/TabLayout;->b(Lcom/google/android/material/tabs/TabLayout$c;)V

    .line 37
    iput-object v1, p0, Lcom/google/android/material/tabs/TabLayout;->O:Lcom/google/android/material/tabs/TabLayout$c;

    :cond_1e
    if-eqz p1, :cond_69

    .line 38
    iput-object p1, p0, Lcom/google/android/material/tabs/TabLayout;->Q:Landroidx/viewpager/widget/ViewPager;

    .line 39
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->T:Lcom/google/android/material/tabs/TabLayout$h;

    if-nez v0, :cond_2d

    .line 40
    new-instance v0, Lcom/google/android/material/tabs/TabLayout$h;

    invoke-direct {v0, p0}, Lcom/google/android/material/tabs/TabLayout$h;-><init>(Lcom/google/android/material/tabs/TabLayout;)V

    iput-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->T:Lcom/google/android/material/tabs/TabLayout$h;

    .line 41
    :cond_2d
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->T:Lcom/google/android/material/tabs/TabLayout$h;

    invoke-virtual {v0}, Lcom/google/android/material/tabs/TabLayout$h;->a()V

    .line 42
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->T:Lcom/google/android/material/tabs/TabLayout$h;

    invoke-virtual {p1, v0}, Landroidx/viewpager/widget/ViewPager;->a(Landroidx/viewpager/widget/ViewPager$i;)V

    .line 43
    new-instance v0, Lcom/google/android/material/tabs/TabLayout$j;

    invoke-direct {v0, p1}, Lcom/google/android/material/tabs/TabLayout$j;-><init>(Landroidx/viewpager/widget/ViewPager;)V

    iput-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->O:Lcom/google/android/material/tabs/TabLayout$c;

    .line 44
    invoke-virtual {p0, v0}, Lcom/google/android/material/tabs/TabLayout;->a(Lcom/google/android/material/tabs/TabLayout$c;)V

    .line 45
    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Lb/v/a/a;

    move-result-object v0

    if-eqz v0, :cond_4a

    .line 46
    invoke-virtual {p0, v0, p2}, Lcom/google/android/material/tabs/TabLayout;->a(Lb/v/a/a;Z)V

    .line 47
    :cond_4a
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->U:Lcom/google/android/material/tabs/TabLayout$b;

    if-nez v0, :cond_55

    .line 48
    new-instance v0, Lcom/google/android/material/tabs/TabLayout$b;

    invoke-direct {v0, p0}, Lcom/google/android/material/tabs/TabLayout$b;-><init>(Lcom/google/android/material/tabs/TabLayout;)V

    iput-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->U:Lcom/google/android/material/tabs/TabLayout$b;

    .line 49
    :cond_55
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->U:Lcom/google/android/material/tabs/TabLayout$b;

    invoke-virtual {v0, p2}, Lcom/google/android/material/tabs/TabLayout$b;->a(Z)V

    .line 50
    iget-object p2, p0, Lcom/google/android/material/tabs/TabLayout;->U:Lcom/google/android/material/tabs/TabLayout$b;

    invoke-virtual {p1, p2}, Landroidx/viewpager/widget/ViewPager;->a(Landroidx/viewpager/widget/ViewPager$h;)V

    .line 51
    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    move-result p1

    const/4 p2, 0x0

    const/4 v0, 0x1

    invoke-virtual {p0, p1, p2, v0}, Lcom/google/android/material/tabs/TabLayout;->a(IFZ)V

    goto :goto_6f

    .line 52
    :cond_69
    iput-object v1, p0, Lcom/google/android/material/tabs/TabLayout;->Q:Landroidx/viewpager/widget/ViewPager;

    const/4 p1, 0x0

    .line 53
    invoke-virtual {p0, v1, p1}, Lcom/google/android/material/tabs/TabLayout;->a(Lb/v/a/a;Z)V

    .line 54
    :goto_6f
    iput-boolean p3, p0, Lcom/google/android/material/tabs/TabLayout;->V:Z

    return-void
.end method

.method public a(Lb/v/a/a;Z)V
    .registers 5

    .line 55
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->R:Lb/v/a/a;

    if-eqz v0, :cond_b

    iget-object v1, p0, Lcom/google/android/material/tabs/TabLayout;->S:Landroid/database/DataSetObserver;

    if-eqz v1, :cond_b

    .line 56
    invoke-virtual {v0, v1}, Lb/v/a/a;->c(Landroid/database/DataSetObserver;)V

    .line 57
    :cond_b
    iput-object p1, p0, Lcom/google/android/material/tabs/TabLayout;->R:Lb/v/a/a;

    if-eqz p2, :cond_21

    if-eqz p1, :cond_21

    .line 58
    iget-object p2, p0, Lcom/google/android/material/tabs/TabLayout;->S:Landroid/database/DataSetObserver;

    if-nez p2, :cond_1c

    .line 59
    new-instance p2, Lcom/google/android/material/tabs/TabLayout$e;

    invoke-direct {p2, p0}, Lcom/google/android/material/tabs/TabLayout$e;-><init>(Lcom/google/android/material/tabs/TabLayout;)V

    iput-object p2, p0, Lcom/google/android/material/tabs/TabLayout;->S:Landroid/database/DataSetObserver;

    .line 60
    :cond_1c
    iget-object p2, p0, Lcom/google/android/material/tabs/TabLayout;->S:Landroid/database/DataSetObserver;

    invoke-virtual {p1, p2}, Lb/v/a/a;->a(Landroid/database/DataSetObserver;)V

    .line 61
    :cond_21
    invoke-virtual {p0}, Lcom/google/android/material/tabs/TabLayout;->g()V

    return-void
.end method

.method public final a(Lcom/google/android/material/tabs/TabItem;)V
    .registers 4

    .line 17
    invoke-virtual {p0}, Lcom/google/android/material/tabs/TabLayout;->f()Lcom/google/android/material/tabs/TabLayout$g;

    move-result-object v0

    .line 18
    iget-object v1, p1, Lcom/google/android/material/tabs/TabItem;->h:Ljava/lang/CharSequence;

    if-eqz v1, :cond_b

    .line 19
    invoke-virtual {v0, v1}, Lcom/google/android/material/tabs/TabLayout$g;->b(Ljava/lang/CharSequence;)Lcom/google/android/material/tabs/TabLayout$g;

    .line 20
    :cond_b
    iget-object v1, p1, Lcom/google/android/material/tabs/TabItem;->i:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_12

    .line 21
    invoke-virtual {v0, v1}, Lcom/google/android/material/tabs/TabLayout$g;->a(Landroid/graphics/drawable/Drawable;)Lcom/google/android/material/tabs/TabLayout$g;

    .line 22
    :cond_12
    iget v1, p1, Lcom/google/android/material/tabs/TabItem;->j:I

    if-eqz v1, :cond_19

    .line 23
    invoke-virtual {v0, v1}, Lcom/google/android/material/tabs/TabLayout$g;->a(I)Lcom/google/android/material/tabs/TabLayout$g;

    .line 24
    :cond_19
    invoke-virtual {p1}, Landroid/view/View;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2a

    .line 25
    invoke-virtual {p1}, Landroid/view/View;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/google/android/material/tabs/TabLayout$g;->a(Ljava/lang/CharSequence;)Lcom/google/android/material/tabs/TabLayout$g;

    .line 26
    :cond_2a
    invoke-virtual {p0, v0}, Lcom/google/android/material/tabs/TabLayout;->a(Lcom/google/android/material/tabs/TabLayout$g;)V

    return-void
.end method

.method public a(Lcom/google/android/material/tabs/TabLayout$c;)V
    .registers 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 27
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->N:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_d

    .line 28
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->N:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_d
    return-void
.end method

.method public a(Lcom/google/android/material/tabs/TabLayout$g;)V
    .registers 3

    .line 10
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->h:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    invoke-virtual {p0, p1, v0}, Lcom/google/android/material/tabs/TabLayout;->a(Lcom/google/android/material/tabs/TabLayout$g;Z)V

    return-void
.end method

.method public final a(Lcom/google/android/material/tabs/TabLayout$g;I)V
    .registers 4

    .line 62
    invoke-virtual {p1, p2}, Lcom/google/android/material/tabs/TabLayout$g;->b(I)V

    .line 63
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->h:Ljava/util/ArrayList;

    invoke-virtual {v0, p2, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 64
    iget-object p1, p0, Lcom/google/android/material/tabs/TabLayout;->h:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    :goto_e
    add-int/lit8 p2, p2, 0x1

    if-ge p2, p1, :cond_1e

    .line 65
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->h:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/tabs/TabLayout$g;

    invoke-virtual {v0, p2}, Lcom/google/android/material/tabs/TabLayout$g;->b(I)V

    goto :goto_e

    :cond_1e
    return-void
.end method

.method public a(Lcom/google/android/material/tabs/TabLayout$g;IZ)V
    .registers 5

    .line 12
    iget-object v0, p1, Lcom/google/android/material/tabs/TabLayout$g;->g:Lcom/google/android/material/tabs/TabLayout;

    if-ne v0, p0, :cond_10

    .line 13
    invoke-virtual {p0, p1, p2}, Lcom/google/android/material/tabs/TabLayout;->a(Lcom/google/android/material/tabs/TabLayout$g;I)V

    .line 14
    invoke-virtual {p0, p1}, Lcom/google/android/material/tabs/TabLayout;->b(Lcom/google/android/material/tabs/TabLayout$g;)V

    if-eqz p3, :cond_f

    .line 15
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout$g;->h()V

    :cond_f
    return-void

    .line 16
    :cond_10
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Tab belongs to a different TabLayout."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public a(Lcom/google/android/material/tabs/TabLayout$g;Z)V
    .registers 4

    .line 11
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->h:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-virtual {p0, p1, v0, p2}, Lcom/google/android/material/tabs/TabLayout;->a(Lcom/google/android/material/tabs/TabLayout$g;IZ)V

    return-void
.end method

.method public a(Z)V
    .registers 5

    const/4 v0, 0x0

    .line 102
    :goto_1
    iget-object v1, p0, Lcom/google/android/material/tabs/TabLayout;->j:Lcom/google/android/material/tabs/TabLayout$f;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_27

    .line 103
    iget-object v1, p0, Lcom/google/android/material/tabs/TabLayout;->j:Lcom/google/android/material/tabs/TabLayout$f;

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 104
    invoke-direct {p0}, Lcom/google/android/material/tabs/TabLayout;->getTabMinWidth()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/view/View;->setMinimumWidth(I)V

    .line 105
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {p0, v2}, Lcom/google/android/material/tabs/TabLayout;->a(Landroid/widget/LinearLayout$LayoutParams;)V

    if-eqz p1, :cond_24

    .line 106
    invoke-virtual {v1}, Landroid/view/View;->requestLayout()V

    :cond_24
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_27
    return-void
.end method

.method public addView(Landroid/view/View;)V
    .registers 2

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/android/material/tabs/TabLayout;->a(Landroid/view/View;)V

    return-void
.end method

.method public addView(Landroid/view/View;I)V
    .registers 3

    .line 2
    invoke-virtual {p0, p1}, Lcom/google/android/material/tabs/TabLayout;->a(Landroid/view/View;)V

    return-void
.end method

.method public addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V
    .registers 4

    .line 4
    invoke-virtual {p0, p1}, Lcom/google/android/material/tabs/TabLayout;->a(Landroid/view/View;)V

    return-void
.end method

.method public addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    .registers 3

    .line 3
    invoke-virtual {p0, p1}, Lcom/google/android/material/tabs/TabLayout;->a(Landroid/view/View;)V

    return-void
.end method

.method public final b()Landroid/widget/LinearLayout$LayoutParams;
    .registers 4

    .line 7
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x2

    const/4 v2, -0x1

    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 8
    invoke-virtual {p0, v0}, Lcom/google/android/material/tabs/TabLayout;->a(Landroid/widget/LinearLayout$LayoutParams;)V

    return-object v0
.end method

.method public final b(I)V
    .registers 3

    if-eqz p1, :cond_f

    const/4 v0, 0x1

    if-eq p1, v0, :cond_9

    const/4 v0, 0x2

    if-eq p1, v0, :cond_16

    goto :goto_1e

    .line 20
    :cond_9
    iget-object p1, p0, Lcom/google/android/material/tabs/TabLayout;->j:Lcom/google/android/material/tabs/TabLayout$f;

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setGravity(I)V

    goto :goto_1e

    :cond_f
    const-string p1, "TabLayout"

    const-string v0, "MODE_SCROLLABLE + GRAVITY_FILL is not supported, GRAVITY_START will be used instead"

    .line 21
    invoke-static {p1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 22
    :cond_16
    iget-object p1, p0, Lcom/google/android/material/tabs/TabLayout;->j:Lcom/google/android/material/tabs/TabLayout$f;

    const v0, 0x800003

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setGravity(I)V

    :goto_1e
    return-void
.end method

.method public b(Lcom/google/android/material/tabs/TabLayout$c;)V
    .registers 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 2
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->N:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method public final b(Lcom/google/android/material/tabs/TabLayout$g;)V
    .registers 5

    .line 3
    iget-object v0, p1, Lcom/google/android/material/tabs/TabLayout$g;->h:Lcom/google/android/material/tabs/TabLayout$i;

    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Lcom/google/android/material/tabs/TabLayout$i;->setSelected(Z)V

    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setActivated(Z)V

    .line 6
    iget-object v1, p0, Lcom/google/android/material/tabs/TabLayout;->j:Lcom/google/android/material/tabs/TabLayout$f;

    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout$g;->c()I

    move-result p1

    invoke-virtual {p0}, Lcom/google/android/material/tabs/TabLayout;->b()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v2

    invoke-virtual {v1, v0, p1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method public b(Lcom/google/android/material/tabs/TabLayout$g;Z)V
    .registers 7

    .line 9
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->i:Lcom/google/android/material/tabs/TabLayout$g;

    if-ne v0, p1, :cond_11

    if-eqz v0, :cond_40

    .line 10
    invoke-virtual {p0, p1}, Lcom/google/android/material/tabs/TabLayout;->d(Lcom/google/android/material/tabs/TabLayout$g;)V

    .line 11
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout$g;->c()I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/google/android/material/tabs/TabLayout;->a(I)V

    goto :goto_40

    :cond_11
    const/4 v1, -0x1

    if-eqz p1, :cond_19

    .line 12
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout$g;->c()I

    move-result v2

    goto :goto_1a

    :cond_19
    const/4 v2, -0x1

    :goto_1a
    if-eqz p2, :cond_34

    if-eqz v0, :cond_24

    .line 13
    invoke-virtual {v0}, Lcom/google/android/material/tabs/TabLayout$g;->c()I

    move-result p2

    if-ne p2, v1, :cond_2c

    :cond_24
    if-eq v2, v1, :cond_2c

    const/4 p2, 0x0

    const/4 v3, 0x1

    .line 14
    invoke-virtual {p0, v2, p2, v3}, Lcom/google/android/material/tabs/TabLayout;->a(IFZ)V

    goto :goto_2f

    .line 15
    :cond_2c
    invoke-virtual {p0, v2}, Lcom/google/android/material/tabs/TabLayout;->a(I)V

    :goto_2f
    if-eq v2, v1, :cond_34

    .line 16
    invoke-direct {p0, v2}, Lcom/google/android/material/tabs/TabLayout;->setSelectedTabView(I)V

    .line 17
    :cond_34
    iput-object p1, p0, Lcom/google/android/material/tabs/TabLayout;->i:Lcom/google/android/material/tabs/TabLayout$g;

    if-eqz v0, :cond_3b

    .line 18
    invoke-virtual {p0, v0}, Lcom/google/android/material/tabs/TabLayout;->f(Lcom/google/android/material/tabs/TabLayout$g;)V

    :cond_3b
    if-eqz p1, :cond_40

    .line 19
    invoke-virtual {p0, p1}, Lcom/google/android/material/tabs/TabLayout;->e(Lcom/google/android/material/tabs/TabLayout$g;)V

    :cond_40
    :goto_40
    return-void
.end method

.method public c()Lcom/google/android/material/tabs/TabLayout$g;
    .registers 2

    .line 1
    sget-object v0, Lcom/google/android/material/tabs/TabLayout;->b0:Lb/h/l/e;

    invoke-interface {v0}, Lb/h/l/e;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/tabs/TabLayout$g;

    if-nez v0, :cond_f

    .line 2
    new-instance v0, Lcom/google/android/material/tabs/TabLayout$g;

    invoke-direct {v0}, Lcom/google/android/material/tabs/TabLayout$g;-><init>()V

    :cond_f
    return-object v0
.end method

.method public c(I)Lcom/google/android/material/tabs/TabLayout$g;
    .registers 3

    if-ltz p1, :cond_12

    .line 3
    invoke-virtual {p0}, Lcom/google/android/material/tabs/TabLayout;->getTabCount()I

    move-result v0

    if-lt p1, v0, :cond_9

    goto :goto_12

    :cond_9
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->h:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/android/material/tabs/TabLayout$g;

    goto :goto_13

    :cond_12
    :goto_12
    const/4 p1, 0x0

    :goto_13
    return-object p1
.end method

.method public final c(Lcom/google/android/material/tabs/TabLayout$g;)Lcom/google/android/material/tabs/TabLayout$i;
    .registers 4

    .line 4
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->W:Lb/h/l/e;

    if-eqz v0, :cond_b

    invoke-interface {v0}, Lb/h/l/e;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/tabs/TabLayout$i;

    goto :goto_c

    :cond_b
    const/4 v0, 0x0

    :goto_c
    if-nez v0, :cond_17

    .line 5
    new-instance v0, Lcom/google/android/material/tabs/TabLayout$i;

    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/google/android/material/tabs/TabLayout$i;-><init>(Lcom/google/android/material/tabs/TabLayout;Landroid/content/Context;)V

    .line 6
    :cond_17
    invoke-virtual {v0, p1}, Lcom/google/android/material/tabs/TabLayout$i;->setTab(Lcom/google/android/material/tabs/TabLayout$g;)V

    const/4 v1, 0x1

    .line 7
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setFocusable(Z)V

    .line 8
    invoke-direct {p0}, Lcom/google/android/material/tabs/TabLayout;->getTabMinWidth()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setMinimumWidth(I)V

    .line 9
    invoke-static {p1}, Lcom/google/android/material/tabs/TabLayout$g;->c(Lcom/google/android/material/tabs/TabLayout$g;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_37

    .line 10
    invoke-static {p1}, Lcom/google/android/material/tabs/TabLayout$g;->d(Lcom/google/android/material/tabs/TabLayout$g;)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->setContentDescription(Ljava/lang/CharSequence;)V

    goto :goto_3e

    .line 11
    :cond_37
    invoke-static {p1}, Lcom/google/android/material/tabs/TabLayout$g;->c(Lcom/google/android/material/tabs/TabLayout$g;)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->setContentDescription(Ljava/lang/CharSequence;)V

    :goto_3e
    return-object v0
.end method

.method public final d()V
    .registers 4

    .line 6
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->P:Landroid/animation/ValueAnimator;

    if-nez v0, :cond_22

    .line 7
    new-instance v0, Landroid/animation/ValueAnimator;

    invoke-direct {v0}, Landroid/animation/ValueAnimator;-><init>()V

    iput-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->P:Landroid/animation/ValueAnimator;

    .line 8
    sget-object v1, Lc/a/a/a/m/a;->b:Landroid/animation/TimeInterpolator;

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 9
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->P:Landroid/animation/ValueAnimator;

    iget v1, p0, Lcom/google/android/material/tabs/TabLayout;->E:I

    int-to-long v1, v1

    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 10
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->P:Landroid/animation/ValueAnimator;

    new-instance v1, Lcom/google/android/material/tabs/TabLayout$a;

    invoke-direct {v1, p0}, Lcom/google/android/material/tabs/TabLayout$a;-><init>(Lcom/google/android/material/tabs/TabLayout;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    :cond_22
    return-void
.end method

.method public final d(I)V
    .registers 4

    .line 1
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->j:Lcom/google/android/material/tabs/TabLayout$f;

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/tabs/TabLayout$i;

    .line 2
    iget-object v1, p0, Lcom/google/android/material/tabs/TabLayout;->j:Lcom/google/android/material/tabs/TabLayout$f;

    invoke-virtual {v1, p1}, Landroid/widget/LinearLayout;->removeViewAt(I)V

    if-eqz v0, :cond_17

    .line 3
    invoke-virtual {v0}, Lcom/google/android/material/tabs/TabLayout$i;->e()V

    .line 4
    iget-object p1, p0, Lcom/google/android/material/tabs/TabLayout;->W:Lb/h/l/e;

    invoke-interface {p1, v0}, Lb/h/l/e;->a(Ljava/lang/Object;)Z

    .line 5
    :cond_17
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->requestLayout()V

    return-void
.end method

.method public final d(Lcom/google/android/material/tabs/TabLayout$g;)V
    .registers 4

    .line 11
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->N:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_8
    if-ltz v0, :cond_18

    .line 12
    iget-object v1, p0, Lcom/google/android/material/tabs/TabLayout;->N:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/material/tabs/TabLayout$c;

    invoke-interface {v1, p1}, Lcom/google/android/material/tabs/TabLayout$c;->c(Lcom/google/android/material/tabs/TabLayout$g;)V

    add-int/lit8 v0, v0, -0x1

    goto :goto_8

    :cond_18
    return-void
.end method

.method public final e(Lcom/google/android/material/tabs/TabLayout$g;)V
    .registers 4

    .line 2
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->N:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_8
    if-ltz v0, :cond_18

    .line 3
    iget-object v1, p0, Lcom/google/android/material/tabs/TabLayout;->N:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/material/tabs/TabLayout$c;

    invoke-interface {v1, p1}, Lcom/google/android/material/tabs/TabLayout$c;->b(Lcom/google/android/material/tabs/TabLayout$g;)V

    add-int/lit8 v0, v0, -0x1

    goto :goto_8

    :cond_18
    return-void
.end method

.method public e()Z
    .registers 2

    .line 1
    iget-boolean v0, p0, Lcom/google/android/material/tabs/TabLayout;->I:Z

    return v0
.end method

.method public f()Lcom/google/android/material/tabs/TabLayout$g;
    .registers 4

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/tabs/TabLayout;->c()Lcom/google/android/material/tabs/TabLayout$g;

    move-result-object v0

    .line 2
    iput-object p0, v0, Lcom/google/android/material/tabs/TabLayout$g;->g:Lcom/google/android/material/tabs/TabLayout;

    .line 3
    invoke-virtual {p0, v0}, Lcom/google/android/material/tabs/TabLayout;->c(Lcom/google/android/material/tabs/TabLayout$g;)Lcom/google/android/material/tabs/TabLayout$i;

    move-result-object v1

    iput-object v1, v0, Lcom/google/android/material/tabs/TabLayout$g;->h:Lcom/google/android/material/tabs/TabLayout$i;

    .line 4
    invoke-static {v0}, Lcom/google/android/material/tabs/TabLayout$g;->a(Lcom/google/android/material/tabs/TabLayout$g;)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_1c

    .line 5
    iget-object v1, v0, Lcom/google/android/material/tabs/TabLayout$g;->h:Lcom/google/android/material/tabs/TabLayout$i;

    invoke-static {v0}, Lcom/google/android/material/tabs/TabLayout$g;->a(Lcom/google/android/material/tabs/TabLayout$g;)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setId(I)V

    :cond_1c
    return-object v0
.end method

.method public final f(Lcom/google/android/material/tabs/TabLayout$g;)V
    .registers 4

    .line 6
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->N:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_8
    if-ltz v0, :cond_18

    .line 7
    iget-object v1, p0, Lcom/google/android/material/tabs/TabLayout;->N:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/material/tabs/TabLayout$c;

    invoke-interface {v1, p1}, Lcom/google/android/material/tabs/TabLayout$c;->a(Lcom/google/android/material/tabs/TabLayout$g;)V

    add-int/lit8 v0, v0, -0x1

    goto :goto_8

    :cond_18
    return-void
.end method

.method public g()V
    .registers 6

    .line 2
    invoke-virtual {p0}, Lcom/google/android/material/tabs/TabLayout;->h()V

    .line 3
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->R:Lb/v/a/a;

    if-eqz v0, :cond_3f

    .line 4
    invoke-virtual {v0}, Lb/v/a/a;->a()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_d
    if-ge v2, v0, :cond_22

    .line 5
    invoke-virtual {p0}, Lcom/google/android/material/tabs/TabLayout;->f()Lcom/google/android/material/tabs/TabLayout$g;

    move-result-object v3

    iget-object v4, p0, Lcom/google/android/material/tabs/TabLayout;->R:Lb/v/a/a;

    invoke-virtual {v4, v2}, Lb/v/a/a;->a(I)Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/google/android/material/tabs/TabLayout$g;->b(Ljava/lang/CharSequence;)Lcom/google/android/material/tabs/TabLayout$g;

    invoke-virtual {p0, v3, v1}, Lcom/google/android/material/tabs/TabLayout;->a(Lcom/google/android/material/tabs/TabLayout$g;Z)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_d

    .line 6
    :cond_22
    iget-object v1, p0, Lcom/google/android/material/tabs/TabLayout;->Q:Landroidx/viewpager/widget/ViewPager;

    if-eqz v1, :cond_3f

    if-lez v0, :cond_3f

    .line 7
    invoke-virtual {v1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    move-result v0

    .line 8
    invoke-virtual {p0}, Lcom/google/android/material/tabs/TabLayout;->getSelectedTabPosition()I

    move-result v1

    if-eq v0, v1, :cond_3f

    invoke-virtual {p0}, Lcom/google/android/material/tabs/TabLayout;->getTabCount()I

    move-result v1

    if-ge v0, v1, :cond_3f

    .line 9
    invoke-virtual {p0, v0}, Lcom/google/android/material/tabs/TabLayout;->c(I)Lcom/google/android/material/tabs/TabLayout$g;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/android/material/tabs/TabLayout;->h(Lcom/google/android/material/tabs/TabLayout$g;)V

    :cond_3f
    return-void
.end method

.method public g(Lcom/google/android/material/tabs/TabLayout$g;)Z
    .registers 3

    .line 1
    sget-object v0, Lcom/google/android/material/tabs/TabLayout;->b0:Lb/h/l/e;

    invoke-interface {v0, p1}, Lb/h/l/e;->a(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public bridge synthetic generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;
    .registers 2

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/android/material/tabs/TabLayout;->generateLayoutParams(Landroid/util/AttributeSet;)Landroid/widget/FrameLayout$LayoutParams;

    move-result-object p1

    return-object p1
.end method

.method public generateLayoutParams(Landroid/util/AttributeSet;)Landroid/widget/FrameLayout$LayoutParams;
    .registers 2

    .line 2
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->generateDefaultLayoutParams()Landroid/widget/FrameLayout$LayoutParams;

    move-result-object p1

    return-object p1
.end method

.method public getSelectedTabPosition()I
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->i:Lcom/google/android/material/tabs/TabLayout$g;

    if-eqz v0, :cond_9

    invoke-virtual {v0}, Lcom/google/android/material/tabs/TabLayout$g;->c()I

    move-result v0

    goto :goto_a

    :cond_9
    const/4 v0, -0x1

    :goto_a
    return v0
.end method

.method public getTabCount()I
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->h:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getTabGravity()I
    .registers 2

    .line 1
    iget v0, p0, Lcom/google/android/material/tabs/TabLayout;->D:I

    return v0
.end method

.method public getTabIconTint()Landroid/content/res/ColorStateList;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->q:Landroid/content/res/ColorStateList;

    return-object v0
.end method

.method public getTabIndicatorAnimationMode()I
    .registers 2

    .line 1
    iget v0, p0, Lcom/google/android/material/tabs/TabLayout;->J:I

    return v0
.end method

.method public getTabIndicatorGravity()I
    .registers 2

    .line 1
    iget v0, p0, Lcom/google/android/material/tabs/TabLayout;->F:I

    return v0
.end method

.method public getTabMaxWidth()I
    .registers 2

    .line 1
    iget v0, p0, Lcom/google/android/material/tabs/TabLayout;->y:I

    return v0
.end method

.method public getTabMode()I
    .registers 2

    .line 1
    iget v0, p0, Lcom/google/android/material/tabs/TabLayout;->G:I

    return v0
.end method

.method public getTabRippleColor()Landroid/content/res/ColorStateList;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->r:Landroid/content/res/ColorStateList;

    return-object v0
.end method

.method public getTabSelectedIndicator()Landroid/graphics/drawable/Drawable;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->s:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public getTabTextColors()Landroid/content/res/ColorStateList;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->p:Landroid/content/res/ColorStateList;

    return-object v0
.end method

.method public h()V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->j:Lcom/google/android/material/tabs/TabLayout$f;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_8
    if-ltz v0, :cond_10

    .line 2
    invoke-virtual {p0, v0}, Lcom/google/android/material/tabs/TabLayout;->d(I)V

    add-int/lit8 v0, v0, -0x1

    goto :goto_8

    .line 3
    :cond_10
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->h:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_16
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2c

    .line 4
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/material/tabs/TabLayout$g;

    .line 5
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 6
    invoke-virtual {v1}, Lcom/google/android/material/tabs/TabLayout$g;->g()V

    .line 7
    invoke-virtual {p0, v1}, Lcom/google/android/material/tabs/TabLayout;->g(Lcom/google/android/material/tabs/TabLayout$g;)Z

    goto :goto_16

    :cond_2c
    const/4 v0, 0x0

    .line 8
    iput-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->i:Lcom/google/android/material/tabs/TabLayout$g;

    return-void
.end method

.method public h(Lcom/google/android/material/tabs/TabLayout$g;)V
    .registers 3

    const/4 v0, 0x1

    .line 9
    invoke-virtual {p0, p1, v0}, Lcom/google/android/material/tabs/TabLayout;->b(Lcom/google/android/material/tabs/TabLayout$g;Z)V

    return-void
.end method

.method public final i()V
    .registers 4

    .line 1
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->h:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_7
    if-ge v1, v0, :cond_17

    .line 2
    iget-object v2, p0, Lcom/google/android/material/tabs/TabLayout;->h:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/material/tabs/TabLayout$g;

    invoke-virtual {v2}, Lcom/google/android/material/tabs/TabLayout$g;->i()V

    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    :cond_17
    return-void
.end method

.method public onAttachedToWindow()V
    .registers 3

    .line 1
    invoke-super {p0}, Landroid/widget/HorizontalScrollView;->onAttachedToWindow()V

    .line 2
    invoke-static {p0}, Lc/a/a/a/l0/i;->a(Landroid/view/View;)V

    .line 3
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->Q:Landroidx/viewpager/widget/ViewPager;

    if-nez v0, :cond_18

    .line 4
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    .line 5
    instance-of v1, v0, Landroidx/viewpager/widget/ViewPager;

    if-eqz v1, :cond_18

    .line 6
    check-cast v0, Landroidx/viewpager/widget/ViewPager;

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1, v1}, Lcom/google/android/material/tabs/TabLayout;->a(Landroidx/viewpager/widget/ViewPager;ZZ)V

    :cond_18
    return-void
.end method

.method public onDetachedFromWindow()V
    .registers 2

    .line 1
    invoke-super {p0}, Landroid/widget/HorizontalScrollView;->onDetachedFromWindow()V

    .line 2
    iget-boolean v0, p0, Lcom/google/android/material/tabs/TabLayout;->V:Z

    if-eqz v0, :cond_e

    const/4 v0, 0x0

    .line 3
    invoke-virtual {p0, v0}, Lcom/google/android/material/tabs/TabLayout;->setupWithViewPager(Landroidx/viewpager/widget/ViewPager;)V

    const/4 v0, 0x0

    .line 4
    iput-boolean v0, p0, Lcom/google/android/material/tabs/TabLayout;->V:Z

    :cond_e
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .registers 5

    const/4 v0, 0x0

    .line 1
    :goto_1
    iget-object v1, p0, Lcom/google/android/material/tabs/TabLayout;->j:Lcom/google/android/material/tabs/TabLayout$f;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_1b

    .line 2
    iget-object v1, p0, Lcom/google/android/material/tabs/TabLayout;->j:Lcom/google/android/material/tabs/TabLayout$f;

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 3
    instance-of v2, v1, Lcom/google/android/material/tabs/TabLayout$i;

    if-eqz v2, :cond_18

    .line 4
    check-cast v1, Lcom/google/android/material/tabs/TabLayout$i;

    invoke-static {v1, p1}, Lcom/google/android/material/tabs/TabLayout$i;->a(Lcom/google/android/material/tabs/TabLayout$i;Landroid/graphics/Canvas;)V

    :cond_18
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 5
    :cond_1b
    invoke-super {p0, p1}, Landroid/widget/HorizontalScrollView;->onDraw(Landroid/graphics/Canvas;)V

    return-void
.end method

.method public onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .registers 5

    .line 1
    invoke-super {p0, p1}, Landroid/widget/HorizontalScrollView;->onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 2
    invoke-static {p1}, Lb/h/m/h0/c;->a(Landroid/view/accessibility/AccessibilityNodeInfo;)Lb/h/m/h0/c;

    move-result-object p1

    .line 3
    invoke-virtual {p0}, Lcom/google/android/material/tabs/TabLayout;->getTabCount()I

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 4
    invoke-static {v1, v0, v2, v1}, Lb/h/m/h0/c$b;->a(IIZI)Lb/h/m/h0/c$b;

    move-result-object v0

    .line 5
    invoke-virtual {p1, v0}, Lb/h/m/h0/c;->a(Ljava/lang/Object;)V

    return-void
.end method

.method public onMeasure(II)V
    .registers 9

    .line 1
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0}, Lcom/google/android/material/tabs/TabLayout;->getDefaultHeight()I

    move-result v1

    invoke-static {v0, v1}, Lc/a/a/a/d0/t;->a(Landroid/content/Context;I)F

    move-result v0

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    .line 2
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v1

    const/high16 v2, -0x80000000

    const/high16 v3, 0x40000000    # 2.0f

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-eq v1, v2, :cond_2e

    if-eqz v1, :cond_1f

    goto :goto_41

    .line 3
    :cond_1f
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getPaddingTop()I

    move-result p2

    add-int/2addr v0, p2

    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getPaddingBottom()I

    move-result p2

    add-int/2addr v0, p2

    .line 4
    invoke-static {v0, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p2

    goto :goto_41

    .line 5
    :cond_2e
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getChildCount()I

    move-result v1

    if-ne v1, v5, :cond_41

    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v1

    if-lt v1, v0, :cond_41

    .line 6
    invoke-virtual {p0, v4}, Landroid/widget/HorizontalScrollView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/View;->setMinimumHeight(I)V

    .line 7
    :cond_41
    :goto_41
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v0

    .line 8
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v1

    if-eqz v1, :cond_5f

    .line 9
    iget v1, p0, Lcom/google/android/material/tabs/TabLayout;->A:I

    if-lez v1, :cond_50

    goto :goto_5d

    :cond_50
    int-to-float v0, v0

    .line 10
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getContext()Landroid/content/Context;

    move-result-object v1

    const/16 v2, 0x38

    invoke-static {v1, v2}, Lc/a/a/a/d0/t;->a(Landroid/content/Context;I)F

    move-result v1

    sub-float/2addr v0, v1

    float-to-int v1, v0

    :goto_5d
    iput v1, p0, Lcom/google/android/material/tabs/TabLayout;->y:I

    .line 11
    :cond_5f
    invoke-super {p0, p1, p2}, Landroid/widget/HorizontalScrollView;->onMeasure(II)V

    .line 12
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getChildCount()I

    move-result p1

    if-ne p1, v5, :cond_ad

    .line 13
    invoke-virtual {p0, v4}, Landroid/widget/HorizontalScrollView;->getChildAt(I)Landroid/view/View;

    move-result-object p1

    .line 14
    iget v0, p0, Lcom/google/android/material/tabs/TabLayout;->G:I

    if-eqz v0, :cond_82

    if-eq v0, v5, :cond_76

    const/4 v1, 0x2

    if-eq v0, v1, :cond_82

    goto :goto_8d

    .line 15
    :cond_76
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v0

    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getMeasuredWidth()I

    move-result v1

    if-eq v0, v1, :cond_8d

    :goto_80
    const/4 v4, 0x1

    goto :goto_8d

    .line 16
    :cond_82
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v0

    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getMeasuredWidth()I

    move-result v1

    if-ge v0, v1, :cond_8d

    goto :goto_80

    :cond_8d
    :goto_8d
    if-eqz v4, :cond_ad

    .line 17
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getPaddingTop()I

    move-result v0

    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getPaddingBottom()I

    move-result v1

    add-int/2addr v0, v1

    .line 18
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    iget v1, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 19
    invoke-static {p2, v0, v1}, Landroid/widget/HorizontalScrollView;->getChildMeasureSpec(III)I

    move-result p2

    .line 20
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getMeasuredWidth()I

    move-result v0

    invoke-static {v0, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    .line 21
    invoke-virtual {p1, v0, p2}, Landroid/view/View;->measure(II)V

    :cond_ad
    return-void
.end method

.method public setElevation(F)V
    .registers 2

    .line 1
    invoke-super {p0, p1}, Landroid/widget/HorizontalScrollView;->setElevation(F)V

    .line 2
    invoke-static {p0, p1}, Lc/a/a/a/l0/i;->a(Landroid/view/View;F)V

    return-void
.end method

.method public setInlineLabel(Z)V
    .registers 4

    .line 1
    iget-boolean v0, p0, Lcom/google/android/material/tabs/TabLayout;->H:Z

    if-eq v0, p1, :cond_24

    .line 2
    iput-boolean p1, p0, Lcom/google/android/material/tabs/TabLayout;->H:Z

    const/4 p1, 0x0

    .line 3
    :goto_7
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->j:Lcom/google/android/material/tabs/TabLayout$f;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    if-ge p1, v0, :cond_21

    .line 4
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->j:Lcom/google/android/material/tabs/TabLayout$f;

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 5
    instance-of v1, v0, Lcom/google/android/material/tabs/TabLayout$i;

    if-eqz v1, :cond_1e

    .line 6
    check-cast v0, Lcom/google/android/material/tabs/TabLayout$i;

    invoke-virtual {v0}, Lcom/google/android/material/tabs/TabLayout$i;->i()V

    :cond_1e
    add-int/lit8 p1, p1, 0x1

    goto :goto_7

    .line 7
    :cond_21
    invoke-virtual {p0}, Lcom/google/android/material/tabs/TabLayout;->a()V

    :cond_24
    return-void
.end method

.method public setInlineLabelResource(I)V
    .registers 3

    .line 1
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result p1

    invoke-virtual {p0, p1}, Lcom/google/android/material/tabs/TabLayout;->setInlineLabel(Z)V

    return-void
.end method

.method public setOnTabSelectedListener(Lcom/google/android/material/tabs/TabLayout$c;)V
    .registers 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 2
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->M:Lcom/google/android/material/tabs/TabLayout$c;

    if-eqz v0, :cond_7

    .line 3
    invoke-virtual {p0, v0}, Lcom/google/android/material/tabs/TabLayout;->b(Lcom/google/android/material/tabs/TabLayout$c;)V

    .line 4
    :cond_7
    iput-object p1, p0, Lcom/google/android/material/tabs/TabLayout;->M:Lcom/google/android/material/tabs/TabLayout$c;

    if-eqz p1, :cond_e

    .line 5
    invoke-virtual {p0, p1}, Lcom/google/android/material/tabs/TabLayout;->a(Lcom/google/android/material/tabs/TabLayout$c;)V

    :cond_e
    return-void
.end method

.method public setOnTabSelectedListener(Lcom/google/android/material/tabs/TabLayout$d;)V
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/android/material/tabs/TabLayout;->setOnTabSelectedListener(Lcom/google/android/material/tabs/TabLayout$c;)V

    return-void
.end method

.method public setScrollAnimatorListener(Landroid/animation/Animator$AnimatorListener;)V
    .registers 3

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/tabs/TabLayout;->d()V

    .line 2
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->P:Landroid/animation/ValueAnimator;

    invoke-virtual {v0, p1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    return-void
.end method

.method public setSelectedTabIndicator(I)V
    .registers 3

    if-eqz p1, :cond_e

    .line 3
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lb/b/l/a/a;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    .line 4
    invoke-virtual {p0, p1}, Lcom/google/android/material/tabs/TabLayout;->setSelectedTabIndicator(Landroid/graphics/drawable/Drawable;)V

    goto :goto_12

    :cond_e
    const/4 p1, 0x0

    .line 5
    invoke-virtual {p0, p1}, Lcom/google/android/material/tabs/TabLayout;->setSelectedTabIndicator(Landroid/graphics/drawable/Drawable;)V

    :goto_12
    return-void
.end method

.method public setSelectedTabIndicator(Landroid/graphics/drawable/Drawable;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->s:Landroid/graphics/drawable/Drawable;

    if-eq v0, p1, :cond_e

    if-eqz p1, :cond_7

    goto :goto_c

    .line 2
    :cond_7
    new-instance p1, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {p1}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    :goto_c
    iput-object p1, p0, Lcom/google/android/material/tabs/TabLayout;->s:Landroid/graphics/drawable/Drawable;

    :cond_e
    return-void
.end method

.method public setSelectedTabIndicatorColor(I)V
    .registers 2

    .line 1
    iput p1, p0, Lcom/google/android/material/tabs/TabLayout;->t:I

    return-void
.end method

.method public setSelectedTabIndicatorGravity(I)V
    .registers 3

    .line 1
    iget v0, p0, Lcom/google/android/material/tabs/TabLayout;->F:I

    if-eq v0, p1, :cond_b

    .line 2
    iput p1, p0, Lcom/google/android/material/tabs/TabLayout;->F:I

    .line 3
    iget-object p1, p0, Lcom/google/android/material/tabs/TabLayout;->j:Lcom/google/android/material/tabs/TabLayout$f;

    invoke-static {p1}, Lb/h/m/y;->O(Landroid/view/View;)V

    :cond_b
    return-void
.end method

.method public setSelectedTabIndicatorHeight(I)V
    .registers 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->j:Lcom/google/android/material/tabs/TabLayout$f;

    invoke-virtual {v0, p1}, Lcom/google/android/material/tabs/TabLayout$f;->a(I)V

    return-void
.end method

.method public setTabGravity(I)V
    .registers 3

    .line 1
    iget v0, p0, Lcom/google/android/material/tabs/TabLayout;->D:I

    if-eq v0, p1, :cond_9

    .line 2
    iput p1, p0, Lcom/google/android/material/tabs/TabLayout;->D:I

    .line 3
    invoke-virtual {p0}, Lcom/google/android/material/tabs/TabLayout;->a()V

    :cond_9
    return-void
.end method

.method public setTabIconTint(Landroid/content/res/ColorStateList;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->q:Landroid/content/res/ColorStateList;

    if-eq v0, p1, :cond_9

    .line 2
    iput-object p1, p0, Lcom/google/android/material/tabs/TabLayout;->q:Landroid/content/res/ColorStateList;

    .line 3
    invoke-virtual {p0}, Lcom/google/android/material/tabs/TabLayout;->i()V

    :cond_9
    return-void
.end method

.method public setTabIconTintResource(I)V
    .registers 3

    .line 1
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lb/b/l/a/a;->b(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/android/material/tabs/TabLayout;->setTabIconTint(Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public setTabIndicatorAnimationMode(I)V
    .registers 4

    .line 1
    iput p1, p0, Lcom/google/android/material/tabs/TabLayout;->J:I

    if-eqz p1, :cond_26

    const/4 v0, 0x1

    if-ne p1, v0, :cond_f

    .line 2
    new-instance p1, Lc/a/a/a/o0/a;

    invoke-direct {p1}, Lc/a/a/a/o0/a;-><init>()V

    iput-object p1, p0, Lcom/google/android/material/tabs/TabLayout;->L:Lc/a/a/a/o0/b;

    goto :goto_2d

    .line 3
    :cond_f
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " is not a valid TabIndicatorAnimationMode"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 4
    :cond_26
    new-instance p1, Lc/a/a/a/o0/b;

    invoke-direct {p1}, Lc/a/a/a/o0/b;-><init>()V

    iput-object p1, p0, Lcom/google/android/material/tabs/TabLayout;->L:Lc/a/a/a/o0/b;

    :goto_2d
    return-void
.end method

.method public setTabIndicatorFullWidth(Z)V
    .registers 2

    .line 1
    iput-boolean p1, p0, Lcom/google/android/material/tabs/TabLayout;->I:Z

    .line 2
    iget-object p1, p0, Lcom/google/android/material/tabs/TabLayout;->j:Lcom/google/android/material/tabs/TabLayout$f;

    invoke-static {p1}, Lb/h/m/y;->O(Landroid/view/View;)V

    return-void
.end method

.method public setTabMode(I)V
    .registers 3

    .line 1
    iget v0, p0, Lcom/google/android/material/tabs/TabLayout;->G:I

    if-eq p1, v0, :cond_9

    .line 2
    iput p1, p0, Lcom/google/android/material/tabs/TabLayout;->G:I

    .line 3
    invoke-virtual {p0}, Lcom/google/android/material/tabs/TabLayout;->a()V

    :cond_9
    return-void
.end method

.method public setTabRippleColor(Landroid/content/res/ColorStateList;)V
    .registers 4

    .line 1
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->r:Landroid/content/res/ColorStateList;

    if-eq v0, p1, :cond_25

    .line 2
    iput-object p1, p0, Lcom/google/android/material/tabs/TabLayout;->r:Landroid/content/res/ColorStateList;

    const/4 p1, 0x0

    .line 3
    :goto_7
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->j:Lcom/google/android/material/tabs/TabLayout$f;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    if-ge p1, v0, :cond_25

    .line 4
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->j:Lcom/google/android/material/tabs/TabLayout$f;

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 5
    instance-of v1, v0, Lcom/google/android/material/tabs/TabLayout$i;

    if-eqz v1, :cond_22

    .line 6
    check-cast v0, Lcom/google/android/material/tabs/TabLayout$i;

    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/google/android/material/tabs/TabLayout$i;->a(Lcom/google/android/material/tabs/TabLayout$i;Landroid/content/Context;)V

    :cond_22
    add-int/lit8 p1, p1, 0x1

    goto :goto_7

    :cond_25
    return-void
.end method

.method public setTabRippleColorResource(I)V
    .registers 3

    .line 1
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lb/b/l/a/a;->b(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/android/material/tabs/TabLayout;->setTabRippleColor(Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public setTabTextColors(Landroid/content/res/ColorStateList;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->p:Landroid/content/res/ColorStateList;

    if-eq v0, p1, :cond_9

    .line 2
    iput-object p1, p0, Lcom/google/android/material/tabs/TabLayout;->p:Landroid/content/res/ColorStateList;

    .line 3
    invoke-virtual {p0}, Lcom/google/android/material/tabs/TabLayout;->i()V

    :cond_9
    return-void
.end method

.method public setTabsFromPagerAdapter(Lb/v/a/a;)V
    .registers 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 v0, 0x0

    .line 1
    invoke-virtual {p0, p1, v0}, Lcom/google/android/material/tabs/TabLayout;->a(Lb/v/a/a;Z)V

    return-void
.end method

.method public setUnboundedRipple(Z)V
    .registers 4

    .line 1
    iget-boolean v0, p0, Lcom/google/android/material/tabs/TabLayout;->K:Z

    if-eq v0, p1, :cond_25

    .line 2
    iput-boolean p1, p0, Lcom/google/android/material/tabs/TabLayout;->K:Z

    const/4 p1, 0x0

    .line 3
    :goto_7
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->j:Lcom/google/android/material/tabs/TabLayout$f;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    if-ge p1, v0, :cond_25

    .line 4
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->j:Lcom/google/android/material/tabs/TabLayout$f;

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 5
    instance-of v1, v0, Lcom/google/android/material/tabs/TabLayout$i;

    if-eqz v1, :cond_22

    .line 6
    check-cast v0, Lcom/google/android/material/tabs/TabLayout$i;

    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/google/android/material/tabs/TabLayout$i;->a(Lcom/google/android/material/tabs/TabLayout$i;Landroid/content/Context;)V

    :cond_22
    add-int/lit8 p1, p1, 0x1

    goto :goto_7

    :cond_25
    return-void
.end method

.method public setUnboundedRippleResource(I)V
    .registers 3

    .line 1
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result p1

    invoke-virtual {p0, p1}, Lcom/google/android/material/tabs/TabLayout;->setUnboundedRipple(Z)V

    return-void
.end method

.method public setupWithViewPager(Landroidx/viewpager/widget/ViewPager;)V
    .registers 3

    const/4 v0, 0x1

    .line 1
    invoke-virtual {p0, p1, v0}, Lcom/google/android/material/tabs/TabLayout;->a(Landroidx/viewpager/widget/ViewPager;Z)V

    return-void
.end method

.method public shouldDelayChildPressedState()Z
    .registers 2

    .line 1
    invoke-direct {p0}, Lcom/google/android/material/tabs/TabLayout;->getTabScrollRange()I

    move-result v0

    if-lez v0, :cond_8

    const/4 v0, 0x1

    goto :goto_9

    :cond_8
    const/4 v0, 0x0

    :goto_9
    return v0
.end method
