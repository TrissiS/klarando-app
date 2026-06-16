.class public Lcom/google/android/material/floatingactionbutton/FloatingActionButton;
.super Lcom/google/android/material/internal/VisibilityAwareImageButton;
.source "FloatingActionButton.java"

# interfaces
.implements Lb/h/m/x;
.implements Lb/h/n/m;
.implements Lc/a/a/a/b0/a;
.implements Lc/a/a/a/l0/p;
.implements Landroidx/coordinatorlayout/widget/CoordinatorLayout$b;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/material/floatingactionbutton/FloatingActionButton$c;,
        Lcom/google/android/material/floatingactionbutton/FloatingActionButton$d;,
        Lcom/google/android/material/floatingactionbutton/FloatingActionButton$BaseBehavior;,
        Lcom/google/android/material/floatingactionbutton/FloatingActionButton$Behavior;,
        Lcom/google/android/material/floatingactionbutton/FloatingActionButton$b;
    }
.end annotation


# static fields
.field public static final y:I


# instance fields
.field public i:Landroid/content/res/ColorStateList;

.field public j:Landroid/graphics/PorterDuff$Mode;

.field public k:Landroid/content/res/ColorStateList;

.field public l:Landroid/graphics/PorterDuff$Mode;

.field public m:Landroid/content/res/ColorStateList;

.field public n:I

.field public o:I

.field public p:I

.field public q:I

.field public r:I

.field public s:Z

.field public final t:Landroid/graphics/Rect;

.field public final u:Landroid/graphics/Rect;

.field public final v:Lb/b/q/h;

.field public final w:Lc/a/a/a/b0/c;

.field public x:Lc/a/a/a/c0/d;


# direct methods
.method public static constructor <clinit>()V
    .registers 1

    .line 1
    sget v0, Lc/a/a/a/k;->Widget_Design_FloatingActionButton:I

    sput v0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->y:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    .line 2
    sget v0, Lc/a/a/a/b;->floatingActionButtonStyle:I

    invoke-direct {p0, p1, p2, v0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 14

    .line 3
    sget v0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->y:I

    invoke-static {p1, p2, p3, v0}, Lc/a/a/a/q0/a/a;->b(Landroid/content/Context;Landroid/util/AttributeSet;II)Landroid/content/Context;

    move-result-object p1

    invoke-direct {p0, p1, p2, p3}, Lcom/google/android/material/internal/VisibilityAwareImageButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 4
    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->t:Landroid/graphics/Rect;

    .line 5
    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->u:Landroid/graphics/Rect;

    .line 6
    invoke-virtual {p0}, Landroid/widget/ImageButton;->getContext()Landroid/content/Context;

    move-result-object p1

    .line 7
    sget-object v2, Lc/a/a/a/l;->FloatingActionButton:[I

    sget v4, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->y:I

    const/4 v6, 0x0

    new-array v5, v6, [I

    move-object v0, p1

    move-object v1, p2

    move v3, p3

    .line 8
    invoke-static/range {v0 .. v5}, Lc/a/a/a/d0/m;->c(Landroid/content/Context;Landroid/util/AttributeSet;[III[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 9
    sget v1, Lc/a/a/a/l;->FloatingActionButton_backgroundTint:I

    .line 10
    invoke-static {p1, v0, v1}, Lc/a/a/a/i0/c;->a(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/content/res/ColorStateList;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->i:Landroid/content/res/ColorStateList;

    .line 11
    sget v1, Lc/a/a/a/l;->FloatingActionButton_backgroundTintMode:I

    const/4 v2, -0x1

    .line 12
    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v1

    const/4 v3, 0x0

    .line 13
    invoke-static {v1, v3}, Lc/a/a/a/d0/t;->a(ILandroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuff$Mode;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->j:Landroid/graphics/PorterDuff$Mode;

    .line 14
    sget v1, Lc/a/a/a/l;->FloatingActionButton_rippleColor:I

    .line 15
    invoke-static {p1, v0, v1}, Lc/a/a/a/i0/c;->a(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/content/res/ColorStateList;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->m:Landroid/content/res/ColorStateList;

    .line 16
    sget v1, Lc/a/a/a/l;->FloatingActionButton_fabSize:I

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v1

    iput v1, p0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->o:I

    .line 17
    sget v1, Lc/a/a/a/l;->FloatingActionButton_fabCustomSize:I

    .line 18
    invoke-virtual {v0, v1, v6}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->p:I

    .line 19
    sget v1, Lc/a/a/a/l;->FloatingActionButton_borderWidth:I

    invoke-virtual {v0, v1, v6}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->n:I

    .line 20
    sget v1, Lc/a/a/a/l;->FloatingActionButton_elevation:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v1

    .line 21
    sget v3, Lc/a/a/a/l;->FloatingActionButton_hoveredFocusedTranslationZ:I

    .line 22
    invoke-virtual {v0, v3, v2}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v3

    .line 23
    sget v4, Lc/a/a/a/l;->FloatingActionButton_pressedTranslationZ:I

    .line 24
    invoke-virtual {v0, v4, v2}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v2

    .line 25
    sget v4, Lc/a/a/a/l;->FloatingActionButton_useCompatPadding:I

    invoke-virtual {v0, v4, v6}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v4

    iput-boolean v4, p0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->s:Z

    .line 26
    invoke-virtual {p0}, Landroid/widget/ImageButton;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    sget v5, Lc/a/a/a/d;->mtrl_fab_min_touch_target:I

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    .line 27
    sget v5, Lc/a/a/a/l;->FloatingActionButton_maxImageSize:I

    invoke-virtual {v0, v5, v6}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v5

    iput v5, p0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->r:I

    .line 28
    sget v5, Lc/a/a/a/l;->FloatingActionButton_showMotionSpec:I

    .line 29
    invoke-static {p1, v0, v5}, Lc/a/a/a/m/h;->a(Landroid/content/Context;Landroid/content/res/TypedArray;I)Lc/a/a/a/m/h;

    move-result-object v5

    .line 30
    sget v7, Lc/a/a/a/l;->FloatingActionButton_hideMotionSpec:I

    .line 31
    invoke-static {p1, v0, v7}, Lc/a/a/a/m/h;->a(Landroid/content/Context;Landroid/content/res/TypedArray;I)Lc/a/a/a/m/h;

    move-result-object v7

    .line 32
    sget v8, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->y:I

    sget-object v9, Lc/a/a/a/l0/m;->m:Lc/a/a/a/l0/c;

    .line 33
    invoke-static {p1, p2, p3, v8, v9}, Lc/a/a/a/l0/m;->a(Landroid/content/Context;Landroid/util/AttributeSet;IILc/a/a/a/l0/c;)Lc/a/a/a/l0/m$b;

    move-result-object p1

    .line 34
    invoke-virtual {p1}, Lc/a/a/a/l0/m$b;->a()Lc/a/a/a/l0/m;

    move-result-object p1

    .line 35
    sget v8, Lc/a/a/a/l;->FloatingActionButton_ensureMinTouchTargetSize:I

    .line 36
    invoke-virtual {v0, v8, v6}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v6

    .line 37
    sget v8, Lc/a/a/a/l;->FloatingActionButton_android_enabled:I

    const/4 v9, 0x1

    invoke-virtual {v0, v8, v9}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v8

    invoke-virtual {p0, v8}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 38
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 39
    new-instance v0, Lb/b/q/h;

    invoke-direct {v0, p0}, Lb/b/q/h;-><init>(Landroid/widget/ImageView;)V

    iput-object v0, p0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->v:Lb/b/q/h;

    .line 40
    invoke-virtual {v0, p2, p3}, Lb/b/q/h;->a(Landroid/util/AttributeSet;I)V

    .line 41
    new-instance p2, Lc/a/a/a/b0/c;

    invoke-direct {p2, p0}, Lc/a/a/a/b0/c;-><init>(Lc/a/a/a/b0/b;)V

    iput-object p2, p0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->w:Lc/a/a/a/b0/c;

    .line 42
    invoke-direct {p0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->getImpl()Lc/a/a/a/c0/d;

    move-result-object p2

    invoke-virtual {p2, p1}, Lc/a/a/a/c0/d;->a(Lc/a/a/a/l0/m;)V

    .line 43
    invoke-direct {p0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->getImpl()Lc/a/a/a/c0/d;

    move-result-object p1

    iget-object p2, p0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->i:Landroid/content/res/ColorStateList;

    iget-object p3, p0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->j:Landroid/graphics/PorterDuff$Mode;

    iget-object v0, p0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->m:Landroid/content/res/ColorStateList;

    iget v8, p0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->n:I

    .line 44
    invoke-virtual {p1, p2, p3, v0, v8}, Lc/a/a/a/c0/d;->a(Landroid/content/res/ColorStateList;Landroid/graphics/PorterDuff$Mode;Landroid/content/res/ColorStateList;I)V

    .line 45
    invoke-direct {p0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->getImpl()Lc/a/a/a/c0/d;

    move-result-object p1

    invoke-virtual {p1, v4}, Lc/a/a/a/c0/d;->b(I)V

    .line 46
    invoke-direct {p0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->getImpl()Lc/a/a/a/c0/d;

    move-result-object p1

    invoke-virtual {p1, v1}, Lc/a/a/a/c0/d;->a(F)V

    .line 47
    invoke-direct {p0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->getImpl()Lc/a/a/a/c0/d;

    move-result-object p1

    invoke-virtual {p1, v3}, Lc/a/a/a/c0/d;->b(F)V

    .line 48
    invoke-direct {p0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->getImpl()Lc/a/a/a/c0/d;

    move-result-object p1

    invoke-virtual {p1, v2}, Lc/a/a/a/c0/d;->d(F)V

    .line 49
    invoke-direct {p0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->getImpl()Lc/a/a/a/c0/d;

    move-result-object p1

    iget p2, p0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->r:I

    invoke-virtual {p1, p2}, Lc/a/a/a/c0/d;->a(I)V

    .line 50
    invoke-direct {p0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->getImpl()Lc/a/a/a/c0/d;

    move-result-object p1

    invoke-virtual {p1, v5}, Lc/a/a/a/c0/d;->b(Lc/a/a/a/m/h;)V

    .line 51
    invoke-direct {p0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->getImpl()Lc/a/a/a/c0/d;

    move-result-object p1

    invoke-virtual {p1, v7}, Lc/a/a/a/c0/d;->a(Lc/a/a/a/m/h;)V

    .line 52
    invoke-direct {p0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->getImpl()Lc/a/a/a/c0/d;

    move-result-object p1

    invoke-virtual {p1, v6}, Lc/a/a/a/c0/d;->a(Z)V

    .line 53
    sget-object p1, Landroid/widget/ImageView$ScaleType;->MATRIX:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {p0, p1}, Landroid/widget/ImageButton;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    return-void
.end method

.method public static a(II)I
    .registers 4

    .line 19
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v0

    .line 20
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p1

    const/high16 v1, -0x80000000

    if-eq v0, v1, :cond_1a

    if-eqz v0, :cond_1e

    const/high16 p0, 0x40000000    # 2.0f

    if-ne v0, p0, :cond_14

    move p0, p1

    goto :goto_1e

    .line 21
    :cond_14
    new-instance p0, Ljava/lang/IllegalArgumentException;

    invoke-direct {p0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw p0

    .line 22
    :cond_1a
    invoke-static {p0, p1}, Ljava/lang/Math;->min(II)I

    move-result p0

    :cond_1e
    :goto_1e
    return p0
.end method

.method public static synthetic a(Lcom/google/android/material/floatingactionbutton/FloatingActionButton;)I
    .registers 1

    .line 1
    iget p0, p0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->q:I

    return p0
.end method

.method public static synthetic a(Lcom/google/android/material/floatingactionbutton/FloatingActionButton;Landroid/graphics/drawable/Drawable;)V
    .registers 2

    .line 2
    invoke-super {p0, p1}, Landroid/widget/ImageButton;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method private getImpl()Lc/a/a/a/c0/d;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->x:Lc/a/a/a/c0/d;

    if-nez v0, :cond_a

    .line 2
    invoke-virtual {p0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->b()Lc/a/a/a/c0/d;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->x:Lc/a/a/a/c0/d;

    .line 3
    :cond_a
    iget-object v0, p0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->x:Lc/a/a/a/c0/d;

    return-object v0
.end method


# virtual methods
.method public final a(I)I
    .registers 5

    .line 7
    iget v0, p0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->p:I

    if-eqz v0, :cond_5

    return v0

    .line 8
    :cond_5
    invoke-virtual {p0}, Landroid/widget/ImageButton;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const/4 v1, -0x1

    const/4 v2, 0x1

    if-eq p1, v1, :cond_1d

    if-eq p1, v2, :cond_16

    .line 9
    sget p1, Lc/a/a/a/d;->design_fab_size_normal:I

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    return p1

    .line 10
    :cond_16
    sget p1, Lc/a/a/a/d;->design_fab_size_mini:I

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    return p1

    .line 11
    :cond_1d
    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p1

    iget p1, p1, Landroid/content/res/Configuration;->screenWidthDp:I

    .line 12
    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->screenHeightDp:I

    .line 13
    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    move-result p1

    const/16 v0, 0x1d6

    if-ge p1, v0, :cond_36

    .line 14
    invoke-virtual {p0, v2}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->a(I)I

    move-result p1

    goto :goto_3b

    :cond_36
    const/4 p1, 0x0

    .line 15
    invoke-virtual {p0, p1}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->a(I)I

    move-result p1

    :goto_3b
    return p1
.end method

.method public a(Landroid/animation/Animator$AnimatorListener;)V
    .registers 3

    .line 5
    invoke-direct {p0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->getImpl()Lc/a/a/a/c0/d;

    move-result-object v0

    invoke-virtual {v0, p1}, Lc/a/a/a/c0/d;->a(Landroid/animation/Animator$AnimatorListener;)V

    return-void
.end method

.method public a(Lc/a/a/a/m/k;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lc/a/a/a/m/k<",
            "+",
            "Lcom/google/android/material/floatingactionbutton/FloatingActionButton;",
            ">;)V"
        }
    .end annotation

    .line 23
    invoke-direct {p0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->getImpl()Lc/a/a/a/c0/d;

    move-result-object v0

    new-instance v1, Lcom/google/android/material/floatingactionbutton/FloatingActionButton$d;

    invoke-direct {v1, p0, p1}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton$d;-><init>(Lcom/google/android/material/floatingactionbutton/FloatingActionButton;Lc/a/a/a/m/k;)V

    invoke-virtual {v0, v1}, Lc/a/a/a/c0/d;->a(Lc/a/a/a/c0/d$i;)V

    return-void
.end method

.method public a(Lcom/google/android/material/floatingactionbutton/FloatingActionButton$b;)V
    .registers 3

    const/4 v0, 0x1

    .line 3
    invoke-virtual {p0, p1, v0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->a(Lcom/google/android/material/floatingactionbutton/FloatingActionButton$b;Z)V

    return-void
.end method

.method public a(Lcom/google/android/material/floatingactionbutton/FloatingActionButton$b;Z)V
    .registers 4

    .line 4
    invoke-direct {p0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->getImpl()Lc/a/a/a/c0/d;

    move-result-object v0

    invoke-virtual {p0, p1}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->c(Lcom/google/android/material/floatingactionbutton/FloatingActionButton$b;)Lc/a/a/a/c0/d$j;

    move-result-object p1

    invoke-virtual {v0, p1, p2}, Lc/a/a/a/c0/d;->a(Lc/a/a/a/c0/d$j;Z)V

    return-void
.end method

.method public a()Z
    .registers 2

    .line 6
    iget-object v0, p0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->w:Lc/a/a/a/b0/c;

    invoke-virtual {v0}, Lc/a/a/a/b0/c;->c()Z

    move-result v0

    return v0
.end method

.method public a(Landroid/graphics/Rect;)Z
    .registers 5
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 16
    invoke-static {p0}, Lb/h/m/y;->K(Landroid/view/View;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_17

    .line 17
    invoke-virtual {p0}, Landroid/widget/ImageButton;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Landroid/widget/ImageButton;->getHeight()I

    move-result v2

    invoke-virtual {p1, v1, v1, v0, v2}, Landroid/graphics/Rect;->set(IIII)V

    .line 18
    invoke-virtual {p0, p1}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->c(Landroid/graphics/Rect;)V

    const/4 p1, 0x1

    return p1

    :cond_17
    return v1
.end method

.method public final b()Lc/a/a/a/c0/d;
    .registers 3

    .line 6
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_11

    .line 7
    new-instance v0, Lc/a/a/a/c0/e;

    new-instance v1, Lcom/google/android/material/floatingactionbutton/FloatingActionButton$c;

    invoke-direct {v1, p0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton$c;-><init>(Lcom/google/android/material/floatingactionbutton/FloatingActionButton;)V

    invoke-direct {v0, p0, v1}, Lc/a/a/a/c0/e;-><init>(Lcom/google/android/material/floatingactionbutton/FloatingActionButton;Lc/a/a/a/k0/b;)V

    return-object v0

    .line 8
    :cond_11
    new-instance v0, Lc/a/a/a/c0/d;

    new-instance v1, Lcom/google/android/material/floatingactionbutton/FloatingActionButton$c;

    invoke-direct {v1, p0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton$c;-><init>(Lcom/google/android/material/floatingactionbutton/FloatingActionButton;)V

    invoke-direct {v0, p0, v1}, Lc/a/a/a/c0/d;-><init>(Lcom/google/android/material/floatingactionbutton/FloatingActionButton;Lc/a/a/a/k0/b;)V

    return-object v0
.end method

.method public b(Landroid/animation/Animator$AnimatorListener;)V
    .registers 3

    .line 3
    invoke-direct {p0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->getImpl()Lc/a/a/a/c0/d;

    move-result-object v0

    invoke-virtual {v0, p1}, Lc/a/a/a/c0/d;->b(Landroid/animation/Animator$AnimatorListener;)V

    return-void
.end method

.method public b(Landroid/graphics/Rect;)V
    .registers 5

    .line 4
    invoke-virtual {p0}, Landroid/widget/ImageButton;->getMeasuredWidth()I

    move-result v0

    invoke-virtual {p0}, Landroid/widget/ImageButton;->getMeasuredHeight()I

    move-result v1

    const/4 v2, 0x0

    invoke-virtual {p1, v2, v2, v0, v1}, Landroid/graphics/Rect;->set(IIII)V

    .line 5
    invoke-virtual {p0, p1}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->c(Landroid/graphics/Rect;)V

    return-void
.end method

.method public b(Lcom/google/android/material/floatingactionbutton/FloatingActionButton$b;)V
    .registers 3

    const/4 v0, 0x1

    .line 1
    invoke-virtual {p0, p1, v0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->b(Lcom/google/android/material/floatingactionbutton/FloatingActionButton$b;Z)V

    return-void
.end method

.method public b(Lcom/google/android/material/floatingactionbutton/FloatingActionButton$b;Z)V
    .registers 4

    .line 2
    invoke-direct {p0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->getImpl()Lc/a/a/a/c0/d;

    move-result-object v0

    invoke-virtual {p0, p1}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->c(Lcom/google/android/material/floatingactionbutton/FloatingActionButton$b;)Lc/a/a/a/c0/d$j;

    move-result-object p1

    invoke-virtual {v0, p1, p2}, Lc/a/a/a/c0/d;->b(Lc/a/a/a/c0/d$j;Z)V

    return-void
.end method

.method public final c(Lcom/google/android/material/floatingactionbutton/FloatingActionButton$b;)Lc/a/a/a/c0/d$j;
    .registers 3

    if-nez p1, :cond_4

    const/4 p1, 0x0

    return-object p1

    .line 1
    :cond_4
    new-instance v0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton$a;

    invoke-direct {v0, p0, p1}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton$a;-><init>(Lcom/google/android/material/floatingactionbutton/FloatingActionButton;Lcom/google/android/material/floatingactionbutton/FloatingActionButton$b;)V

    return-object v0
.end method

.method public final c(Landroid/graphics/Rect;)V
    .registers 5

    .line 3
    iget v0, p1, Landroid/graphics/Rect;->left:I

    iget-object v1, p0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->t:Landroid/graphics/Rect;

    iget v2, v1, Landroid/graphics/Rect;->left:I

    add-int/2addr v0, v2

    iput v0, p1, Landroid/graphics/Rect;->left:I

    .line 4
    iget v0, p1, Landroid/graphics/Rect;->top:I

    iget v2, v1, Landroid/graphics/Rect;->top:I

    add-int/2addr v0, v2

    iput v0, p1, Landroid/graphics/Rect;->top:I

    .line 5
    iget v0, p1, Landroid/graphics/Rect;->right:I

    iget v2, v1, Landroid/graphics/Rect;->right:I

    sub-int/2addr v0, v2

    iput v0, p1, Landroid/graphics/Rect;->right:I

    .line 6
    iget v0, p1, Landroid/graphics/Rect;->bottom:I

    iget v1, v1, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v0, v1

    iput v0, p1, Landroid/graphics/Rect;->bottom:I

    return-void
.end method

.method public c()Z
    .registers 2

    .line 2
    invoke-direct {p0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->getImpl()Lc/a/a/a/c0/d;

    move-result-object v0

    invoke-virtual {v0}, Lc/a/a/a/c0/d;->m()Z

    move-result v0

    return v0
.end method

.method public d()Z
    .registers 2

    .line 1
    invoke-direct {p0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->getImpl()Lc/a/a/a/c0/d;

    move-result-object v0

    invoke-virtual {v0}, Lc/a/a/a/c0/d;->n()Z

    move-result v0

    return v0
.end method

.method public drawableStateChanged()V
    .registers 3

    .line 1
    invoke-super {p0}, Landroid/widget/ImageButton;->drawableStateChanged()V

    .line 2
    invoke-direct {p0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->getImpl()Lc/a/a/a/c0/d;

    move-result-object v0

    invoke-virtual {p0}, Landroid/widget/ImageButton;->getDrawableState()[I

    move-result-object v1

    invoke-virtual {v0, v1}, Lc/a/a/a/c0/d;->a([I)V

    return-void
.end method

.method public final e()V
    .registers 5

    .line 1
    invoke-virtual {p0}, Landroid/widget/ImageButton;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-nez v0, :cond_7

    return-void

    .line 2
    :cond_7
    iget-object v1, p0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->k:Landroid/content/res/ColorStateList;

    if-nez v1, :cond_f

    .line 3
    invoke-static {v0}, Lb/h/f/l/a;->b(Landroid/graphics/drawable/Drawable;)V

    return-void

    .line 4
    :cond_f
    invoke-virtual {p0}, Landroid/widget/ImageButton;->getDrawableState()[I

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v1

    .line 5
    iget-object v2, p0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->l:Landroid/graphics/PorterDuff$Mode;

    if-nez v2, :cond_1e

    .line 6
    sget-object v2, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    .line 7
    :cond_1e
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 8
    invoke-static {v1, v2}, Lb/b/q/f;->a(ILandroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuffColorFilter;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    return-void
.end method

.method public getBackgroundTintList()Landroid/content/res/ColorStateList;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->i:Landroid/content/res/ColorStateList;

    return-object v0
.end method

.method public getBackgroundTintMode()Landroid/graphics/PorterDuff$Mode;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->j:Landroid/graphics/PorterDuff$Mode;

    return-object v0
.end method

.method public getBehavior()Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior<",
            "Lcom/google/android/material/floatingactionbutton/FloatingActionButton;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton$Behavior;

    invoke-direct {v0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton$Behavior;-><init>()V

    return-object v0
.end method

.method public getCompatElevation()F
    .registers 2

    .line 1
    invoke-direct {p0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->getImpl()Lc/a/a/a/c0/d;

    move-result-object v0

    invoke-virtual {v0}, Lc/a/a/a/c0/d;->e()F

    move-result v0

    return v0
.end method

.method public getCompatHoveredFocusedTranslationZ()F
    .registers 2

    .line 1
    invoke-direct {p0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->getImpl()Lc/a/a/a/c0/d;

    move-result-object v0

    invoke-virtual {v0}, Lc/a/a/a/c0/d;->h()F

    move-result v0

    return v0
.end method

.method public getCompatPressedTranslationZ()F
    .registers 2

    .line 1
    invoke-direct {p0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->getImpl()Lc/a/a/a/c0/d;

    move-result-object v0

    invoke-virtual {v0}, Lc/a/a/a/c0/d;->j()F

    move-result v0

    return v0
.end method

.method public getContentBackground()Landroid/graphics/drawable/Drawable;
    .registers 2

    .line 1
    invoke-direct {p0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->getImpl()Lc/a/a/a/c0/d;

    move-result-object v0

    invoke-virtual {v0}, Lc/a/a/a/c0/d;->b()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method public getCustomSize()I
    .registers 2

    .line 1
    iget v0, p0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->p:I

    return v0
.end method

.method public getExpandedComponentIdHint()I
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->w:Lc/a/a/a/b0/c;

    invoke-virtual {v0}, Lc/a/a/a/b0/c;->b()I

    move-result v0

    return v0
.end method

.method public getHideMotionSpec()Lc/a/a/a/m/h;
    .registers 2

    .line 1
    invoke-direct {p0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->getImpl()Lc/a/a/a/c0/d;

    move-result-object v0

    invoke-virtual {v0}, Lc/a/a/a/c0/d;->g()Lc/a/a/a/m/h;

    move-result-object v0

    return-object v0
.end method

.method public getRippleColor()I
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->m:Landroid/content/res/ColorStateList;

    if-eqz v0, :cond_9

    invoke-virtual {v0}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v0

    goto :goto_a

    :cond_9
    const/4 v0, 0x0

    :goto_a
    return v0
.end method

.method public getRippleColorStateList()Landroid/content/res/ColorStateList;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->m:Landroid/content/res/ColorStateList;

    return-object v0
.end method

.method public getShapeAppearanceModel()Lc/a/a/a/l0/m;
    .registers 2

    .line 1
    invoke-direct {p0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->getImpl()Lc/a/a/a/c0/d;

    move-result-object v0

    invoke-virtual {v0}, Lc/a/a/a/c0/d;->k()Lc/a/a/a/l0/m;

    move-result-object v0

    invoke-static {v0}, Lb/h/l/h;->a(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast v0, Lc/a/a/a/l0/m;

    return-object v0
.end method

.method public getShowMotionSpec()Lc/a/a/a/m/h;
    .registers 2

    .line 1
    invoke-direct {p0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->getImpl()Lc/a/a/a/c0/d;

    move-result-object v0

    invoke-virtual {v0}, Lc/a/a/a/c0/d;->l()Lc/a/a/a/m/h;

    move-result-object v0

    return-object v0
.end method

.method public getSize()I
    .registers 2

    .line 1
    iget v0, p0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->o:I

    return v0
.end method

.method public getSizeDimension()I
    .registers 2

    .line 1
    iget v0, p0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->o:I

    invoke-virtual {p0, v0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->a(I)I

    move-result v0

    return v0
.end method

.method public getSupportBackgroundTintList()Landroid/content/res/ColorStateList;
    .registers 2

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->getBackgroundTintList()Landroid/content/res/ColorStateList;

    move-result-object v0

    return-object v0
.end method

.method public getSupportBackgroundTintMode()Landroid/graphics/PorterDuff$Mode;
    .registers 2

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->getBackgroundTintMode()Landroid/graphics/PorterDuff$Mode;

    move-result-object v0

    return-object v0
.end method

.method public getSupportImageTintList()Landroid/content/res/ColorStateList;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->k:Landroid/content/res/ColorStateList;

    return-object v0
.end method

.method public getSupportImageTintMode()Landroid/graphics/PorterDuff$Mode;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->l:Landroid/graphics/PorterDuff$Mode;

    return-object v0
.end method

.method public getUseCompatPadding()Z
    .registers 2

    .line 1
    iget-boolean v0, p0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->s:Z

    return v0
.end method

.method public jumpDrawablesToCurrentState()V
    .registers 2

    .line 1
    invoke-super {p0}, Landroid/widget/ImageButton;->jumpDrawablesToCurrentState()V

    .line 2
    invoke-direct {p0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->getImpl()Lc/a/a/a/c0/d;

    move-result-object v0

    invoke-virtual {v0}, Lc/a/a/a/c0/d;->o()V

    return-void
.end method

.method public onAttachedToWindow()V
    .registers 2

    .line 1
    invoke-super {p0}, Landroid/widget/ImageButton;->onAttachedToWindow()V

    .line 2
    invoke-direct {p0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->getImpl()Lc/a/a/a/c0/d;

    move-result-object v0

    invoke-virtual {v0}, Lc/a/a/a/c0/d;->p()V

    return-void
.end method

.method public onDetachedFromWindow()V
    .registers 2

    .line 1
    invoke-super {p0}, Landroid/widget/ImageButton;->onDetachedFromWindow()V

    .line 2
    invoke-direct {p0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->getImpl()Lc/a/a/a/c0/d;

    move-result-object v0

    invoke-virtual {v0}, Lc/a/a/a/c0/d;->r()V

    return-void
.end method

.method public onMeasure(II)V
    .registers 5

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->getSizeDimension()I

    move-result v0

    .line 2
    iget v1, p0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->r:I

    sub-int v1, v0, v1

    div-int/lit8 v1, v1, 0x2

    iput v1, p0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->q:I

    .line 3
    invoke-direct {p0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->getImpl()Lc/a/a/a/c0/d;

    move-result-object v1

    invoke-virtual {v1}, Lc/a/a/a/c0/d;->B()V

    .line 4
    invoke-static {v0, p1}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->a(II)I

    move-result p1

    .line 5
    invoke-static {v0, p2}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->a(II)I

    move-result p2

    .line 6
    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    move-result p1

    .line 7
    iget-object p2, p0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->t:Landroid/graphics/Rect;

    iget v0, p2, Landroid/graphics/Rect;->left:I

    add-int/2addr v0, p1

    iget v1, p2, Landroid/graphics/Rect;->right:I

    add-int/2addr v0, v1

    iget v1, p2, Landroid/graphics/Rect;->top:I

    add-int/2addr p1, v1

    iget p2, p2, Landroid/graphics/Rect;->bottom:I

    add-int/2addr p1, p2

    invoke-virtual {p0, v0, p1}, Landroid/widget/ImageButton;->setMeasuredDimension(II)V

    return-void
.end method

.method public onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 4

    .line 1
    instance-of v0, p1, Lcom/google/android/material/stateful/ExtendableSavedState;

    if-nez v0, :cond_8

    .line 2
    invoke-super {p0, p1}, Landroid/widget/ImageButton;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    return-void

    .line 3
    :cond_8
    check-cast p1, Lcom/google/android/material/stateful/ExtendableSavedState;

    .line 4
    invoke-virtual {p1}, Landroidx/customview/view/AbsSavedState;->e()Landroid/os/Parcelable;

    move-result-object v0

    invoke-super {p0, v0}, Landroid/widget/ImageButton;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 5
    iget-object v0, p0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->w:Lc/a/a/a/b0/c;

    iget-object p1, p1, Lcom/google/android/material/stateful/ExtendableSavedState;->j:Lb/e/g;

    const-string v1, "expandableWidgetHelper"

    .line 6
    invoke-virtual {p1, v1}, Lb/e/g;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1}, Lb/h/l/h;->a(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast p1, Landroid/os/Bundle;

    .line 7
    invoke-virtual {v0, p1}, Lc/a/a/a/b0/c;->a(Landroid/os/Bundle;)V

    return-void
.end method

.method public onSaveInstanceState()Landroid/os/Parcelable;
    .registers 5

    .line 1
    invoke-super {p0}, Landroid/widget/ImageButton;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v0

    if-nez v0, :cond_b

    .line 2
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 3
    :cond_b
    new-instance v1, Lcom/google/android/material/stateful/ExtendableSavedState;

    invoke-direct {v1, v0}, Lcom/google/android/material/stateful/ExtendableSavedState;-><init>(Landroid/os/Parcelable;)V

    .line 4
    iget-object v0, v1, Lcom/google/android/material/stateful/ExtendableSavedState;->j:Lb/e/g;

    iget-object v2, p0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->w:Lc/a/a/a/b0/c;

    .line 5
    invoke-virtual {v2}, Lc/a/a/a/b0/c;->d()Landroid/os/Bundle;

    move-result-object v2

    const-string v3, "expandableWidgetHelper"

    .line 6
    invoke-virtual {v0, v3, v2}, Lb/e/g;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v1
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 5

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_22

    .line 2
    iget-object v0, p0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->u:Landroid/graphics/Rect;

    invoke-virtual {p0, v0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->a(Landroid/graphics/Rect;)Z

    move-result v0

    if-eqz v0, :cond_22

    iget-object v0, p0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->u:Landroid/graphics/Rect;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    float-to-int v1, v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    float-to-int v2, v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Rect;->contains(II)Z

    move-result v0

    if-nez v0, :cond_22

    const/4 p1, 0x0

    return p1

    .line 3
    :cond_22
    invoke-super {p0, p1}, Landroid/widget/ImageButton;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public setBackgroundColor(I)V
    .registers 3

    const-string p1, "FloatingActionButton"

    const-string v0, "Setting a custom background is not supported."

    .line 1
    invoke-static {p1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 3

    const-string p1, "FloatingActionButton"

    const-string v0, "Setting a custom background is not supported."

    .line 1
    invoke-static {p1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public setBackgroundResource(I)V
    .registers 3

    const-string p1, "FloatingActionButton"

    const-string v0, "Setting a custom background is not supported."

    .line 1
    invoke-static {p1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public setBackgroundTintList(Landroid/content/res/ColorStateList;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->i:Landroid/content/res/ColorStateList;

    if-eq v0, p1, :cond_d

    .line 2
    iput-object p1, p0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->i:Landroid/content/res/ColorStateList;

    .line 3
    invoke-direct {p0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->getImpl()Lc/a/a/a/c0/d;

    move-result-object v0

    invoke-virtual {v0, p1}, Lc/a/a/a/c0/d;->a(Landroid/content/res/ColorStateList;)V

    :cond_d
    return-void
.end method

.method public setBackgroundTintMode(Landroid/graphics/PorterDuff$Mode;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->j:Landroid/graphics/PorterDuff$Mode;

    if-eq v0, p1, :cond_d

    .line 2
    iput-object p1, p0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->j:Landroid/graphics/PorterDuff$Mode;

    .line 3
    invoke-direct {p0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->getImpl()Lc/a/a/a/c0/d;

    move-result-object v0

    invoke-virtual {v0, p1}, Lc/a/a/a/c0/d;->a(Landroid/graphics/PorterDuff$Mode;)V

    :cond_d
    return-void
.end method

.method public setCompatElevation(F)V
    .registers 3

    .line 1
    invoke-direct {p0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->getImpl()Lc/a/a/a/c0/d;

    move-result-object v0

    invoke-virtual {v0, p1}, Lc/a/a/a/c0/d;->a(F)V

    return-void
.end method

.method public setCompatElevationResource(I)V
    .registers 3

    .line 1
    invoke-virtual {p0}, Landroid/widget/ImageButton;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    invoke-virtual {p0, p1}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->setCompatElevation(F)V

    return-void
.end method

.method public setCompatHoveredFocusedTranslationZ(F)V
    .registers 3

    .line 1
    invoke-direct {p0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->getImpl()Lc/a/a/a/c0/d;

    move-result-object v0

    invoke-virtual {v0, p1}, Lc/a/a/a/c0/d;->b(F)V

    return-void
.end method

.method public setCompatHoveredFocusedTranslationZResource(I)V
    .registers 3

    .line 1
    invoke-virtual {p0}, Landroid/widget/ImageButton;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    invoke-virtual {p0, p1}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->setCompatHoveredFocusedTranslationZ(F)V

    return-void
.end method

.method public setCompatPressedTranslationZ(F)V
    .registers 3

    .line 1
    invoke-direct {p0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->getImpl()Lc/a/a/a/c0/d;

    move-result-object v0

    invoke-virtual {v0, p1}, Lc/a/a/a/c0/d;->d(F)V

    return-void
.end method

.method public setCompatPressedTranslationZResource(I)V
    .registers 3

    .line 1
    invoke-virtual {p0}, Landroid/widget/ImageButton;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    invoke-virtual {p0, p1}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->setCompatPressedTranslationZ(F)V

    return-void
.end method

.method public setCustomSize(I)V
    .registers 3

    if-ltz p1, :cond_c

    .line 1
    iget v0, p0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->p:I

    if-eq p1, v0, :cond_b

    .line 2
    iput p1, p0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->p:I

    .line 3
    invoke-virtual {p0}, Landroid/widget/ImageButton;->requestLayout()V

    :cond_b
    return-void

    .line 4
    :cond_c
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Custom size must be non-negative"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setElevation(F)V
    .registers 3

    .line 1
    invoke-super {p0, p1}, Landroid/widget/ImageButton;->setElevation(F)V

    .line 2
    invoke-direct {p0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->getImpl()Lc/a/a/a/c0/d;

    move-result-object v0

    invoke-virtual {v0, p1}, Lc/a/a/a/c0/d;->e(F)V

    return-void
.end method

.method public setEnsureMinTouchTargetSize(Z)V
    .registers 3

    .line 1
    invoke-direct {p0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->getImpl()Lc/a/a/a/c0/d;

    move-result-object v0

    invoke-virtual {v0}, Lc/a/a/a/c0/d;->f()Z

    move-result v0

    if-eq p1, v0, :cond_14

    .line 2
    invoke-direct {p0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->getImpl()Lc/a/a/a/c0/d;

    move-result-object v0

    invoke-virtual {v0, p1}, Lc/a/a/a/c0/d;->a(Z)V

    .line 3
    invoke-virtual {p0}, Landroid/widget/ImageButton;->requestLayout()V

    :cond_14
    return-void
.end method

.method public setExpandedComponentIdHint(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->w:Lc/a/a/a/b0/c;

    invoke-virtual {v0, p1}, Lc/a/a/a/b0/c;->a(I)V

    return-void
.end method

.method public setHideMotionSpec(Lc/a/a/a/m/h;)V
    .registers 3

    .line 1
    invoke-direct {p0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->getImpl()Lc/a/a/a/c0/d;

    move-result-object v0

    invoke-virtual {v0, p1}, Lc/a/a/a/c0/d;->a(Lc/a/a/a/m/h;)V

    return-void
.end method

.method public setHideMotionSpecResource(I)V
    .registers 3

    .line 1
    invoke-virtual {p0}, Landroid/widget/ImageButton;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lc/a/a/a/m/h;->a(Landroid/content/Context;I)Lc/a/a/a/m/h;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->setHideMotionSpec(Lc/a/a/a/m/h;)V

    return-void
.end method

.method public setImageDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 3

    .line 1
    invoke-virtual {p0}, Landroid/widget/ImageButton;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eq v0, p1, :cond_17

    .line 2
    invoke-super {p0, p1}, Landroid/widget/ImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 3
    invoke-direct {p0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->getImpl()Lc/a/a/a/c0/d;

    move-result-object p1

    invoke-virtual {p1}, Lc/a/a/a/c0/d;->A()V

    .line 4
    iget-object p1, p0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->k:Landroid/content/res/ColorStateList;

    if-eqz p1, :cond_17

    .line 5
    invoke-virtual {p0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->e()V

    :cond_17
    return-void
.end method

.method public setImageResource(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->v:Lb/b/q/h;

    invoke-virtual {v0, p1}, Lb/b/q/h;->a(I)V

    .line 2
    invoke-virtual {p0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->e()V

    return-void
.end method

.method public setRippleColor(I)V
    .registers 2

    .line 1
    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->setRippleColor(Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public setRippleColor(Landroid/content/res/ColorStateList;)V
    .registers 3

    .line 2
    iget-object v0, p0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->m:Landroid/content/res/ColorStateList;

    if-eq v0, p1, :cond_f

    .line 3
    iput-object p1, p0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->m:Landroid/content/res/ColorStateList;

    .line 4
    invoke-direct {p0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->getImpl()Lc/a/a/a/c0/d;

    move-result-object p1

    iget-object v0, p0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->m:Landroid/content/res/ColorStateList;

    invoke-virtual {p1, v0}, Lc/a/a/a/c0/d;->b(Landroid/content/res/ColorStateList;)V

    :cond_f
    return-void
.end method

.method public setScaleX(F)V
    .registers 2

    .line 1
    invoke-super {p0, p1}, Landroid/widget/ImageButton;->setScaleX(F)V

    .line 2
    invoke-direct {p0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->getImpl()Lc/a/a/a/c0/d;

    move-result-object p1

    invoke-virtual {p1}, Lc/a/a/a/c0/d;->t()V

    return-void
.end method

.method public setScaleY(F)V
    .registers 2

    .line 1
    invoke-super {p0, p1}, Landroid/widget/ImageButton;->setScaleY(F)V

    .line 2
    invoke-direct {p0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->getImpl()Lc/a/a/a/c0/d;

    move-result-object p1

    invoke-virtual {p1}, Lc/a/a/a/c0/d;->t()V

    return-void
.end method

.method public setShadowPaddingEnabled(Z)V
    .registers 3

    .line 1
    invoke-direct {p0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->getImpl()Lc/a/a/a/c0/d;

    move-result-object v0

    invoke-virtual {v0, p1}, Lc/a/a/a/c0/d;->b(Z)V

    return-void
.end method

.method public setShapeAppearanceModel(Lc/a/a/a/l0/m;)V
    .registers 3

    .line 1
    invoke-direct {p0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->getImpl()Lc/a/a/a/c0/d;

    move-result-object v0

    invoke-virtual {v0, p1}, Lc/a/a/a/c0/d;->a(Lc/a/a/a/l0/m;)V

    return-void
.end method

.method public setShowMotionSpec(Lc/a/a/a/m/h;)V
    .registers 3

    .line 1
    invoke-direct {p0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->getImpl()Lc/a/a/a/c0/d;

    move-result-object v0

    invoke-virtual {v0, p1}, Lc/a/a/a/c0/d;->b(Lc/a/a/a/m/h;)V

    return-void
.end method

.method public setShowMotionSpecResource(I)V
    .registers 3

    .line 1
    invoke-virtual {p0}, Landroid/widget/ImageButton;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lc/a/a/a/m/h;->a(Landroid/content/Context;I)Lc/a/a/a/m/h;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->setShowMotionSpec(Lc/a/a/a/m/h;)V

    return-void
.end method

.method public setSize(I)V
    .registers 3

    const/4 v0, 0x0

    .line 1
    iput v0, p0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->p:I

    .line 2
    iget v0, p0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->o:I

    if-eq p1, v0, :cond_c

    .line 3
    iput p1, p0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->o:I

    .line 4
    invoke-virtual {p0}, Landroid/widget/ImageButton;->requestLayout()V

    :cond_c
    return-void
.end method

.method public setSupportBackgroundTintList(Landroid/content/res/ColorStateList;)V
    .registers 2

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public setSupportBackgroundTintMode(Landroid/graphics/PorterDuff$Mode;)V
    .registers 2

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->setBackgroundTintMode(Landroid/graphics/PorterDuff$Mode;)V

    return-void
.end method

.method public setSupportImageTintList(Landroid/content/res/ColorStateList;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->k:Landroid/content/res/ColorStateList;

    if-eq v0, p1, :cond_9

    .line 2
    iput-object p1, p0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->k:Landroid/content/res/ColorStateList;

    .line 3
    invoke-virtual {p0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->e()V

    :cond_9
    return-void
.end method

.method public setSupportImageTintMode(Landroid/graphics/PorterDuff$Mode;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->l:Landroid/graphics/PorterDuff$Mode;

    if-eq v0, p1, :cond_9

    .line 2
    iput-object p1, p0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->l:Landroid/graphics/PorterDuff$Mode;

    .line 3
    invoke-virtual {p0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->e()V

    :cond_9
    return-void
.end method

.method public setTranslationX(F)V
    .registers 2

    .line 1
    invoke-super {p0, p1}, Landroid/widget/ImageButton;->setTranslationX(F)V

    .line 2
    invoke-direct {p0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->getImpl()Lc/a/a/a/c0/d;

    move-result-object p1

    invoke-virtual {p1}, Lc/a/a/a/c0/d;->u()V

    return-void
.end method

.method public setTranslationY(F)V
    .registers 2

    .line 1
    invoke-super {p0, p1}, Landroid/widget/ImageButton;->setTranslationY(F)V

    .line 2
    invoke-direct {p0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->getImpl()Lc/a/a/a/c0/d;

    move-result-object p1

    invoke-virtual {p1}, Lc/a/a/a/c0/d;->u()V

    return-void
.end method

.method public setTranslationZ(F)V
    .registers 2

    .line 1
    invoke-super {p0, p1}, Landroid/widget/ImageButton;->setTranslationZ(F)V

    .line 2
    invoke-direct {p0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->getImpl()Lc/a/a/a/c0/d;

    move-result-object p1

    invoke-virtual {p1}, Lc/a/a/a/c0/d;->u()V

    return-void
.end method

.method public setUseCompatPadding(Z)V
    .registers 3

    .line 1
    iget-boolean v0, p0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->s:Z

    if-eq v0, p1, :cond_d

    .line 2
    iput-boolean p1, p0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->s:Z

    .line 3
    invoke-direct {p0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->getImpl()Lc/a/a/a/c0/d;

    move-result-object p1

    invoke-virtual {p1}, Lc/a/a/a/c0/d;->q()V

    :cond_d
    return-void
.end method

.method public setVisibility(I)V
    .registers 2

    .line 1
    invoke-super {p0, p1}, Lcom/google/android/material/internal/VisibilityAwareImageButton;->setVisibility(I)V

    return-void
.end method
