.class public Lc/a/a/a/c0/d;
.super Ljava/lang/Object;
.source "FloatingActionButtonImpl.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lc/a/a/a/c0/d$f;,
        Lc/a/a/a/c0/d$h;,
        Lc/a/a/a/c0/d$g;,
        Lc/a/a/a/c0/d$k;,
        Lc/a/a/a/c0/d$l;,
        Lc/a/a/a/c0/d$j;,
        Lc/a/a/a/c0/d$i;
    }
.end annotation


# static fields
.field public static final F:Landroid/animation/TimeInterpolator;

.field public static final G:[I

.field public static final H:[I

.field public static final I:[I

.field public static final J:[I

.field public static final K:[I

.field public static final L:[I


# instance fields
.field public final A:Landroid/graphics/Rect;

.field public final B:Landroid/graphics/RectF;

.field public final C:Landroid/graphics/RectF;

.field public final D:Landroid/graphics/Matrix;

.field public E:Landroid/view/ViewTreeObserver$OnPreDrawListener;

.field public a:Lc/a/a/a/l0/m;

.field public b:Lc/a/a/a/l0/h;

.field public c:Landroid/graphics/drawable/Drawable;

.field public d:Lc/a/a/a/c0/c;

.field public e:Landroid/graphics/drawable/Drawable;

.field public f:Z

.field public g:Z

.field public h:F

.field public i:F

.field public j:F

.field public k:I

.field public final l:Lc/a/a/a/d0/h;

.field public m:Lc/a/a/a/m/h;

.field public n:Lc/a/a/a/m/h;

.field public o:Landroid/animation/Animator;

.field public p:Lc/a/a/a/m/h;

.field public q:Lc/a/a/a/m/h;

.field public r:F

.field public s:F

.field public t:I

.field public u:I

.field public v:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/animation/Animator$AnimatorListener;",
            ">;"
        }
    .end annotation
.end field

.field public w:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/animation/Animator$AnimatorListener;",
            ">;"
        }
    .end annotation
.end field

.field public x:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lc/a/a/a/c0/d$i;",
            ">;"
        }
    .end annotation
.end field

.field public final y:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

.field public final z:Lc/a/a/a/k0/b;


# direct methods
.method public static constructor <clinit>()V
    .registers 3

    .line 1
    sget-object v0, Lc/a/a/a/m/a;->c:Landroid/animation/TimeInterpolator;

    sput-object v0, Lc/a/a/a/c0/d;->F:Landroid/animation/TimeInterpolator;

    const/4 v0, 0x2

    new-array v1, v0, [I

    .line 2
    fill-array-data v1, :array_32

    sput-object v1, Lc/a/a/a/c0/d;->G:[I

    const/4 v1, 0x3

    new-array v1, v1, [I

    .line 3
    fill-array-data v1, :array_3a

    sput-object v1, Lc/a/a/a/c0/d;->H:[I

    new-array v1, v0, [I

    .line 4
    fill-array-data v1, :array_44

    sput-object v1, Lc/a/a/a/c0/d;->I:[I

    new-array v0, v0, [I

    .line 5
    fill-array-data v0, :array_4c

    sput-object v0, Lc/a/a/a/c0/d;->J:[I

    const/4 v0, 0x1

    new-array v0, v0, [I

    const v1, 0x101009e

    const/4 v2, 0x0

    aput v1, v0, v2

    .line 6
    sput-object v0, Lc/a/a/a/c0/d;->K:[I

    new-array v0, v2, [I

    .line 7
    sput-object v0, Lc/a/a/a/c0/d;->L:[I

    return-void

    :array_32
    .array-data 4
        0x10100a7
        0x101009e
    .end array-data

    :array_3a
    .array-data 4
        0x1010367
        0x101009c
        0x101009e
    .end array-data

    :array_44
    .array-data 4
        0x101009c
        0x101009e
    .end array-data

    :array_4c
    .array-data 4
        0x1010367
        0x101009e
    .end array-data
.end method

.method public constructor <init>(Lcom/google/android/material/floatingactionbutton/FloatingActionButton;Lc/a/a/a/k0/b;)V
    .registers 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lc/a/a/a/c0/d;->g:Z

    const/high16 v0, 0x3f800000    # 1.0f

    .line 3
    iput v0, p0, Lc/a/a/a/c0/d;->s:F

    const/4 v0, 0x0

    .line 4
    iput v0, p0, Lc/a/a/a/c0/d;->u:I

    .line 5
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lc/a/a/a/c0/d;->A:Landroid/graphics/Rect;

    .line 6
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lc/a/a/a/c0/d;->B:Landroid/graphics/RectF;

    .line 7
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lc/a/a/a/c0/d;->C:Landroid/graphics/RectF;

    .line 8
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lc/a/a/a/c0/d;->D:Landroid/graphics/Matrix;

    .line 9
    iput-object p1, p0, Lc/a/a/a/c0/d;->y:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    .line 10
    iput-object p2, p0, Lc/a/a/a/c0/d;->z:Lc/a/a/a/k0/b;

    .line 11
    new-instance p1, Lc/a/a/a/d0/h;

    invoke-direct {p1}, Lc/a/a/a/d0/h;-><init>()V

    iput-object p1, p0, Lc/a/a/a/c0/d;->l:Lc/a/a/a/d0/h;

    .line 12
    sget-object p2, Lc/a/a/a/c0/d;->G:[I

    new-instance v0, Lc/a/a/a/c0/d$h;

    invoke-direct {v0, p0}, Lc/a/a/a/c0/d$h;-><init>(Lc/a/a/a/c0/d;)V

    .line 13
    invoke-virtual {p0, v0}, Lc/a/a/a/c0/d;->a(Lc/a/a/a/c0/d$l;)Landroid/animation/ValueAnimator;

    move-result-object v0

    .line 14
    invoke-virtual {p1, p2, v0}, Lc/a/a/a/d0/h;->a([ILandroid/animation/ValueAnimator;)V

    .line 15
    iget-object p1, p0, Lc/a/a/a/c0/d;->l:Lc/a/a/a/d0/h;

    sget-object p2, Lc/a/a/a/c0/d;->H:[I

    new-instance v0, Lc/a/a/a/c0/d$g;

    invoke-direct {v0, p0}, Lc/a/a/a/c0/d$g;-><init>(Lc/a/a/a/c0/d;)V

    .line 16
    invoke-virtual {p0, v0}, Lc/a/a/a/c0/d;->a(Lc/a/a/a/c0/d$l;)Landroid/animation/ValueAnimator;

    move-result-object v0

    .line 17
    invoke-virtual {p1, p2, v0}, Lc/a/a/a/d0/h;->a([ILandroid/animation/ValueAnimator;)V

    .line 18
    iget-object p1, p0, Lc/a/a/a/c0/d;->l:Lc/a/a/a/d0/h;

    sget-object p2, Lc/a/a/a/c0/d;->I:[I

    new-instance v0, Lc/a/a/a/c0/d$g;

    invoke-direct {v0, p0}, Lc/a/a/a/c0/d$g;-><init>(Lc/a/a/a/c0/d;)V

    .line 19
    invoke-virtual {p0, v0}, Lc/a/a/a/c0/d;->a(Lc/a/a/a/c0/d$l;)Landroid/animation/ValueAnimator;

    move-result-object v0

    .line 20
    invoke-virtual {p1, p2, v0}, Lc/a/a/a/d0/h;->a([ILandroid/animation/ValueAnimator;)V

    .line 21
    iget-object p1, p0, Lc/a/a/a/c0/d;->l:Lc/a/a/a/d0/h;

    sget-object p2, Lc/a/a/a/c0/d;->J:[I

    new-instance v0, Lc/a/a/a/c0/d$g;

    invoke-direct {v0, p0}, Lc/a/a/a/c0/d$g;-><init>(Lc/a/a/a/c0/d;)V

    .line 22
    invoke-virtual {p0, v0}, Lc/a/a/a/c0/d;->a(Lc/a/a/a/c0/d$l;)Landroid/animation/ValueAnimator;

    move-result-object v0

    .line 23
    invoke-virtual {p1, p2, v0}, Lc/a/a/a/d0/h;->a([ILandroid/animation/ValueAnimator;)V

    .line 24
    iget-object p1, p0, Lc/a/a/a/c0/d;->l:Lc/a/a/a/d0/h;

    sget-object p2, Lc/a/a/a/c0/d;->K:[I

    new-instance v0, Lc/a/a/a/c0/d$k;

    invoke-direct {v0, p0}, Lc/a/a/a/c0/d$k;-><init>(Lc/a/a/a/c0/d;)V

    .line 25
    invoke-virtual {p0, v0}, Lc/a/a/a/c0/d;->a(Lc/a/a/a/c0/d$l;)Landroid/animation/ValueAnimator;

    move-result-object v0

    .line 26
    invoke-virtual {p1, p2, v0}, Lc/a/a/a/d0/h;->a([ILandroid/animation/ValueAnimator;)V

    .line 27
    iget-object p1, p0, Lc/a/a/a/c0/d;->l:Lc/a/a/a/d0/h;

    sget-object p2, Lc/a/a/a/c0/d;->L:[I

    new-instance v0, Lc/a/a/a/c0/d$f;

    invoke-direct {v0, p0}, Lc/a/a/a/c0/d$f;-><init>(Lc/a/a/a/c0/d;)V

    .line 28
    invoke-virtual {p0, v0}, Lc/a/a/a/c0/d;->a(Lc/a/a/a/c0/d$l;)Landroid/animation/ValueAnimator;

    move-result-object v0

    .line 29
    invoke-virtual {p1, p2, v0}, Lc/a/a/a/d0/h;->a([ILandroid/animation/ValueAnimator;)V

    .line 30
    iget-object p1, p0, Lc/a/a/a/c0/d;->y:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    invoke-virtual {p1}, Landroid/widget/ImageButton;->getRotation()F

    move-result p1

    iput p1, p0, Lc/a/a/a/c0/d;->r:F

    return-void
.end method

.method public static synthetic a(Lc/a/a/a/c0/d;F)F
    .registers 2

    .line 3
    iput p1, p0, Lc/a/a/a/c0/d;->s:F

    return p1
.end method

.method public static synthetic a(Lc/a/a/a/c0/d;I)I
    .registers 2

    .line 1
    iput p1, p0, Lc/a/a/a/c0/d;->u:I

    return p1
.end method

.method public static synthetic a(Lc/a/a/a/c0/d;Landroid/animation/Animator;)Landroid/animation/Animator;
    .registers 2

    .line 2
    iput-object p1, p0, Lc/a/a/a/c0/d;->o:Landroid/animation/Animator;

    return-object p1
.end method


# virtual methods
.method public final A()V
    .registers 2

    .line 1
    iget v0, p0, Lc/a/a/a/c0/d;->s:F

    invoke-virtual {p0, v0}, Lc/a/a/a/c0/d;->c(F)V

    return-void
.end method

.method public final B()V
    .registers 6

    .line 1
    iget-object v0, p0, Lc/a/a/a/c0/d;->A:Landroid/graphics/Rect;

    .line 2
    invoke-virtual {p0, v0}, Lc/a/a/a/c0/d;->a(Landroid/graphics/Rect;)V

    .line 3
    invoke-virtual {p0, v0}, Lc/a/a/a/c0/d;->b(Landroid/graphics/Rect;)V

    .line 4
    iget-object v1, p0, Lc/a/a/a/c0/d;->z:Lc/a/a/a/k0/b;

    iget v2, v0, Landroid/graphics/Rect;->left:I

    iget v3, v0, Landroid/graphics/Rect;->top:I

    iget v4, v0, Landroid/graphics/Rect;->right:I

    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    invoke-interface {v1, v2, v3, v4, v0}, Lc/a/a/a/k0/b;->a(IIII)V

    return-void
.end method

.method public final a(Lc/a/a/a/m/h;FFF)Landroid/animation/AnimatorSet;
    .registers 11

    .line 66
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 67
    iget-object v1, p0, Lc/a/a/a/c0/d;->y:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    sget-object v2, Landroid/view/View;->ALPHA:Landroid/util/Property;

    const/4 v3, 0x1

    new-array v4, v3, [F

    const/4 v5, 0x0

    aput p2, v4, v5

    invoke-static {v1, v2, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object p2

    const-string v1, "opacity"

    .line 68
    invoke-virtual {p1, v1}, Lc/a/a/a/m/h;->b(Ljava/lang/String;)Lc/a/a/a/m/i;

    move-result-object v1

    invoke-virtual {v1, p2}, Lc/a/a/a/m/i;->a(Landroid/animation/Animator;)V

    .line 69
    invoke-interface {v0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 70
    iget-object p2, p0, Lc/a/a/a/c0/d;->y:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    sget-object v1, Landroid/view/View;->SCALE_X:Landroid/util/Property;

    new-array v2, v3, [F

    aput p3, v2, v5

    invoke-static {p2, v1, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object p2

    const-string v1, "scale"

    .line 71
    invoke-virtual {p1, v1}, Lc/a/a/a/m/h;->b(Ljava/lang/String;)Lc/a/a/a/m/i;

    move-result-object v2

    invoke-virtual {v2, p2}, Lc/a/a/a/m/i;->a(Landroid/animation/Animator;)V

    .line 72
    invoke-virtual {p0, p2}, Lc/a/a/a/c0/d;->a(Landroid/animation/ObjectAnimator;)V

    .line 73
    invoke-interface {v0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 74
    iget-object p2, p0, Lc/a/a/a/c0/d;->y:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    sget-object v2, Landroid/view/View;->SCALE_Y:Landroid/util/Property;

    new-array v4, v3, [F

    aput p3, v4, v5

    invoke-static {p2, v2, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object p2

    .line 75
    invoke-virtual {p1, v1}, Lc/a/a/a/m/h;->b(Ljava/lang/String;)Lc/a/a/a/m/i;

    move-result-object p3

    invoke-virtual {p3, p2}, Lc/a/a/a/m/i;->a(Landroid/animation/Animator;)V

    .line 76
    invoke-virtual {p0, p2}, Lc/a/a/a/c0/d;->a(Landroid/animation/ObjectAnimator;)V

    .line 77
    invoke-interface {v0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 78
    iget-object p2, p0, Lc/a/a/a/c0/d;->D:Landroid/graphics/Matrix;

    invoke-virtual {p0, p4, p2}, Lc/a/a/a/c0/d;->a(FLandroid/graphics/Matrix;)V

    .line 79
    iget-object p2, p0, Lc/a/a/a/c0/d;->y:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    new-instance p3, Lc/a/a/a/m/f;

    invoke-direct {p3}, Lc/a/a/a/m/f;-><init>()V

    new-instance p4, Lc/a/a/a/c0/d$c;

    invoke-direct {p4, p0}, Lc/a/a/a/c0/d$c;-><init>(Lc/a/a/a/c0/d;)V

    new-array v1, v3, [Landroid/graphics/Matrix;

    new-instance v2, Landroid/graphics/Matrix;

    iget-object v3, p0, Lc/a/a/a/c0/d;->D:Landroid/graphics/Matrix;

    invoke-direct {v2, v3}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    aput-object v2, v1, v5

    .line 80
    invoke-static {p2, p3, p4, v1}, Landroid/animation/ObjectAnimator;->ofObject(Ljava/lang/Object;Landroid/util/Property;Landroid/animation/TypeEvaluator;[Ljava/lang/Object;)Landroid/animation/ObjectAnimator;

    move-result-object p2

    const-string p3, "iconScale"

    .line 81
    invoke-virtual {p1, p3}, Lc/a/a/a/m/h;->b(Ljava/lang/String;)Lc/a/a/a/m/i;

    move-result-object p1

    invoke-virtual {p1, p2}, Lc/a/a/a/m/i;->a(Landroid/animation/Animator;)V

    .line 82
    invoke-interface {v0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 83
    new-instance p1, Landroid/animation/AnimatorSet;

    invoke-direct {p1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 84
    invoke-static {p1, v0}, Lc/a/a/a/m/b;->a(Landroid/animation/AnimatorSet;Ljava/util/List;)V

    return-object p1
.end method

.method public final a(Lc/a/a/a/c0/d$l;)Landroid/animation/ValueAnimator;
    .registers 5

    .line 98
    new-instance v0, Landroid/animation/ValueAnimator;

    invoke-direct {v0}, Landroid/animation/ValueAnimator;-><init>()V

    .line 99
    sget-object v1, Lc/a/a/a/c0/d;->F:Landroid/animation/TimeInterpolator;

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    const-wide/16 v1, 0x64

    .line 100
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 101
    invoke-virtual {v0, p1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 102
    invoke-virtual {v0, p1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    const/4 p1, 0x2

    new-array p1, p1, [F

    .line 103
    fill-array-data p1, :array_20

    invoke-virtual {v0, p1}, Landroid/animation/ValueAnimator;->setFloatValues([F)V

    return-object v0

    nop

    :array_20
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public a()Lc/a/a/a/l0/h;
    .registers 3

    .line 96
    iget-object v0, p0, Lc/a/a/a/c0/d;->a:Lc/a/a/a/l0/m;

    invoke-static {v0}, Lb/h/l/h;->a(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast v0, Lc/a/a/a/l0/m;

    .line 97
    new-instance v1, Lc/a/a/a/l0/h;

    invoke-direct {v1, v0}, Lc/a/a/a/l0/h;-><init>(Lc/a/a/a/l0/m;)V

    return-object v1
.end method

.method public final a(F)V
    .registers 4

    .line 22
    iget v0, p0, Lc/a/a/a/c0/d;->h:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_f

    .line 23
    iput p1, p0, Lc/a/a/a/c0/d;->h:F

    .line 24
    iget v0, p0, Lc/a/a/a/c0/d;->i:F

    iget v1, p0, Lc/a/a/a/c0/d;->j:F

    invoke-virtual {p0, p1, v0, v1}, Lc/a/a/a/c0/d;->a(FFF)V

    :cond_f
    return-void
.end method

.method public a(FFF)V
    .registers 4

    .line 46
    invoke-virtual {p0}, Lc/a/a/a/c0/d;->B()V

    .line 47
    invoke-virtual {p0, p1}, Lc/a/a/a/c0/d;->e(F)V

    return-void
.end method

.method public final a(FLandroid/graphics/Matrix;)V
    .registers 8

    .line 28
    invoke-virtual {p2}, Landroid/graphics/Matrix;->reset()V

    .line 29
    iget-object v0, p0, Lc/a/a/a/c0/d;->y:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    invoke-virtual {v0}, Landroid/widget/ImageButton;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_38

    .line 30
    iget v1, p0, Lc/a/a/a/c0/d;->t:I

    if-eqz v1, :cond_38

    .line 31
    iget-object v1, p0, Lc/a/a/a/c0/d;->B:Landroid/graphics/RectF;

    .line 32
    iget-object v2, p0, Lc/a/a/a/c0/d;->C:Landroid/graphics/RectF;

    .line 33
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v0

    int-to-float v0, v0

    const/4 v4, 0x0

    invoke-virtual {v1, v4, v4, v3, v0}, Landroid/graphics/RectF;->set(FFFF)V

    .line 34
    iget v0, p0, Lc/a/a/a/c0/d;->t:I

    int-to-float v3, v0

    int-to-float v0, v0

    invoke-virtual {v2, v4, v4, v3, v0}, Landroid/graphics/RectF;->set(FFFF)V

    .line 35
    sget-object v0, Landroid/graphics/Matrix$ScaleToFit;->CENTER:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {p2, v1, v2, v0}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    .line 36
    iget v0, p0, Lc/a/a/a/c0/d;->t:I

    int-to-float v1, v0

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v1, v2

    int-to-float v0, v0

    div-float/2addr v0, v2

    invoke-virtual {p2, p1, p1, v1, v0}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    :cond_38
    return-void
.end method

.method public final a(I)V
    .registers 3

    .line 25
    iget v0, p0, Lc/a/a/a/c0/d;->t:I

    if-eq v0, p1, :cond_9

    .line 26
    iput p1, p0, Lc/a/a/a/c0/d;->t:I

    .line 27
    invoke-virtual {p0}, Lc/a/a/a/c0/d;->A()V

    :cond_9
    return-void
.end method

.method public a(Landroid/animation/Animator$AnimatorListener;)V
    .registers 3

    .line 49
    iget-object v0, p0, Lc/a/a/a/c0/d;->w:Ljava/util/ArrayList;

    if-nez v0, :cond_b

    .line 50
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lc/a/a/a/c0/d;->w:Ljava/util/ArrayList;

    .line 51
    :cond_b
    iget-object v0, p0, Lc/a/a/a/c0/d;->w:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final a(Landroid/animation/ObjectAnimator;)V
    .registers 4

    .line 85
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-eq v0, v1, :cond_7

    return-void

    .line 86
    :cond_7
    new-instance v0, Lc/a/a/a/c0/d$d;

    invoke-direct {v0, p0}, Lc/a/a/a/c0/d$d;-><init>(Lc/a/a/a/c0/d;)V

    invoke-virtual {p1, v0}, Landroid/animation/ObjectAnimator;->setEvaluator(Landroid/animation/TypeEvaluator;)V

    return-void
.end method

.method public a(Landroid/content/res/ColorStateList;)V
    .registers 3

    .line 16
    iget-object v0, p0, Lc/a/a/a/c0/d;->b:Lc/a/a/a/l0/h;

    if-eqz v0, :cond_7

    .line 17
    invoke-virtual {v0, p1}, Lc/a/a/a/l0/h;->setTintList(Landroid/content/res/ColorStateList;)V

    .line 18
    :cond_7
    iget-object v0, p0, Lc/a/a/a/c0/d;->d:Lc/a/a/a/c0/c;

    if-eqz v0, :cond_e

    .line 19
    invoke-virtual {v0, p1}, Lc/a/a/a/c0/c;->a(Landroid/content/res/ColorStateList;)V

    :cond_e
    return-void
.end method

.method public a(Landroid/content/res/ColorStateList;Landroid/graphics/PorterDuff$Mode;Landroid/content/res/ColorStateList;I)V
    .registers 5

    .line 4
    invoke-virtual {p0}, Lc/a/a/a/c0/d;->a()Lc/a/a/a/l0/h;

    move-result-object p4

    iput-object p4, p0, Lc/a/a/a/c0/d;->b:Lc/a/a/a/l0/h;

    .line 5
    invoke-virtual {p4, p1}, Lc/a/a/a/l0/h;->setTintList(Landroid/content/res/ColorStateList;)V

    if-eqz p2, :cond_10

    .line 6
    iget-object p1, p0, Lc/a/a/a/c0/d;->b:Lc/a/a/a/l0/h;

    invoke-virtual {p1, p2}, Lc/a/a/a/l0/h;->setTintMode(Landroid/graphics/PorterDuff$Mode;)V

    .line 7
    :cond_10
    iget-object p1, p0, Lc/a/a/a/c0/d;->b:Lc/a/a/a/l0/h;

    const p2, -0xbbbbbc

    invoke-virtual {p1, p2}, Lc/a/a/a/l0/h;->b(I)V

    .line 8
    iget-object p1, p0, Lc/a/a/a/c0/d;->b:Lc/a/a/a/l0/h;

    iget-object p2, p0, Lc/a/a/a/c0/d;->y:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    invoke-virtual {p2}, Landroid/widget/ImageButton;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p1, p2}, Lc/a/a/a/l0/h;->a(Landroid/content/Context;)V

    .line 9
    new-instance p1, Lc/a/a/a/j0/a;

    iget-object p2, p0, Lc/a/a/a/c0/d;->b:Lc/a/a/a/l0/h;

    .line 10
    invoke-virtual {p2}, Lc/a/a/a/l0/h;->n()Lc/a/a/a/l0/m;

    move-result-object p2

    invoke-direct {p1, p2}, Lc/a/a/a/j0/a;-><init>(Lc/a/a/a/l0/m;)V

    .line 11
    invoke-static {p3}, Lc/a/a/a/j0/b;->b(Landroid/content/res/ColorStateList;)Landroid/content/res/ColorStateList;

    move-result-object p2

    invoke-virtual {p1, p2}, Lc/a/a/a/j0/a;->setTintList(Landroid/content/res/ColorStateList;)V

    .line 12
    iput-object p1, p0, Lc/a/a/a/c0/d;->c:Landroid/graphics/drawable/Drawable;

    const/4 p2, 0x2

    new-array p2, p2, [Landroid/graphics/drawable/Drawable;

    const/4 p3, 0x0

    .line 13
    iget-object p4, p0, Lc/a/a/a/c0/d;->b:Lc/a/a/a/l0/h;

    .line 14
    invoke-static {p4}, Lb/h/l/h;->a(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast p4, Landroid/graphics/drawable/Drawable;

    aput-object p4, p2, p3

    const/4 p3, 0x1

    aput-object p1, p2, p3

    .line 15
    new-instance p1, Landroid/graphics/drawable/LayerDrawable;

    invoke-direct {p1, p2}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    iput-object p1, p0, Lc/a/a/a/c0/d;->e:Landroid/graphics/drawable/Drawable;

    return-void
.end method

.method public a(Landroid/graphics/PorterDuff$Mode;)V
    .registers 3

    .line 20
    iget-object v0, p0, Lc/a/a/a/c0/d;->b:Lc/a/a/a/l0/h;

    if-eqz v0, :cond_7

    .line 21
    invoke-virtual {v0, p1}, Lc/a/a/a/l0/h;->setTintMode(Landroid/graphics/PorterDuff$Mode;)V

    :cond_7
    return-void
.end method

.method public a(Landroid/graphics/Rect;)V
    .registers 7

    .line 90
    iget-boolean v0, p0, Lc/a/a/a/c0/d;->f:Z

    if-eqz v0, :cond_10

    iget v0, p0, Lc/a/a/a/c0/d;->k:I

    iget-object v1, p0, Lc/a/a/a/c0/d;->y:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    .line 91
    invoke-virtual {v1}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->getSizeDimension()I

    move-result v1

    sub-int/2addr v0, v1

    div-int/lit8 v0, v0, 0x2

    goto :goto_11

    :cond_10
    const/4 v0, 0x0

    .line 92
    :goto_11
    iget-boolean v1, p0, Lc/a/a/a/c0/d;->g:Z

    if-eqz v1, :cond_1d

    invoke-virtual {p0}, Lc/a/a/a/c0/d;->e()F

    move-result v1

    iget v2, p0, Lc/a/a/a/c0/d;->j:F

    add-float/2addr v1, v2

    goto :goto_1e

    :cond_1d
    const/4 v1, 0x0

    :goto_1e
    float-to-double v2, v1

    .line 93
    invoke-static {v2, v3}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v2

    double-to-int v2, v2

    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    const/high16 v3, 0x3fc00000    # 1.5f

    mul-float v1, v1, v3

    float-to-double v3, v1

    .line 94
    invoke-static {v3, v4}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v3

    double-to-int v1, v3

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 95
    invoke-virtual {p1, v2, v0, v2, v0}, Landroid/graphics/Rect;->set(IIII)V

    return-void
.end method

.method public a(Lc/a/a/a/c0/d$i;)V
    .registers 3

    .line 87
    iget-object v0, p0, Lc/a/a/a/c0/d;->x:Ljava/util/ArrayList;

    if-nez v0, :cond_b

    .line 88
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lc/a/a/a/c0/d;->x:Ljava/util/ArrayList;

    .line 89
    :cond_b
    iget-object v0, p0, Lc/a/a/a/c0/d;->x:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public a(Lc/a/a/a/c0/d$j;Z)V
    .registers 5

    .line 52
    invoke-virtual {p0}, Lc/a/a/a/c0/d;->m()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    .line 53
    :cond_7
    iget-object v0, p0, Lc/a/a/a/c0/d;->o:Landroid/animation/Animator;

    if-eqz v0, :cond_e

    .line 54
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 55
    :cond_e
    invoke-virtual {p0}, Lc/a/a/a/c0/d;->x()Z

    move-result v0

    if-eqz v0, :cond_46

    .line 56
    iget-object v0, p0, Lc/a/a/a/c0/d;->q:Lc/a/a/a/m/h;

    if-eqz v0, :cond_19

    goto :goto_1d

    .line 57
    :cond_19
    invoke-virtual {p0}, Lc/a/a/a/c0/d;->c()Lc/a/a/a/m/h;

    move-result-object v0

    :goto_1d
    const/4 v1, 0x0

    .line 58
    invoke-virtual {p0, v0, v1, v1, v1}, Lc/a/a/a/c0/d;->a(Lc/a/a/a/m/h;FFF)Landroid/animation/AnimatorSet;

    move-result-object v0

    .line 59
    new-instance v1, Lc/a/a/a/c0/d$a;

    invoke-direct {v1, p0, p2, p1}, Lc/a/a/a/c0/d$a;-><init>(Lc/a/a/a/c0/d;ZLc/a/a/a/c0/d$j;)V

    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 60
    iget-object p1, p0, Lc/a/a/a/c0/d;->w:Ljava/util/ArrayList;

    if-eqz p1, :cond_42

    .line 61
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_32
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_42

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/animation/Animator$AnimatorListener;

    .line 62
    invoke-virtual {v0, p2}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    goto :goto_32

    .line 63
    :cond_42
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    goto :goto_56

    .line 64
    :cond_46
    iget-object v0, p0, Lc/a/a/a/c0/d;->y:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    if-eqz p2, :cond_4d

    const/16 v1, 0x8

    goto :goto_4e

    :cond_4d
    const/4 v1, 0x4

    :goto_4e
    invoke-virtual {v0, v1, p2}, Lcom/google/android/material/internal/VisibilityAwareImageButton;->a(IZ)V

    if-eqz p1, :cond_56

    .line 65
    invoke-interface {p1}, Lc/a/a/a/c0/d$j;->b()V

    :cond_56
    :goto_56
    return-void
.end method

.method public final a(Lc/a/a/a/l0/m;)V
    .registers 4

    .line 37
    iput-object p1, p0, Lc/a/a/a/c0/d;->a:Lc/a/a/a/l0/m;

    .line 38
    iget-object v0, p0, Lc/a/a/a/c0/d;->b:Lc/a/a/a/l0/h;

    if-eqz v0, :cond_9

    .line 39
    invoke-virtual {v0, p1}, Lc/a/a/a/l0/h;->setShapeAppearanceModel(Lc/a/a/a/l0/m;)V

    .line 40
    :cond_9
    iget-object v0, p0, Lc/a/a/a/c0/d;->c:Landroid/graphics/drawable/Drawable;

    instance-of v1, v0, Lc/a/a/a/l0/p;

    if-eqz v1, :cond_14

    .line 41
    check-cast v0, Lc/a/a/a/l0/p;

    invoke-interface {v0, p1}, Lc/a/a/a/l0/p;->setShapeAppearanceModel(Lc/a/a/a/l0/m;)V

    .line 42
    :cond_14
    iget-object v0, p0, Lc/a/a/a/c0/d;->d:Lc/a/a/a/c0/c;

    if-eqz v0, :cond_1b

    .line 43
    invoke-virtual {v0, p1}, Lc/a/a/a/c0/c;->a(Lc/a/a/a/l0/m;)V

    :cond_1b
    return-void
.end method

.method public final a(Lc/a/a/a/m/h;)V
    .registers 2

    .line 44
    iput-object p1, p0, Lc/a/a/a/c0/d;->q:Lc/a/a/a/m/h;

    return-void
.end method

.method public a(Z)V
    .registers 2

    .line 45
    iput-boolean p1, p0, Lc/a/a/a/c0/d;->f:Z

    return-void
.end method

.method public a([I)V
    .registers 3

    .line 48
    iget-object v0, p0, Lc/a/a/a/c0/d;->l:Lc/a/a/a/d0/h;

    invoke-virtual {v0, p1}, Lc/a/a/a/d0/h;->a([I)V

    return-void
.end method

.method public final b()Landroid/graphics/drawable/Drawable;
    .registers 2

    .line 37
    iget-object v0, p0, Lc/a/a/a/c0/d;->e:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public final b(F)V
    .registers 4

    .line 5
    iget v0, p0, Lc/a/a/a/c0/d;->i:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_f

    .line 6
    iput p1, p0, Lc/a/a/a/c0/d;->i:F

    .line 7
    iget v0, p0, Lc/a/a/a/c0/d;->h:F

    iget v1, p0, Lc/a/a/a/c0/d;->j:F

    invoke-virtual {p0, v0, p1, v1}, Lc/a/a/a/c0/d;->a(FFF)V

    :cond_f
    return-void
.end method

.method public b(I)V
    .registers 2

    .line 1
    iput p1, p0, Lc/a/a/a/c0/d;->k:I

    return-void
.end method

.method public b(Landroid/animation/Animator$AnimatorListener;)V
    .registers 3

    .line 11
    iget-object v0, p0, Lc/a/a/a/c0/d;->v:Ljava/util/ArrayList;

    if-nez v0, :cond_b

    .line 12
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lc/a/a/a/c0/d;->v:Ljava/util/ArrayList;

    .line 13
    :cond_b
    iget-object v0, p0, Lc/a/a/a/c0/d;->v:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public b(Landroid/content/res/ColorStateList;)V
    .registers 3

    .line 2
    iget-object v0, p0, Lc/a/a/a/c0/d;->c:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_b

    .line 3
    invoke-static {p1}, Lc/a/a/a/j0/b;->b(Landroid/content/res/ColorStateList;)Landroid/content/res/ColorStateList;

    move-result-object p1

    .line 4
    invoke-static {v0, p1}, Lb/h/f/l/a;->a(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    :cond_b
    return-void
.end method

.method public b(Landroid/graphics/Rect;)V
    .registers 9

    .line 38
    iget-object v0, p0, Lc/a/a/a/c0/d;->e:Landroid/graphics/drawable/Drawable;

    const-string v1, "Didn\'t initialize content background"

    invoke-static {v0, v1}, Lb/h/l/h;->a(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    invoke-virtual {p0}, Lc/a/a/a/c0/d;->w()Z

    move-result v0

    if-eqz v0, :cond_23

    .line 40
    new-instance v0, Landroid/graphics/drawable/InsetDrawable;

    iget-object v2, p0, Lc/a/a/a/c0/d;->e:Landroid/graphics/drawable/Drawable;

    iget v3, p1, Landroid/graphics/Rect;->left:I

    iget v4, p1, Landroid/graphics/Rect;->top:I

    iget v5, p1, Landroid/graphics/Rect;->right:I

    iget v6, p1, Landroid/graphics/Rect;->bottom:I

    move-object v1, v0

    invoke-direct/range {v1 .. v6}, Landroid/graphics/drawable/InsetDrawable;-><init>(Landroid/graphics/drawable/Drawable;IIII)V

    .line 41
    iget-object p1, p0, Lc/a/a/a/c0/d;->z:Lc/a/a/a/k0/b;

    invoke-interface {p1, v0}, Lc/a/a/a/k0/b;->a(Landroid/graphics/drawable/Drawable;)V

    goto :goto_2a

    .line 42
    :cond_23
    iget-object p1, p0, Lc/a/a/a/c0/d;->z:Lc/a/a/a/k0/b;

    iget-object v0, p0, Lc/a/a/a/c0/d;->e:Landroid/graphics/drawable/Drawable;

    invoke-interface {p1, v0}, Lc/a/a/a/k0/b;->a(Landroid/graphics/drawable/Drawable;)V

    :goto_2a
    return-void
.end method

.method public b(Lc/a/a/a/c0/d$j;Z)V
    .registers 6

    .line 14
    invoke-virtual {p0}, Lc/a/a/a/c0/d;->n()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    .line 15
    :cond_7
    iget-object v0, p0, Lc/a/a/a/c0/d;->o:Landroid/animation/Animator;

    if-eqz v0, :cond_e

    .line 16
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 17
    :cond_e
    invoke-virtual {p0}, Lc/a/a/a/c0/d;->x()Z

    move-result v0

    const/high16 v1, 0x3f800000    # 1.0f

    if-eqz v0, :cond_62

    .line 18
    iget-object v0, p0, Lc/a/a/a/c0/d;->y:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    invoke-virtual {v0}, Landroid/widget/ImageButton;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_31

    .line 19
    iget-object v0, p0, Lc/a/a/a/c0/d;->y:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/widget/ImageButton;->setAlpha(F)V

    .line 20
    iget-object v0, p0, Lc/a/a/a/c0/d;->y:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    invoke-virtual {v0, v2}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->setScaleY(F)V

    .line 21
    iget-object v0, p0, Lc/a/a/a/c0/d;->y:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    invoke-virtual {v0, v2}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->setScaleX(F)V

    .line 22
    invoke-virtual {p0, v2}, Lc/a/a/a/c0/d;->c(F)V

    .line 23
    :cond_31
    iget-object v0, p0, Lc/a/a/a/c0/d;->p:Lc/a/a/a/m/h;

    if-eqz v0, :cond_36

    goto :goto_3a

    .line 24
    :cond_36
    invoke-virtual {p0}, Lc/a/a/a/c0/d;->d()Lc/a/a/a/m/h;

    move-result-object v0

    .line 25
    :goto_3a
    invoke-virtual {p0, v0, v1, v1, v1}, Lc/a/a/a/c0/d;->a(Lc/a/a/a/m/h;FFF)Landroid/animation/AnimatorSet;

    move-result-object v0

    .line 26
    new-instance v1, Lc/a/a/a/c0/d$b;

    invoke-direct {v1, p0, p2, p1}, Lc/a/a/a/c0/d$b;-><init>(Lc/a/a/a/c0/d;ZLc/a/a/a/c0/d$j;)V

    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 27
    iget-object p1, p0, Lc/a/a/a/c0/d;->v:Ljava/util/ArrayList;

    if-eqz p1, :cond_5e

    .line 28
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_4e
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_5e

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/animation/Animator$AnimatorListener;

    .line 29
    invoke-virtual {v0, p2}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    goto :goto_4e

    .line 30
    :cond_5e
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    goto :goto_7f

    .line 31
    :cond_62
    iget-object v0, p0, Lc/a/a/a/c0/d;->y:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    const/4 v2, 0x0

    invoke-virtual {v0, v2, p2}, Lcom/google/android/material/internal/VisibilityAwareImageButton;->a(IZ)V

    .line 32
    iget-object p2, p0, Lc/a/a/a/c0/d;->y:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    invoke-virtual {p2, v1}, Landroid/widget/ImageButton;->setAlpha(F)V

    .line 33
    iget-object p2, p0, Lc/a/a/a/c0/d;->y:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    invoke-virtual {p2, v1}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->setScaleY(F)V

    .line 34
    iget-object p2, p0, Lc/a/a/a/c0/d;->y:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    invoke-virtual {p2, v1}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->setScaleX(F)V

    .line 35
    invoke-virtual {p0, v1}, Lc/a/a/a/c0/d;->c(F)V

    if-eqz p1, :cond_7f

    .line 36
    invoke-interface {p1}, Lc/a/a/a/c0/d$j;->a()V

    :cond_7f
    :goto_7f
    return-void
.end method

.method public final b(Lc/a/a/a/m/h;)V
    .registers 2

    .line 8
    iput-object p1, p0, Lc/a/a/a/c0/d;->p:Lc/a/a/a/m/h;

    return-void
.end method

.method public b(Z)V
    .registers 2

    .line 9
    iput-boolean p1, p0, Lc/a/a/a/c0/d;->g:Z

    .line 10
    invoke-virtual {p0}, Lc/a/a/a/c0/d;->B()V

    return-void
.end method

.method public final c()Lc/a/a/a/m/h;
    .registers 3

    .line 5
    iget-object v0, p0, Lc/a/a/a/c0/d;->n:Lc/a/a/a/m/h;

    if-nez v0, :cond_12

    .line 6
    iget-object v0, p0, Lc/a/a/a/c0/d;->y:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    .line 7
    invoke-virtual {v0}, Landroid/widget/ImageButton;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v1, Lc/a/a/a/a;->design_fab_hide_motion_spec:I

    invoke-static {v0, v1}, Lc/a/a/a/m/h;->a(Landroid/content/Context;I)Lc/a/a/a/m/h;

    move-result-object v0

    iput-object v0, p0, Lc/a/a/a/c0/d;->n:Lc/a/a/a/m/h;

    .line 8
    :cond_12
    iget-object v0, p0, Lc/a/a/a/c0/d;->n:Lc/a/a/a/m/h;

    invoke-static {v0}, Lb/h/l/h;->a(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast v0, Lc/a/a/a/m/h;

    return-object v0
.end method

.method public final c(F)V
    .registers 3

    .line 1
    iput p1, p0, Lc/a/a/a/c0/d;->s:F

    .line 2
    iget-object v0, p0, Lc/a/a/a/c0/d;->D:Landroid/graphics/Matrix;

    .line 3
    invoke-virtual {p0, p1, v0}, Lc/a/a/a/c0/d;->a(FLandroid/graphics/Matrix;)V

    .line 4
    iget-object p1, p0, Lc/a/a/a/c0/d;->y:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    invoke-virtual {p1, v0}, Landroid/widget/ImageButton;->setImageMatrix(Landroid/graphics/Matrix;)V

    return-void
.end method

.method public final d()Lc/a/a/a/m/h;
    .registers 3

    .line 4
    iget-object v0, p0, Lc/a/a/a/c0/d;->m:Lc/a/a/a/m/h;

    if-nez v0, :cond_12

    .line 5
    iget-object v0, p0, Lc/a/a/a/c0/d;->y:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    .line 6
    invoke-virtual {v0}, Landroid/widget/ImageButton;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v1, Lc/a/a/a/a;->design_fab_show_motion_spec:I

    invoke-static {v0, v1}, Lc/a/a/a/m/h;->a(Landroid/content/Context;I)Lc/a/a/a/m/h;

    move-result-object v0

    iput-object v0, p0, Lc/a/a/a/c0/d;->m:Lc/a/a/a/m/h;

    .line 7
    :cond_12
    iget-object v0, p0, Lc/a/a/a/c0/d;->m:Lc/a/a/a/m/h;

    invoke-static {v0}, Lb/h/l/h;->a(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast v0, Lc/a/a/a/m/h;

    return-object v0
.end method

.method public final d(F)V
    .registers 4

    .line 1
    iget v0, p0, Lc/a/a/a/c0/d;->j:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_f

    .line 2
    iput p1, p0, Lc/a/a/a/c0/d;->j:F

    .line 3
    iget v0, p0, Lc/a/a/a/c0/d;->h:F

    iget v1, p0, Lc/a/a/a/c0/d;->i:F

    invoke-virtual {p0, v0, v1, p1}, Lc/a/a/a/c0/d;->a(FFF)V

    :cond_f
    return-void
.end method

.method public e()F
    .registers 2

    .line 1
    iget v0, p0, Lc/a/a/a/c0/d;->h:F

    return v0
.end method

.method public e(F)V
    .registers 3

    .line 2
    iget-object v0, p0, Lc/a/a/a/c0/d;->b:Lc/a/a/a/l0/h;

    if-eqz v0, :cond_7

    .line 3
    invoke-virtual {v0, p1}, Lc/a/a/a/l0/h;->b(F)V

    :cond_7
    return-void
.end method

.method public f()Z
    .registers 2

    .line 1
    iget-boolean v0, p0, Lc/a/a/a/c0/d;->f:Z

    return v0
.end method

.method public final g()Lc/a/a/a/m/h;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/c0/d;->q:Lc/a/a/a/m/h;

    return-object v0
.end method

.method public h()F
    .registers 2

    .line 1
    iget v0, p0, Lc/a/a/a/c0/d;->i:F

    return v0
.end method

.method public final i()Landroid/view/ViewTreeObserver$OnPreDrawListener;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/c0/d;->E:Landroid/view/ViewTreeObserver$OnPreDrawListener;

    if-nez v0, :cond_b

    .line 2
    new-instance v0, Lc/a/a/a/c0/d$e;

    invoke-direct {v0, p0}, Lc/a/a/a/c0/d$e;-><init>(Lc/a/a/a/c0/d;)V

    iput-object v0, p0, Lc/a/a/a/c0/d;->E:Landroid/view/ViewTreeObserver$OnPreDrawListener;

    .line 3
    :cond_b
    iget-object v0, p0, Lc/a/a/a/c0/d;->E:Landroid/view/ViewTreeObserver$OnPreDrawListener;

    return-object v0
.end method

.method public j()F
    .registers 2

    .line 1
    iget v0, p0, Lc/a/a/a/c0/d;->j:F

    return v0
.end method

.method public final k()Lc/a/a/a/l0/m;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/c0/d;->a:Lc/a/a/a/l0/m;

    return-object v0
.end method

.method public final l()Lc/a/a/a/m/h;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/c0/d;->p:Lc/a/a/a/m/h;

    return-object v0
.end method

.method public m()Z
    .registers 5

    .line 1
    iget-object v0, p0, Lc/a/a/a/c0/d;->y:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    invoke-virtual {v0}, Landroid/widget/ImageButton;->getVisibility()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_10

    .line 2
    iget v0, p0, Lc/a/a/a/c0/d;->u:I

    if-ne v0, v2, :cond_f

    const/4 v1, 0x1

    :cond_f
    return v1

    .line 3
    :cond_10
    iget v0, p0, Lc/a/a/a/c0/d;->u:I

    const/4 v3, 0x2

    if-eq v0, v3, :cond_16

    const/4 v1, 0x1

    :cond_16
    return v1
.end method

.method public n()Z
    .registers 5

    .line 1
    iget-object v0, p0, Lc/a/a/a/c0/d;->y:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    invoke-virtual {v0}, Landroid/widget/ImageButton;->getVisibility()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_11

    .line 2
    iget v0, p0, Lc/a/a/a/c0/d;->u:I

    const/4 v3, 0x2

    if-ne v0, v3, :cond_10

    const/4 v1, 0x1

    :cond_10
    return v1

    .line 3
    :cond_11
    iget v0, p0, Lc/a/a/a/c0/d;->u:I

    if-eq v0, v2, :cond_16

    const/4 v1, 0x1

    :cond_16
    return v1
.end method

.method public o()V
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/c0/d;->l:Lc/a/a/a/d0/h;

    invoke-virtual {v0}, Lc/a/a/a/d0/h;->b()V

    return-void
.end method

.method public p()V
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/c0/d;->b:Lc/a/a/a/l0/h;

    if-eqz v0, :cond_9

    .line 2
    iget-object v1, p0, Lc/a/a/a/c0/d;->y:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    invoke-static {v1, v0}, Lc/a/a/a/l0/i;->a(Landroid/view/View;Lc/a/a/a/l0/h;)V

    .line 3
    :cond_9
    invoke-virtual {p0}, Lc/a/a/a/c0/d;->v()Z

    move-result v0

    if-eqz v0, :cond_1c

    .line 4
    iget-object v0, p0, Lc/a/a/a/c0/d;->y:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    invoke-virtual {v0}, Landroid/widget/ImageButton;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {p0}, Lc/a/a/a/c0/d;->i()Landroid/view/ViewTreeObserver$OnPreDrawListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    :cond_1c
    return-void
.end method

.method public q()V
    .registers 1

    return-void
.end method

.method public r()V
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/c0/d;->y:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    invoke-virtual {v0}, Landroid/widget/ImageButton;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    .line 2
    iget-object v1, p0, Lc/a/a/a/c0/d;->E:Landroid/view/ViewTreeObserver$OnPreDrawListener;

    if-eqz v1, :cond_10

    .line 3
    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    const/4 v0, 0x0

    .line 4
    iput-object v0, p0, Lc/a/a/a/c0/d;->E:Landroid/view/ViewTreeObserver$OnPreDrawListener;

    :cond_10
    return-void
.end method

.method public s()V
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/c0/d;->y:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    invoke-virtual {v0}, Landroid/widget/ImageButton;->getRotation()F

    move-result v0

    .line 2
    iget v1, p0, Lc/a/a/a/c0/d;->r:F

    cmpl-float v1, v1, v0

    if-eqz v1, :cond_11

    .line 3
    iput v0, p0, Lc/a/a/a/c0/d;->r:F

    .line 4
    invoke-virtual {p0}, Lc/a/a/a/c0/d;->z()V

    :cond_11
    return-void
.end method

.method public t()V
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/c0/d;->x:Ljava/util/ArrayList;

    if-eqz v0, :cond_18

    .line 2
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_18

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lc/a/a/a/c0/d$i;

    .line 3
    invoke-interface {v1}, Lc/a/a/a/c0/d$i;->a()V

    goto :goto_8

    :cond_18
    return-void
.end method

.method public u()V
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/c0/d;->x:Ljava/util/ArrayList;

    if-eqz v0, :cond_18

    .line 2
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_18

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lc/a/a/a/c0/d$i;

    .line 3
    invoke-interface {v1}, Lc/a/a/a/c0/d$i;->b()V

    goto :goto_8

    :cond_18
    return-void
.end method

.method public v()Z
    .registers 2

    const/4 v0, 0x1

    return v0
.end method

.method public w()Z
    .registers 2

    const/4 v0, 0x1

    return v0
.end method

.method public final x()Z
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/c0/d;->y:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    invoke-static {v0}, Lb/h/m/y;->K(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_12

    iget-object v0, p0, Lc/a/a/a/c0/d;->y:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    invoke-virtual {v0}, Landroid/widget/ImageButton;->isInEditMode()Z

    move-result v0

    if-nez v0, :cond_12

    const/4 v0, 0x1

    goto :goto_13

    :cond_12
    const/4 v0, 0x0

    :goto_13
    return v0
.end method

.method public final y()Z
    .registers 3

    .line 1
    iget-boolean v0, p0, Lc/a/a/a/c0/d;->f:Z

    if-eqz v0, :cond_11

    iget-object v0, p0, Lc/a/a/a/c0/d;->y:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    invoke-virtual {v0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->getSizeDimension()I

    move-result v0

    iget v1, p0, Lc/a/a/a/c0/d;->k:I

    if-lt v0, v1, :cond_f

    goto :goto_11

    :cond_f
    const/4 v0, 0x0

    goto :goto_12

    :cond_11
    :goto_11
    const/4 v0, 0x1

    :goto_12
    return v0
.end method

.method public z()V
    .registers 4

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-ne v0, v1, :cond_2e

    .line 2
    iget v0, p0, Lc/a/a/a/c0/d;->r:F

    const/high16 v1, 0x42b40000    # 90.0f

    rem-float/2addr v0, v1

    const/4 v1, 0x0

    const/4 v2, 0x0

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_20

    .line 3
    iget-object v0, p0, Lc/a/a/a/c0/d;->y:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    invoke-virtual {v0}, Landroid/widget/ImageButton;->getLayerType()I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_2e

    .line 4
    iget-object v0, p0, Lc/a/a/a/c0/d;->y:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    invoke-virtual {v0, v1, v2}, Landroid/widget/ImageButton;->setLayerType(ILandroid/graphics/Paint;)V

    goto :goto_2e

    .line 5
    :cond_20
    iget-object v0, p0, Lc/a/a/a/c0/d;->y:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    invoke-virtual {v0}, Landroid/widget/ImageButton;->getLayerType()I

    move-result v0

    if-eqz v0, :cond_2e

    .line 6
    iget-object v0, p0, Lc/a/a/a/c0/d;->y:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/widget/ImageButton;->setLayerType(ILandroid/graphics/Paint;)V

    .line 7
    :cond_2e
    :goto_2e
    iget-object v0, p0, Lc/a/a/a/c0/d;->b:Lc/a/a/a/l0/h;

    if-eqz v0, :cond_38

    .line 8
    iget v1, p0, Lc/a/a/a/c0/d;->r:F

    float-to-int v1, v1

    invoke-virtual {v0, v1}, Lc/a/a/a/l0/h;->c(I)V

    :cond_38
    return-void
.end method
