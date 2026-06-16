.class public Lcom/google/android/material/bottomappbar/BottomAppBar;
.super Landroidx/appcompat/widget/Toolbar;
.source "BottomAppBar.java"

# interfaces
.implements Landroidx/coordinatorlayout/widget/CoordinatorLayout$b;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/material/bottomappbar/BottomAppBar$SavedState;,
        Lcom/google/android/material/bottomappbar/BottomAppBar$Behavior;,
        Lcom/google/android/material/bottomappbar/BottomAppBar$j;
    }
.end annotation


# static fields
.field public static final u0:I


# instance fields
.field public final W:I

.field public final a0:Lc/a/a/a/l0/h;

.field public b0:Landroid/animation/Animator;

.field public c0:Landroid/animation/Animator;

.field public d0:I

.field public e0:I

.field public f0:Z

.field public final g0:Z

.field public final h0:Z

.field public final i0:Z

.field public j0:I

.field public k0:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/google/android/material/bottomappbar/BottomAppBar$j;",
            ">;"
        }
    .end annotation
.end field

.field public l0:I

.field public m0:Z

.field public n0:Z

.field public o0:Lcom/google/android/material/bottomappbar/BottomAppBar$Behavior;

.field public p0:I

.field public q0:I

.field public r0:I

.field public s0:Landroid/animation/AnimatorListenerAdapter;

.field public t0:Lc/a/a/a/m/k;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lc/a/a/a/m/k<",
            "Lcom/google/android/material/floatingactionbutton/FloatingActionButton;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public static constructor <clinit>()V
    .registers 1

    .line 1
    sget v0, Lc/a/a/a/k;->Widget_MaterialComponents_BottomAppBar:I

    sput v0, Lcom/google/android/material/bottomappbar/BottomAppBar;->u0:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 4

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 1
    invoke-direct {p0, p1, v0, v1}, Lcom/google/android/material/bottomappbar/BottomAppBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    .line 2
    sget v0, Lc/a/a/a/b;->bottomAppBarStyle:I

    invoke-direct {p0, p1, p2, v0}, Lcom/google/android/material/bottomappbar/BottomAppBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 12

    .line 3
    sget v0, Lcom/google/android/material/bottomappbar/BottomAppBar;->u0:I

    invoke-static {p1, p2, p3, v0}, Lc/a/a/a/q0/a/a;->b(Landroid/content/Context;Landroid/util/AttributeSet;II)Landroid/content/Context;

    move-result-object p1

    invoke-direct {p0, p1, p2, p3}, Landroidx/appcompat/widget/Toolbar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 4
    new-instance p1, Lc/a/a/a/l0/h;

    invoke-direct {p1}, Lc/a/a/a/l0/h;-><init>()V

    iput-object p1, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->a0:Lc/a/a/a/l0/h;

    const/4 p1, 0x0

    .line 5
    iput p1, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->j0:I

    .line 6
    iput p1, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->l0:I

    .line 7
    iput-boolean p1, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->m0:Z

    const/4 v0, 0x1

    .line 8
    iput-boolean v0, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->n0:Z

    .line 9
    new-instance v0, Lcom/google/android/material/bottomappbar/BottomAppBar$a;

    invoke-direct {v0, p0}, Lcom/google/android/material/bottomappbar/BottomAppBar$a;-><init>(Lcom/google/android/material/bottomappbar/BottomAppBar;)V

    iput-object v0, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->s0:Landroid/animation/AnimatorListenerAdapter;

    .line 10
    new-instance v0, Lcom/google/android/material/bottomappbar/BottomAppBar$b;

    invoke-direct {v0, p0}, Lcom/google/android/material/bottomappbar/BottomAppBar$b;-><init>(Lcom/google/android/material/bottomappbar/BottomAppBar;)V

    iput-object v0, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->t0:Lc/a/a/a/m/k;

    .line 11
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 12
    sget-object v3, Lc/a/a/a/l;->BottomAppBar:[I

    sget v5, Lcom/google/android/material/bottomappbar/BottomAppBar;->u0:I

    new-array v6, p1, [I

    move-object v1, v0

    move-object v2, p2

    move v4, p3

    .line 13
    invoke-static/range {v1 .. v6}, Lc/a/a/a/d0/m;->c(Landroid/content/Context;Landroid/util/AttributeSet;[III[I)Landroid/content/res/TypedArray;

    move-result-object v1

    .line 14
    sget v2, Lc/a/a/a/l;->BottomAppBar_backgroundTint:I

    .line 15
    invoke-static {v0, v1, v2}, Lc/a/a/a/i0/c;->a(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/content/res/ColorStateList;

    move-result-object v2

    .line 16
    sget v3, Lc/a/a/a/l;->BottomAppBar_elevation:I

    invoke-virtual {v1, v3, p1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    .line 17
    sget v4, Lc/a/a/a/l;->BottomAppBar_fabCradleMargin:I

    invoke-virtual {v1, v4, p1}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v4

    int-to-float v4, v4

    .line 18
    sget v5, Lc/a/a/a/l;->BottomAppBar_fabCradleRoundedCornerRadius:I

    .line 19
    invoke-virtual {v1, v5, p1}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v5

    int-to-float v5, v5

    .line 20
    sget v6, Lc/a/a/a/l;->BottomAppBar_fabCradleVerticalOffset:I

    .line 21
    invoke-virtual {v1, v6, p1}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v6

    int-to-float v6, v6

    .line 22
    sget v7, Lc/a/a/a/l;->BottomAppBar_fabAlignmentMode:I

    .line 23
    invoke-virtual {v1, v7, p1}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v7

    iput v7, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->d0:I

    .line 24
    sget v7, Lc/a/a/a/l;->BottomAppBar_fabAnimationMode:I

    .line 25
    invoke-virtual {v1, v7, p1}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v7

    iput v7, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->e0:I

    .line 26
    sget v7, Lc/a/a/a/l;->BottomAppBar_hideOnScroll:I

    invoke-virtual {v1, v7, p1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v7

    iput-boolean v7, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->f0:Z

    .line 27
    sget v7, Lc/a/a/a/l;->BottomAppBar_paddingBottomSystemWindowInsets:I

    .line 28
    invoke-virtual {v1, v7, p1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v7

    iput-boolean v7, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->g0:Z

    .line 29
    sget v7, Lc/a/a/a/l;->BottomAppBar_paddingLeftSystemWindowInsets:I

    .line 30
    invoke-virtual {v1, v7, p1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v7

    iput-boolean v7, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->h0:Z

    .line 31
    sget v7, Lc/a/a/a/l;->BottomAppBar_paddingRightSystemWindowInsets:I

    .line 32
    invoke-virtual {v1, v7, p1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p1

    iput-boolean p1, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->i0:Z

    .line 33
    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    .line 34
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    sget v1, Lc/a/a/a/d;->mtrl_bottomappbar_fabOffsetEndMode:I

    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result p1

    iput p1, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->W:I

    .line 35
    new-instance p1, Lc/a/a/a/p/a;

    invoke-direct {p1, v4, v5, v6}, Lc/a/a/a/p/a;-><init>(FFF)V

    .line 36
    invoke-static {}, Lc/a/a/a/l0/m;->n()Lc/a/a/a/l0/m$b;

    move-result-object v1

    invoke-virtual {v1, p1}, Lc/a/a/a/l0/m$b;->b(Lc/a/a/a/l0/f;)Lc/a/a/a/l0/m$b;

    invoke-virtual {v1}, Lc/a/a/a/l0/m$b;->a()Lc/a/a/a/l0/m;

    move-result-object p1

    .line 37
    iget-object v1, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->a0:Lc/a/a/a/l0/h;

    invoke-virtual {v1, p1}, Lc/a/a/a/l0/h;->setShapeAppearanceModel(Lc/a/a/a/l0/m;)V

    .line 38
    iget-object p1, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->a0:Lc/a/a/a/l0/h;

    const/4 v1, 0x2

    invoke-virtual {p1, v1}, Lc/a/a/a/l0/h;->d(I)V

    .line 39
    iget-object p1, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->a0:Lc/a/a/a/l0/h;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, v1}, Lc/a/a/a/l0/h;->a(Landroid/graphics/Paint$Style;)V

    .line 40
    iget-object p1, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->a0:Lc/a/a/a/l0/h;

    invoke-virtual {p1, v0}, Lc/a/a/a/l0/h;->a(Landroid/content/Context;)V

    int-to-float p1, v3

    .line 41
    invoke-virtual {p0, p1}, Lcom/google/android/material/bottomappbar/BottomAppBar;->setElevation(F)V

    .line 42
    iget-object p1, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->a0:Lc/a/a/a/l0/h;

    invoke-static {p1, v2}, Lb/h/f/l/a;->a(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    .line 43
    iget-object p1, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->a0:Lc/a/a/a/l0/h;

    invoke-static {p0, p1}, Lb/h/m/y;->a(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 44
    sget p1, Lcom/google/android/material/bottomappbar/BottomAppBar;->u0:I

    new-instance v0, Lcom/google/android/material/bottomappbar/BottomAppBar$c;

    invoke-direct {v0, p0}, Lcom/google/android/material/bottomappbar/BottomAppBar$c;-><init>(Lcom/google/android/material/bottomappbar/BottomAppBar;)V

    invoke-static {p0, p2, p3, p1, v0}, Lc/a/a/a/d0/t;->a(Landroid/view/View;Landroid/util/AttributeSet;IILc/a/a/a/d0/t$e;)V

    return-void
.end method

.method public static synthetic a(Lcom/google/android/material/bottomappbar/BottomAppBar;I)I
    .registers 2

    .line 3
    iput p1, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->q0:I

    return p1
.end method

.method public static synthetic a(Lcom/google/android/material/bottomappbar/BottomAppBar;Landroid/animation/Animator;)Landroid/animation/Animator;
    .registers 2

    .line 4
    iput-object p1, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->b0:Landroid/animation/Animator;

    return-object p1
.end method

.method public static synthetic a(Lcom/google/android/material/bottomappbar/BottomAppBar;IZ)V
    .registers 3

    .line 6
    invoke-virtual {p0, p1, p2}, Lcom/google/android/material/bottomappbar/BottomAppBar;->a(IZ)V

    return-void
.end method

.method public static synthetic a(Lcom/google/android/material/bottomappbar/BottomAppBar;Landroidx/appcompat/widget/ActionMenuView;IZZ)V
    .registers 5

    .line 5
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/google/android/material/bottomappbar/BottomAppBar;->a(Landroidx/appcompat/widget/ActionMenuView;IZZ)V

    return-void
.end method

.method public static synthetic a(Lcom/google/android/material/bottomappbar/BottomAppBar;Lcom/google/android/material/floatingactionbutton/FloatingActionButton;)V
    .registers 2

    .line 7
    invoke-virtual {p0, p1}, Lcom/google/android/material/bottomappbar/BottomAppBar;->a(Lcom/google/android/material/floatingactionbutton/FloatingActionButton;)V

    return-void
.end method

.method public static synthetic a(Lcom/google/android/material/bottomappbar/BottomAppBar;)Z
    .registers 1

    .line 1
    iget-boolean p0, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->m0:Z

    return p0
.end method

.method public static synthetic a(Lcom/google/android/material/bottomappbar/BottomAppBar;Z)Z
    .registers 2

    .line 2
    iput-boolean p1, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->m0:Z

    return p1
.end method

.method public static synthetic b(Lcom/google/android/material/bottomappbar/BottomAppBar;I)F
    .registers 2

    .line 2
    invoke-virtual {p0, p1}, Lcom/google/android/material/bottomappbar/BottomAppBar;->d(I)F

    move-result p0

    return p0
.end method

.method public static synthetic b(Lcom/google/android/material/bottomappbar/BottomAppBar;)I
    .registers 1

    .line 1
    iget p0, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->d0:I

    return p0
.end method

.method public static synthetic b(Lcom/google/android/material/bottomappbar/BottomAppBar;Landroid/animation/Animator;)Landroid/animation/Animator;
    .registers 2

    .line 3
    iput-object p1, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->c0:Landroid/animation/Animator;

    return-object p1
.end method

.method public static synthetic c(Lcom/google/android/material/bottomappbar/BottomAppBar;I)I
    .registers 2

    .line 2
    iput p1, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->p0:I

    return p1
.end method

.method public static synthetic c(Lcom/google/android/material/bottomappbar/BottomAppBar;)Z
    .registers 1

    .line 1
    iget-boolean p0, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->i0:Z

    return p0
.end method

.method public static synthetic d(Lcom/google/android/material/bottomappbar/BottomAppBar;)I
    .registers 1

    .line 1
    iget p0, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->q0:I

    return p0
.end method

.method public static synthetic d(Lcom/google/android/material/bottomappbar/BottomAppBar;I)I
    .registers 2

    .line 2
    iput p1, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->r0:I

    return p1
.end method

.method public static synthetic e(Lcom/google/android/material/bottomappbar/BottomAppBar;)V
    .registers 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/bottomappbar/BottomAppBar;->s()V

    return-void
.end method

.method public static synthetic f(Lcom/google/android/material/bottomappbar/BottomAppBar;)V
    .registers 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/bottomappbar/BottomAppBar;->z()V

    return-void
.end method

.method public static synthetic g(Lcom/google/android/material/bottomappbar/BottomAppBar;)V
    .registers 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/bottomappbar/BottomAppBar;->y()V

    return-void
.end method

.method private getActionMenuView()Landroidx/appcompat/widget/ActionMenuView;
    .registers 4

    const/4 v0, 0x0

    .line 1
    :goto_1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_15

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 3
    instance-of v2, v1, Landroidx/appcompat/widget/ActionMenuView;

    if-eqz v2, :cond_12

    .line 4
    check-cast v1, Landroidx/appcompat/widget/ActionMenuView;

    return-object v1

    :cond_12
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_15
    const/4 v0, 0x0

    return-object v0
.end method

.method private getBottomInset()I
    .registers 2

    .line 1
    iget v0, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->p0:I

    return v0
.end method

.method private getFabTranslationX()F
    .registers 2

    .line 1
    iget v0, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->d0:I

    invoke-virtual {p0, v0}, Lcom/google/android/material/bottomappbar/BottomAppBar;->d(I)F

    move-result v0

    return v0
.end method

.method private getFabTranslationY()F
    .registers 2

    .line 1
    invoke-direct {p0}, Lcom/google/android/material/bottomappbar/BottomAppBar;->getTopEdgeTreatment()Lc/a/a/a/p/a;

    move-result-object v0

    invoke-virtual {v0}, Lc/a/a/a/p/a;->b()F

    move-result v0

    neg-float v0, v0

    return v0
.end method

.method private getLeftInset()I
    .registers 2

    .line 1
    iget v0, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->r0:I

    return v0
.end method

.method private getRightInset()I
    .registers 2

    .line 1
    iget v0, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->q0:I

    return v0
.end method

.method private getTopEdgeTreatment()Lc/a/a/a/p/a;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->a0:Lc/a/a/a/l0/h;

    .line 2
    invoke-virtual {v0}, Lc/a/a/a/l0/h;->n()Lc/a/a/a/l0/m;

    move-result-object v0

    invoke-virtual {v0}, Lc/a/a/a/l0/m;->h()Lc/a/a/a/l0/f;

    move-result-object v0

    check-cast v0, Lc/a/a/a/p/a;

    return-object v0
.end method

.method public static synthetic h(Lcom/google/android/material/bottomappbar/BottomAppBar;)V
    .registers 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/bottomappbar/BottomAppBar;->u()V

    return-void
.end method

.method public static synthetic i(Lcom/google/android/material/bottomappbar/BottomAppBar;)V
    .registers 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/bottomappbar/BottomAppBar;->t()V

    return-void
.end method

.method public static synthetic j(Lcom/google/android/material/bottomappbar/BottomAppBar;)Z
    .registers 1

    .line 1
    iget-boolean p0, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->n0:Z

    return p0
.end method

.method public static synthetic k(Lcom/google/android/material/bottomappbar/BottomAppBar;)I
    .registers 1

    .line 1
    iget p0, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->l0:I

    return p0
.end method

.method public static synthetic l(Lcom/google/android/material/bottomappbar/BottomAppBar;)Lcom/google/android/material/floatingactionbutton/FloatingActionButton;
    .registers 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/bottomappbar/BottomAppBar;->v()Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic m(Lcom/google/android/material/bottomappbar/BottomAppBar;)F
    .registers 1

    .line 1
    invoke-direct {p0}, Lcom/google/android/material/bottomappbar/BottomAppBar;->getFabTranslationX()F

    move-result p0

    return p0
.end method

.method public static synthetic n(Lcom/google/android/material/bottomappbar/BottomAppBar;)I
    .registers 1

    .line 1
    invoke-direct {p0}, Lcom/google/android/material/bottomappbar/BottomAppBar;->getBottomInset()I

    move-result p0

    return p0
.end method

.method public static synthetic o(Lcom/google/android/material/bottomappbar/BottomAppBar;)I
    .registers 1

    .line 1
    invoke-direct {p0}, Lcom/google/android/material/bottomappbar/BottomAppBar;->getLeftInset()I

    move-result p0

    return p0
.end method

.method public static synthetic p(Lcom/google/android/material/bottomappbar/BottomAppBar;)I
    .registers 1

    .line 1
    invoke-direct {p0}, Lcom/google/android/material/bottomappbar/BottomAppBar;->getRightInset()I

    move-result p0

    return p0
.end method

.method public static synthetic q(Lcom/google/android/material/bottomappbar/BottomAppBar;)I
    .registers 1

    .line 1
    iget p0, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->W:I

    return p0
.end method

.method public static synthetic r(Lcom/google/android/material/bottomappbar/BottomAppBar;)Landroid/view/View;
    .registers 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/bottomappbar/BottomAppBar;->w()Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic s(Lcom/google/android/material/bottomappbar/BottomAppBar;)Lc/a/a/a/l0/h;
    .registers 1

    .line 1
    iget-object p0, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->a0:Lc/a/a/a/l0/h;

    return-object p0
.end method

.method public static synthetic t(Lcom/google/android/material/bottomappbar/BottomAppBar;)Lc/a/a/a/p/a;
    .registers 1

    .line 1
    invoke-direct {p0}, Lcom/google/android/material/bottomappbar/BottomAppBar;->getTopEdgeTreatment()Lc/a/a/a/p/a;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic u(Lcom/google/android/material/bottomappbar/BottomAppBar;)Z
    .registers 1

    .line 1
    iget-boolean p0, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->g0:Z

    return p0
.end method

.method public static synthetic v(Lcom/google/android/material/bottomappbar/BottomAppBar;)Z
    .registers 1

    .line 1
    iget-boolean p0, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->h0:Z

    return p0
.end method

.method public static synthetic w(Lcom/google/android/material/bottomappbar/BottomAppBar;)I
    .registers 1

    .line 1
    iget p0, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->r0:I

    return p0
.end method


# virtual methods
.method public a(Landroidx/appcompat/widget/ActionMenuView;IZ)I
    .registers 10

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-ne p2, v0, :cond_68

    if-nez p3, :cond_7

    goto :goto_68

    .line 41
    :cond_7
    invoke-static {p0}, Lc/a/a/a/d0/t;->e(Landroid/view/View;)Z

    move-result p2

    if-eqz p2, :cond_12

    .line 42
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getMeasuredWidth()I

    move-result p3

    goto :goto_13

    :cond_12
    const/4 p3, 0x0

    :goto_13
    const/4 v2, 0x0

    .line 43
    :goto_14
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v3

    if-ge v2, v3, :cond_52

    .line 44
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 45
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    instance-of v4, v4, Landroidx/appcompat/widget/Toolbar$LayoutParams;

    if-eqz v4, :cond_39

    .line 46
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    check-cast v4, Landroidx/appcompat/widget/Toolbar$LayoutParams;

    iget v4, v4, Landroidx/appcompat/app/ActionBar$LayoutParams;->a:I

    const v5, 0x800007

    and-int/2addr v4, v5

    const v5, 0x800003

    if-ne v4, v5, :cond_39

    const/4 v4, 0x1

    goto :goto_3a

    :cond_39
    const/4 v4, 0x0

    :goto_3a
    if-eqz v4, :cond_4f

    if-eqz p2, :cond_47

    .line 47
    invoke-virtual {v3}, Landroid/view/View;->getLeft()I

    move-result v3

    invoke-static {p3, v3}, Ljava/lang/Math;->min(II)I

    move-result p3

    goto :goto_4f

    .line 48
    :cond_47
    invoke-virtual {v3}, Landroid/view/View;->getRight()I

    move-result v3

    invoke-static {p3, v3}, Ljava/lang/Math;->max(II)I

    move-result p3

    :cond_4f
    :goto_4f
    add-int/lit8 v2, v2, 0x1

    goto :goto_14

    :cond_52
    if-eqz p2, :cond_59

    .line 49
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getRight()I

    move-result p1

    goto :goto_5d

    :cond_59
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getLeft()I

    move-result p1

    :goto_5d
    if-eqz p2, :cond_62

    .line 50
    iget p2, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->q0:I

    goto :goto_65

    :cond_62
    iget p2, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->r0:I

    neg-int p2, p2

    :goto_65
    add-int/2addr p1, p2

    sub-int/2addr p3, p1

    return p3

    :cond_68
    :goto_68
    return v1
.end method

.method public a(ILjava/util/List;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Landroid/animation/Animator;",
            ">;)V"
        }
    .end annotation

    .line 8
    invoke-virtual {p0}, Lcom/google/android/material/bottomappbar/BottomAppBar;->v()Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    move-result-object p2

    if-eqz p2, :cond_18

    .line 9
    invoke-virtual {p2}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->c()Z

    move-result v0

    if-eqz v0, :cond_d

    goto :goto_18

    .line 10
    :cond_d
    invoke-virtual {p0}, Lcom/google/android/material/bottomappbar/BottomAppBar;->u()V

    .line 11
    new-instance v0, Lcom/google/android/material/bottomappbar/BottomAppBar$e;

    invoke-direct {v0, p0, p1}, Lcom/google/android/material/bottomappbar/BottomAppBar$e;-><init>(Lcom/google/android/material/bottomappbar/BottomAppBar;I)V

    invoke-virtual {p2, v0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->a(Lcom/google/android/material/floatingactionbutton/FloatingActionButton$b;)V

    :cond_18
    :goto_18
    return-void
.end method

.method public final a(IZ)V
    .registers 6

    .line 12
    invoke-static {p0}, Lb/h/m/y;->K(Landroid/view/View;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_f

    .line 13
    iput-boolean v1, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->m0:Z

    .line 14
    iget p1, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->l0:I

    invoke-virtual {p0, p1}, Lcom/google/android/material/bottomappbar/BottomAppBar;->f(I)V

    return-void

    .line 15
    :cond_f
    iget-object v0, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->c0:Landroid/animation/Animator;

    if-eqz v0, :cond_16

    .line 16
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 17
    :cond_16
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 18
    invoke-virtual {p0}, Lcom/google/android/material/bottomappbar/BottomAppBar;->x()Z

    move-result v2

    if-nez v2, :cond_23

    const/4 p1, 0x0

    const/4 p2, 0x0

    .line 19
    :cond_23
    invoke-virtual {p0, p1, p2, v0}, Lcom/google/android/material/bottomappbar/BottomAppBar;->a(IZLjava/util/List;)V

    .line 20
    new-instance p1, Landroid/animation/AnimatorSet;

    invoke-direct {p1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 21
    invoke-virtual {p1, v0}, Landroid/animation/AnimatorSet;->playTogether(Ljava/util/Collection;)V

    .line 22
    iput-object p1, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->c0:Landroid/animation/Animator;

    .line 23
    new-instance p2, Lcom/google/android/material/bottomappbar/BottomAppBar$f;

    invoke-direct {p2, p0}, Lcom/google/android/material/bottomappbar/BottomAppBar$f;-><init>(Lcom/google/android/material/bottomappbar/BottomAppBar;)V

    invoke-virtual {p1, p2}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 24
    iget-object p1, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->c0:Landroid/animation/Animator;

    invoke-virtual {p1}, Landroid/animation/Animator;->start()V

    return-void
.end method

.method public final a(IZLjava/util/List;)V
    .registers 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IZ",
            "Ljava/util/List<",
            "Landroid/animation/Animator;",
            ">;)V"
        }
    .end annotation

    .line 25
    invoke-direct {p0}, Lcom/google/android/material/bottomappbar/BottomAppBar;->getActionMenuView()Landroidx/appcompat/widget/ActionMenuView;

    move-result-object v0

    if-nez v0, :cond_7

    return-void

    :cond_7
    const/4 v1, 0x1

    new-array v2, v1, [F

    const/high16 v3, 0x3f800000    # 1.0f

    const/4 v4, 0x0

    aput v3, v2, v4

    const-string v5, "alpha"

    .line 26
    invoke-static {v0, v5, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    .line 27
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getTranslationX()F

    move-result v6

    .line 28
    invoke-virtual {p0, v0, p1, p2}, Lcom/google/android/material/bottomappbar/BottomAppBar;->a(Landroidx/appcompat/widget/ActionMenuView;IZ)I

    move-result v7

    int-to-float v7, v7

    sub-float/2addr v6, v7

    .line 29
    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v6

    cmpl-float v6, v6, v3

    if-lez v6, :cond_50

    new-array v3, v1, [F

    const/4 v6, 0x0

    aput v6, v3, v4

    .line 30
    invoke-static {v0, v5, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    .line 31
    new-instance v5, Lcom/google/android/material/bottomappbar/BottomAppBar$g;

    invoke-direct {v5, p0, v0, p1, p2}, Lcom/google/android/material/bottomappbar/BottomAppBar$g;-><init>(Lcom/google/android/material/bottomappbar/BottomAppBar;Landroidx/appcompat/widget/ActionMenuView;IZ)V

    invoke-virtual {v3, v5}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 32
    new-instance p1, Landroid/animation/AnimatorSet;

    invoke-direct {p1}, Landroid/animation/AnimatorSet;-><init>()V

    const-wide/16 v5, 0x96

    .line 33
    invoke-virtual {p1, v5, v6}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    const/4 p2, 0x2

    new-array p2, p2, [Landroid/animation/Animator;

    aput-object v3, p2, v4

    aput-object v2, p2, v1

    .line 34
    invoke-virtual {p1, p2}, Landroid/animation/AnimatorSet;->playSequentially([Landroid/animation/Animator;)V

    .line 35
    invoke-interface {p3, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_5b

    .line 36
    :cond_50
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getAlpha()F

    move-result p1

    cmpg-float p1, p1, v3

    if-gez p1, :cond_5b

    .line 37
    invoke-interface {p3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_5b
    :goto_5b
    return-void
.end method

.method public final a(Landroidx/appcompat/widget/ActionMenuView;IZZ)V
    .registers 6

    .line 38
    new-instance v0, Lcom/google/android/material/bottomappbar/BottomAppBar$h;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/google/android/material/bottomappbar/BottomAppBar$h;-><init>(Lcom/google/android/material/bottomappbar/BottomAppBar;Landroidx/appcompat/widget/ActionMenuView;IZ)V

    if-eqz p4, :cond_b

    .line 39
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->post(Ljava/lang/Runnable;)Z

    goto :goto_e

    .line 40
    :cond_b
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    :goto_e
    return-void
.end method

.method public final a(Lcom/google/android/material/floatingactionbutton/FloatingActionButton;)V
    .registers 3

    .line 51
    iget-object v0, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->s0:Landroid/animation/AnimatorListenerAdapter;

    invoke-virtual {p1, v0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->a(Landroid/animation/Animator$AnimatorListener;)V

    .line 52
    new-instance v0, Lcom/google/android/material/bottomappbar/BottomAppBar$i;

    invoke-direct {v0, p0}, Lcom/google/android/material/bottomappbar/BottomAppBar$i;-><init>(Lcom/google/android/material/bottomappbar/BottomAppBar;)V

    invoke-virtual {p1, v0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->b(Landroid/animation/Animator$AnimatorListener;)V

    .line 53
    iget-object v0, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->t0:Lc/a/a/a/m/k;

    invoke-virtual {p1, v0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->a(Lc/a/a/a/m/k;)V

    return-void
.end method

.method public b(II)V
    .registers 3

    .line 4
    iput p2, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->l0:I

    const/4 p2, 0x1

    .line 5
    iput-boolean p2, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->m0:Z

    .line 6
    iget-boolean p2, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->n0:Z

    invoke-virtual {p0, p1, p2}, Lcom/google/android/material/bottomappbar/BottomAppBar;->a(IZ)V

    .line 7
    invoke-virtual {p0, p1}, Lcom/google/android/material/bottomappbar/BottomAppBar;->e(I)V

    .line 8
    iput p1, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->d0:I

    return-void
.end method

.method public final b(ILjava/util/List;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Landroid/animation/Animator;",
            ">;)V"
        }
    .end annotation

    .line 9
    invoke-virtual {p0}, Lcom/google/android/material/bottomappbar/BottomAppBar;->v()Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [F

    invoke-virtual {p0, p1}, Lcom/google/android/material/bottomappbar/BottomAppBar;->d(I)F

    move-result p1

    const/4 v2, 0x0

    aput p1, v1, v2

    const-string p1, "translationX"

    invoke-static {v0, p1, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object p1

    const-wide/16 v0, 0x12c

    .line 10
    invoke-virtual {p1, v0, v1}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 11
    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final b(Landroidx/appcompat/widget/ActionMenuView;IZ)V
    .registers 5

    const/4 v0, 0x0

    .line 12
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/google/android/material/bottomappbar/BottomAppBar;->a(Landroidx/appcompat/widget/ActionMenuView;IZZ)V

    return-void
.end method

.method public final d(I)F
    .registers 5

    .line 3
    invoke-static {p0}, Lc/a/a/a/d0/t;->e(Landroid/view/View;)Z

    move-result v0

    const/4 v1, 0x1

    if-ne p1, v1, :cond_1f

    if-eqz v0, :cond_c

    .line 4
    iget p1, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->r0:I

    goto :goto_e

    :cond_c
    iget p1, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->q0:I

    .line 5
    :goto_e
    iget v2, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->W:I

    add-int/2addr v2, p1

    .line 6
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getMeasuredWidth()I

    move-result p1

    div-int/lit8 p1, p1, 0x2

    sub-int/2addr p1, v2

    if-eqz v0, :cond_1b

    const/4 v1, -0x1

    :cond_1b
    mul-int p1, p1, v1

    int-to-float p1, p1

    return p1

    :cond_1f
    const/4 p1, 0x0

    return p1
.end method

.method public final e(I)V
    .registers 5

    .line 2
    iget v0, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->d0:I

    if-eq v0, p1, :cond_3a

    invoke-static {p0}, Lb/h/m/y;->K(Landroid/view/View;)Z

    move-result v0

    if-nez v0, :cond_b

    goto :goto_3a

    .line 3
    :cond_b
    iget-object v0, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->b0:Landroid/animation/Animator;

    if-eqz v0, :cond_12

    .line 4
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 5
    :cond_12
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 6
    iget v1, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->e0:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_20

    .line 7
    invoke-virtual {p0, p1, v0}, Lcom/google/android/material/bottomappbar/BottomAppBar;->b(ILjava/util/List;)V

    goto :goto_23

    .line 8
    :cond_20
    invoke-virtual {p0, p1, v0}, Lcom/google/android/material/bottomappbar/BottomAppBar;->a(ILjava/util/List;)V

    .line 9
    :goto_23
    new-instance p1, Landroid/animation/AnimatorSet;

    invoke-direct {p1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 10
    invoke-virtual {p1, v0}, Landroid/animation/AnimatorSet;->playTogether(Ljava/util/Collection;)V

    .line 11
    iput-object p1, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->b0:Landroid/animation/Animator;

    .line 12
    new-instance v0, Lcom/google/android/material/bottomappbar/BottomAppBar$d;

    invoke-direct {v0, p0}, Lcom/google/android/material/bottomappbar/BottomAppBar$d;-><init>(Lcom/google/android/material/bottomappbar/BottomAppBar;)V

    invoke-virtual {p1, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 13
    iget-object p1, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->b0:Landroid/animation/Animator;

    invoke-virtual {p1}, Landroid/animation/Animator;->start()V

    :cond_3a
    :goto_3a
    return-void
.end method

.method public f(I)V
    .registers 3

    if-eqz p1, :cond_f

    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->l0:I

    .line 3
    invoke-virtual {p0}, Landroidx/appcompat/widget/Toolbar;->getMenu()Landroid/view/Menu;

    move-result-object v0

    invoke-interface {v0}, Landroid/view/Menu;->clear()V

    .line 4
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/Toolbar;->c(I)V

    :cond_f
    return-void
.end method

.method public g(I)Z
    .registers 3

    int-to-float p1, p1

    .line 2
    invoke-direct {p0}, Lcom/google/android/material/bottomappbar/BottomAppBar;->getTopEdgeTreatment()Lc/a/a/a/p/a;

    move-result-object v0

    invoke-virtual {v0}, Lc/a/a/a/p/a;->f()F

    move-result v0

    cmpl-float v0, p1, v0

    if-eqz v0, :cond_1b

    .line 3
    invoke-direct {p0}, Lcom/google/android/material/bottomappbar/BottomAppBar;->getTopEdgeTreatment()Lc/a/a/a/p/a;

    move-result-object v0

    invoke-virtual {v0, p1}, Lc/a/a/a/p/a;->e(F)V

    .line 4
    iget-object p1, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->a0:Lc/a/a/a/l0/h;

    invoke-virtual {p1}, Lc/a/a/a/l0/h;->invalidateSelf()V

    const/4 p1, 0x1

    return p1

    :cond_1b
    const/4 p1, 0x0

    return p1
.end method

.method public getBackgroundTint()Landroid/content/res/ColorStateList;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->a0:Lc/a/a/a/l0/h;

    invoke-virtual {v0}, Lc/a/a/a/l0/h;->r()Landroid/content/res/ColorStateList;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getBehavior()Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;
    .registers 2

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/bottomappbar/BottomAppBar;->getBehavior()Lcom/google/android/material/bottomappbar/BottomAppBar$Behavior;

    move-result-object v0

    return-object v0
.end method

.method public getBehavior()Lcom/google/android/material/bottomappbar/BottomAppBar$Behavior;
    .registers 2

    .line 2
    iget-object v0, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->o0:Lcom/google/android/material/bottomappbar/BottomAppBar$Behavior;

    if-nez v0, :cond_b

    .line 3
    new-instance v0, Lcom/google/android/material/bottomappbar/BottomAppBar$Behavior;

    invoke-direct {v0}, Lcom/google/android/material/bottomappbar/BottomAppBar$Behavior;-><init>()V

    iput-object v0, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->o0:Lcom/google/android/material/bottomappbar/BottomAppBar$Behavior;

    .line 4
    :cond_b
    iget-object v0, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->o0:Lcom/google/android/material/bottomappbar/BottomAppBar$Behavior;

    return-object v0
.end method

.method public getCradleVerticalOffset()F
    .registers 2

    .line 1
    invoke-direct {p0}, Lcom/google/android/material/bottomappbar/BottomAppBar;->getTopEdgeTreatment()Lc/a/a/a/p/a;

    move-result-object v0

    invoke-virtual {v0}, Lc/a/a/a/p/a;->b()F

    move-result v0

    return v0
.end method

.method public getFabAlignmentMode()I
    .registers 2

    .line 1
    iget v0, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->d0:I

    return v0
.end method

.method public getFabAnimationMode()I
    .registers 2

    .line 1
    iget v0, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->e0:I

    return v0
.end method

.method public getFabCradleMargin()F
    .registers 2

    .line 1
    invoke-direct {p0}, Lcom/google/android/material/bottomappbar/BottomAppBar;->getTopEdgeTreatment()Lc/a/a/a/p/a;

    move-result-object v0

    invoke-virtual {v0}, Lc/a/a/a/p/a;->d()F

    move-result v0

    return v0
.end method

.method public getFabCradleRoundedCornerRadius()F
    .registers 2

    .line 1
    invoke-direct {p0}, Lcom/google/android/material/bottomappbar/BottomAppBar;->getTopEdgeTreatment()Lc/a/a/a/p/a;

    move-result-object v0

    invoke-virtual {v0}, Lc/a/a/a/p/a;->e()F

    move-result v0

    return v0
.end method

.method public getHideOnScroll()Z
    .registers 2

    .line 1
    iget-boolean v0, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->f0:Z

    return v0
.end method

.method public onAttachedToWindow()V
    .registers 3

    .line 1
    invoke-super {p0}, Landroid/view/ViewGroup;->onAttachedToWindow()V

    .line 2
    iget-object v0, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->a0:Lc/a/a/a/l0/h;

    invoke-static {p0, v0}, Lc/a/a/a/l0/i;->a(Landroid/view/View;Lc/a/a/a/l0/h;)V

    .line 3
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_1a

    .line 4
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    :cond_1a
    return-void
.end method

.method public onLayout(ZIIII)V
    .registers 6

    .line 1
    invoke-super/range {p0 .. p5}, Landroidx/appcompat/widget/Toolbar;->onLayout(ZIIII)V

    if-eqz p1, :cond_b

    .line 2
    invoke-virtual {p0}, Lcom/google/android/material/bottomappbar/BottomAppBar;->s()V

    .line 3
    invoke-virtual {p0}, Lcom/google/android/material/bottomappbar/BottomAppBar;->z()V

    .line 4
    :cond_b
    invoke-virtual {p0}, Lcom/google/android/material/bottomappbar/BottomAppBar;->y()V

    return-void
.end method

.method public onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 3

    .line 1
    instance-of v0, p1, Lcom/google/android/material/bottomappbar/BottomAppBar$SavedState;

    if-nez v0, :cond_8

    .line 2
    invoke-super {p0, p1}, Landroidx/appcompat/widget/Toolbar;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    return-void

    .line 3
    :cond_8
    check-cast p1, Lcom/google/android/material/bottomappbar/BottomAppBar$SavedState;

    .line 4
    invoke-virtual {p1}, Landroidx/customview/view/AbsSavedState;->e()Landroid/os/Parcelable;

    move-result-object v0

    invoke-super {p0, v0}, Landroidx/appcompat/widget/Toolbar;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 5
    iget v0, p1, Lcom/google/android/material/bottomappbar/BottomAppBar$SavedState;->j:I

    iput v0, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->d0:I

    .line 6
    iget-boolean p1, p1, Lcom/google/android/material/bottomappbar/BottomAppBar$SavedState;->k:Z

    iput-boolean p1, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->n0:Z

    return-void
.end method

.method public onSaveInstanceState()Landroid/os/Parcelable;
    .registers 3

    .line 1
    invoke-super {p0}, Landroidx/appcompat/widget/Toolbar;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v0

    .line 2
    new-instance v1, Lcom/google/android/material/bottomappbar/BottomAppBar$SavedState;

    invoke-direct {v1, v0}, Lcom/google/android/material/bottomappbar/BottomAppBar$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 3
    iget v0, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->d0:I

    iput v0, v1, Lcom/google/android/material/bottomappbar/BottomAppBar$SavedState;->j:I

    .line 4
    iget-boolean v0, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->n0:Z

    iput-boolean v0, v1, Lcom/google/android/material/bottomappbar/BottomAppBar$SavedState;->k:Z

    return-object v1
.end method

.method public final s()V
    .registers 2

    .line 2
    iget-object v0, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->c0:Landroid/animation/Animator;

    if-eqz v0, :cond_7

    .line 3
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 4
    :cond_7
    iget-object v0, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->b0:Landroid/animation/Animator;

    if-eqz v0, :cond_e

    .line 5
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    :cond_e
    return-void
.end method

.method public setBackgroundTint(Landroid/content/res/ColorStateList;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->a0:Lc/a/a/a/l0/h;

    invoke-static {v0, p1}, Lb/h/f/l/a;->a(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public setCradleVerticalOffset(F)V
    .registers 3

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/bottomappbar/BottomAppBar;->getCradleVerticalOffset()F

    move-result v0

    cmpl-float v0, p1, v0

    if-eqz v0, :cond_17

    .line 2
    invoke-direct {p0}, Lcom/google/android/material/bottomappbar/BottomAppBar;->getTopEdgeTreatment()Lc/a/a/a/p/a;

    move-result-object v0

    invoke-virtual {v0, p1}, Lc/a/a/a/p/a;->a(F)V

    .line 3
    iget-object p1, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->a0:Lc/a/a/a/l0/h;

    invoke-virtual {p1}, Lc/a/a/a/l0/h;->invalidateSelf()V

    .line 4
    invoke-virtual {p0}, Lcom/google/android/material/bottomappbar/BottomAppBar;->z()V

    :cond_17
    return-void
.end method

.method public setElevation(F)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->a0:Lc/a/a/a/l0/h;

    invoke-virtual {v0, p1}, Lc/a/a/a/l0/h;->b(F)V

    .line 2
    iget-object p1, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->a0:Lc/a/a/a/l0/h;

    .line 3
    invoke-virtual {p1}, Lc/a/a/a/l0/h;->m()I

    move-result p1

    iget-object v0, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->a0:Lc/a/a/a/l0/h;

    invoke-virtual {v0}, Lc/a/a/a/l0/h;->l()I

    move-result v0

    sub-int/2addr p1, v0

    .line 4
    invoke-virtual {p0}, Lcom/google/android/material/bottomappbar/BottomAppBar;->getBehavior()Lcom/google/android/material/bottomappbar/BottomAppBar$Behavior;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/google/android/material/behavior/HideBottomViewOnScrollBehavior;->a(Landroid/view/View;I)V

    return-void
.end method

.method public setFabAlignmentMode(I)V
    .registers 3

    const/4 v0, 0x0

    .line 1
    invoke-virtual {p0, p1, v0}, Lcom/google/android/material/bottomappbar/BottomAppBar;->b(II)V

    return-void
.end method

.method public setFabAnimationMode(I)V
    .registers 2

    .line 1
    iput p1, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->e0:I

    return-void
.end method

.method public setFabCornerSize(F)V
    .registers 3

    .line 1
    invoke-direct {p0}, Lcom/google/android/material/bottomappbar/BottomAppBar;->getTopEdgeTreatment()Lc/a/a/a/p/a;

    move-result-object v0

    invoke-virtual {v0}, Lc/a/a/a/p/a;->c()F

    move-result v0

    cmpl-float v0, p1, v0

    if-eqz v0, :cond_18

    .line 2
    invoke-direct {p0}, Lcom/google/android/material/bottomappbar/BottomAppBar;->getTopEdgeTreatment()Lc/a/a/a/p/a;

    move-result-object v0

    invoke-virtual {v0, p1}, Lc/a/a/a/p/a;->b(F)V

    .line 3
    iget-object p1, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->a0:Lc/a/a/a/l0/h;

    invoke-virtual {p1}, Lc/a/a/a/l0/h;->invalidateSelf()V

    :cond_18
    return-void
.end method

.method public setFabCradleMargin(F)V
    .registers 3

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/bottomappbar/BottomAppBar;->getFabCradleMargin()F

    move-result v0

    cmpl-float v0, p1, v0

    if-eqz v0, :cond_14

    .line 2
    invoke-direct {p0}, Lcom/google/android/material/bottomappbar/BottomAppBar;->getTopEdgeTreatment()Lc/a/a/a/p/a;

    move-result-object v0

    invoke-virtual {v0, p1}, Lc/a/a/a/p/a;->c(F)V

    .line 3
    iget-object p1, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->a0:Lc/a/a/a/l0/h;

    invoke-virtual {p1}, Lc/a/a/a/l0/h;->invalidateSelf()V

    :cond_14
    return-void
.end method

.method public setFabCradleRoundedCornerRadius(F)V
    .registers 3

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/bottomappbar/BottomAppBar;->getFabCradleRoundedCornerRadius()F

    move-result v0

    cmpl-float v0, p1, v0

    if-eqz v0, :cond_14

    .line 2
    invoke-direct {p0}, Lcom/google/android/material/bottomappbar/BottomAppBar;->getTopEdgeTreatment()Lc/a/a/a/p/a;

    move-result-object v0

    invoke-virtual {v0, p1}, Lc/a/a/a/p/a;->d(F)V

    .line 3
    iget-object p1, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->a0:Lc/a/a/a/l0/h;

    invoke-virtual {p1}, Lc/a/a/a/l0/h;->invalidateSelf()V

    :cond_14
    return-void
.end method

.method public setHideOnScroll(Z)V
    .registers 2

    .line 1
    iput-boolean p1, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->f0:Z

    return-void
.end method

.method public setSubtitle(Ljava/lang/CharSequence;)V
    .registers 2

    return-void
.end method

.method public setTitle(Ljava/lang/CharSequence;)V
    .registers 2

    return-void
.end method

.method public final t()V
    .registers 3

    .line 2
    iget v0, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->j0:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->j0:I

    if-nez v0, :cond_20

    iget-object v0, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->k0:Ljava/util/ArrayList;

    if-eqz v0, :cond_20

    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_10
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_20

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/material/bottomappbar/BottomAppBar$j;

    .line 4
    invoke-interface {v1, p0}, Lcom/google/android/material/bottomappbar/BottomAppBar$j;->a(Lcom/google/android/material/bottomappbar/BottomAppBar;)V

    goto :goto_10

    :cond_20
    return-void
.end method

.method public final u()V
    .registers 3

    .line 2
    iget v0, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->j0:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->j0:I

    if-nez v0, :cond_20

    iget-object v0, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->k0:Ljava/util/ArrayList;

    if-eqz v0, :cond_20

    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_10
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_20

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/material/bottomappbar/BottomAppBar$j;

    .line 4
    invoke-interface {v1, p0}, Lcom/google/android/material/bottomappbar/BottomAppBar$j;->b(Lcom/google/android/material/bottomappbar/BottomAppBar;)V

    goto :goto_10

    :cond_20
    return-void
.end method

.method public final v()Lcom/google/android/material/floatingactionbutton/FloatingActionButton;
    .registers 3

    .line 2
    invoke-virtual {p0}, Lcom/google/android/material/bottomappbar/BottomAppBar;->w()Landroid/view/View;

    move-result-object v0

    .line 3
    instance-of v1, v0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    if-eqz v1, :cond_b

    check-cast v0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    goto :goto_c

    :cond_b
    const/4 v0, 0x0

    :goto_c
    return-object v0
.end method

.method public final w()Landroid/view/View;
    .registers 5

    .line 2
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    const/4 v1, 0x0

    if-nez v0, :cond_a

    return-object v1

    .line 3
    :cond_a
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    invoke-virtual {v0, p0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->c(Landroid/view/View;)Ljava/util/List;

    move-result-object v0

    .line 4
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_18
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2d

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    .line 5
    instance-of v3, v2, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    if-nez v3, :cond_2c

    instance-of v3, v2, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;

    if-eqz v3, :cond_18

    :cond_2c
    return-object v2

    :cond_2d
    return-object v1
.end method

.method public final x()Z
    .registers 2

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/bottomappbar/BottomAppBar;->v()Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    move-result-object v0

    if-eqz v0, :cond_e

    .line 2
    invoke-virtual {v0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->d()Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    goto :goto_f

    :cond_e
    const/4 v0, 0x0

    :goto_f
    return v0
.end method

.method public final y()V
    .registers 4

    .line 1
    invoke-direct {p0}, Lcom/google/android/material/bottomappbar/BottomAppBar;->getActionMenuView()Landroidx/appcompat/widget/ActionMenuView;

    move-result-object v0

    if-eqz v0, :cond_21

    .line 2
    iget-object v1, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->c0:Landroid/animation/Animator;

    if-nez v1, :cond_21

    const/high16 v1, 0x3f800000    # 1.0f

    .line 3
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setAlpha(F)V

    .line 4
    invoke-virtual {p0}, Lcom/google/android/material/bottomappbar/BottomAppBar;->x()Z

    move-result v1

    if-nez v1, :cond_1a

    const/4 v1, 0x0

    .line 5
    invoke-virtual {p0, v0, v1, v1}, Lcom/google/android/material/bottomappbar/BottomAppBar;->b(Landroidx/appcompat/widget/ActionMenuView;IZ)V

    goto :goto_21

    .line 6
    :cond_1a
    iget v1, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->d0:I

    iget-boolean v2, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->n0:Z

    invoke-virtual {p0, v0, v1, v2}, Lcom/google/android/material/bottomappbar/BottomAppBar;->b(Landroidx/appcompat/widget/ActionMenuView;IZ)V

    :cond_21
    :goto_21
    return-void
.end method

.method public final z()V
    .registers 4

    .line 1
    invoke-direct {p0}, Lcom/google/android/material/bottomappbar/BottomAppBar;->getTopEdgeTreatment()Lc/a/a/a/p/a;

    move-result-object v0

    invoke-direct {p0}, Lcom/google/android/material/bottomappbar/BottomAppBar;->getFabTranslationX()F

    move-result v1

    invoke-virtual {v0, v1}, Lc/a/a/a/p/a;->f(F)V

    .line 2
    invoke-virtual {p0}, Lcom/google/android/material/bottomappbar/BottomAppBar;->w()Landroid/view/View;

    move-result-object v0

    .line 3
    iget-object v1, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->a0:Lc/a/a/a/l0/h;

    iget-boolean v2, p0, Lcom/google/android/material/bottomappbar/BottomAppBar;->n0:Z

    if-eqz v2, :cond_1e

    invoke-virtual {p0}, Lcom/google/android/material/bottomappbar/BottomAppBar;->x()Z

    move-result v2

    if-eqz v2, :cond_1e

    const/high16 v2, 0x3f800000    # 1.0f

    goto :goto_1f

    :cond_1e
    const/4 v2, 0x0

    :goto_1f
    invoke-virtual {v1, v2}, Lc/a/a/a/l0/h;->c(F)V

    if-eqz v0, :cond_32

    .line 4
    invoke-direct {p0}, Lcom/google/android/material/bottomappbar/BottomAppBar;->getFabTranslationY()F

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 5
    invoke-direct {p0}, Lcom/google/android/material/bottomappbar/BottomAppBar;->getFabTranslationX()F

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationX(F)V

    :cond_32
    return-void
.end method
