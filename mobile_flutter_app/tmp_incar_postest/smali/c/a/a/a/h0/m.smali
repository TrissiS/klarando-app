.class public final Lc/a/a/a/h0/m;
.super Lc/a/a/a/h0/i;
.source "LinearIndeterminateDisjointAnimatorDelegate.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lc/a/a/a/h0/i<",
        "Landroid/animation/ObjectAnimator;",
        ">;"
    }
.end annotation


# static fields
.field public static final l:[I

.field public static final m:[I

.field public static final n:Landroid/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Property<",
            "Lc/a/a/a/h0/m;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public d:Landroid/animation/ObjectAnimator;

.field public final e:[Landroid/view/animation/Interpolator;

.field public final f:Lc/a/a/a/h0/c;

.field public g:I

.field public h:Z

.field public i:F

.field public j:Z

.field public k:Lb/t/a/a/b$a;


# direct methods
.method public static constructor <clinit>()V
    .registers 3

    const/4 v0, 0x4

    new-array v1, v0, [I

    .line 1
    fill-array-data v1, :array_1c

    sput-object v1, Lc/a/a/a/h0/m;->l:[I

    new-array v0, v0, [I

    .line 2
    fill-array-data v0, :array_28

    sput-object v0, Lc/a/a/a/h0/m;->m:[I

    .line 3
    new-instance v0, Lc/a/a/a/h0/m$b;

    const-class v1, Ljava/lang/Float;

    const-string v2, "animationFraction"

    invoke-direct {v0, v1, v2}, Lc/a/a/a/h0/m$b;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    sput-object v0, Lc/a/a/a/h0/m;->n:Landroid/util/Property;

    return-void

    nop

    :array_1c
    .array-data 4
        0x215
        0x237
        0x352
        0x2ee
    .end array-data

    :array_28
    .array-data 4
        0x4f3
        0x3e8
        0x14d
        0x0
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/google/android/material/progressindicator/LinearProgressIndicatorSpec;)V
    .registers 6

    const/4 v0, 0x2

    .line 1
    invoke-direct {p0, v0}, Lc/a/a/a/h0/i;-><init>(I)V

    const/4 v1, 0x0

    .line 2
    iput v1, p0, Lc/a/a/a/h0/m;->g:I

    const/4 v2, 0x0

    .line 3
    iput-object v2, p0, Lc/a/a/a/h0/m;->k:Lb/t/a/a/b$a;

    .line 4
    iput-object p2, p0, Lc/a/a/a/h0/m;->f:Lc/a/a/a/h0/c;

    const/4 p2, 0x4

    new-array p2, p2, [Landroid/view/animation/Interpolator;

    .line 5
    sget v2, Lc/a/a/a/a;->linear_indeterminate_line1_head_interpolator:I

    .line 6
    invoke-static {p1, v2}, Lb/t/a/a/d;->a(Landroid/content/Context;I)Landroid/view/animation/Interpolator;

    move-result-object v2

    aput-object v2, p2, v1

    sget v1, Lc/a/a/a/a;->linear_indeterminate_line1_tail_interpolator:I

    .line 7
    invoke-static {p1, v1}, Lb/t/a/a/d;->a(Landroid/content/Context;I)Landroid/view/animation/Interpolator;

    move-result-object v1

    const/4 v2, 0x1

    aput-object v1, p2, v2

    sget v1, Lc/a/a/a/a;->linear_indeterminate_line2_head_interpolator:I

    .line 8
    invoke-static {p1, v1}, Lb/t/a/a/d;->a(Landroid/content/Context;I)Landroid/view/animation/Interpolator;

    move-result-object v1

    aput-object v1, p2, v0

    sget v0, Lc/a/a/a/a;->linear_indeterminate_line2_tail_interpolator:I

    .line 9
    invoke-static {p1, v0}, Lb/t/a/a/d;->a(Landroid/content/Context;I)Landroid/view/animation/Interpolator;

    move-result-object p1

    const/4 v0, 0x3

    aput-object p1, p2, v0

    iput-object p2, p0, Lc/a/a/a/h0/m;->e:[Landroid/view/animation/Interpolator;

    return-void
.end method

.method public static synthetic a(Lc/a/a/a/h0/m;)I
    .registers 1

    .line 1
    iget p0, p0, Lc/a/a/a/h0/m;->g:I

    return p0
.end method

.method public static synthetic a(Lc/a/a/a/h0/m;I)I
    .registers 2

    .line 2
    iput p1, p0, Lc/a/a/a/h0/m;->g:I

    return p1
.end method

.method public static synthetic a(Lc/a/a/a/h0/m;Z)Z
    .registers 2

    .line 3
    iput-boolean p1, p0, Lc/a/a/a/h0/m;->h:Z

    return p1
.end method

.method public static synthetic b(Lc/a/a/a/h0/m;)Lc/a/a/a/h0/c;
    .registers 1

    .line 1
    iget-object p0, p0, Lc/a/a/a/h0/m;->f:Lc/a/a/a/h0/c;

    return-object p0
.end method

.method public static synthetic b(Lc/a/a/a/h0/m;Z)Z
    .registers 2

    .line 2
    iput-boolean p1, p0, Lc/a/a/a/h0/m;->j:Z

    return p1
.end method

.method public static synthetic c(Lc/a/a/a/h0/m;)Z
    .registers 1

    .line 1
    iget-boolean p0, p0, Lc/a/a/a/h0/m;->j:Z

    return p0
.end method

.method public static synthetic d(Lc/a/a/a/h0/m;)Landroid/animation/ObjectAnimator;
    .registers 1

    .line 1
    iget-object p0, p0, Lc/a/a/a/h0/m;->d:Landroid/animation/ObjectAnimator;

    return-object p0
.end method

.method public static synthetic e(Lc/a/a/a/h0/m;)F
    .registers 1

    .line 1
    invoke-virtual {p0}, Lc/a/a/a/h0/m;->f()F

    move-result p0

    return p0
.end method


# virtual methods
.method public a()V
    .registers 2

    .line 4
    iget-object v0, p0, Lc/a/a/a/h0/m;->d:Landroid/animation/ObjectAnimator;

    if-eqz v0, :cond_7

    .line 5
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->cancel()V

    :cond_7
    return-void
.end method

.method public a(F)V
    .registers 3

    .line 11
    iput p1, p0, Lc/a/a/a/h0/m;->i:F

    const/high16 v0, 0x44e10000    # 1800.0f

    mul-float p1, p1, v0

    float-to-int p1, p1

    .line 12
    invoke-virtual {p0, p1}, Lc/a/a/a/h0/m;->a(I)V

    .line 13
    invoke-virtual {p0}, Lc/a/a/a/h0/m;->h()V

    .line 14
    iget-object p1, p0, Lc/a/a/a/h0/i;->a:Lc/a/a/a/h0/j;

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    return-void
.end method

.method public final a(I)V
    .registers 7

    const/4 v0, 0x0

    :goto_1
    const/4 v1, 0x4

    if-ge v0, v1, :cond_2a

    .line 7
    sget-object v1, Lc/a/a/a/h0/m;->m:[I

    aget v1, v1, v0

    sget-object v2, Lc/a/a/a/h0/m;->l:[I

    aget v2, v2, v0

    .line 8
    invoke-virtual {p0, p1, v1, v2}, Lc/a/a/a/h0/i;->a(III)F

    move-result v1

    .line 9
    iget-object v2, p0, Lc/a/a/a/h0/m;->e:[Landroid/view/animation/Interpolator;

    aget-object v2, v2, v0

    invoke-interface {v2, v1}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v1

    .line 10
    iget-object v2, p0, Lc/a/a/a/h0/i;->b:[F

    const/4 v3, 0x0

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-static {v4, v1}, Ljava/lang/Math;->min(FF)F

    move-result v1

    invoke-static {v3, v1}, Ljava/lang/Math;->max(FF)F

    move-result v1

    aput v1, v2, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_2a
    return-void
.end method

.method public a(Lb/t/a/a/b$a;)V
    .registers 2

    .line 6
    iput-object p1, p0, Lc/a/a/a/h0/m;->k:Lb/t/a/a/b$a;

    return-void
.end method

.method public b()V
    .registers 1

    .line 3
    invoke-virtual {p0}, Lc/a/a/a/h0/m;->i()V

    return-void
.end method

.method public c()V
    .registers 3

    .line 2
    iget-object v0, p0, Lc/a/a/a/h0/i;->a:Lc/a/a/a/h0/j;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->isVisible()Z

    move-result v0

    if-eqz v0, :cond_12

    const/4 v0, 0x1

    .line 3
    iput-boolean v0, p0, Lc/a/a/a/h0/m;->j:Z

    .line 4
    iget-object v0, p0, Lc/a/a/a/h0/m;->d:Landroid/animation/ObjectAnimator;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->setRepeatCount(I)V

    goto :goto_15

    .line 5
    :cond_12
    invoke-virtual {p0}, Lc/a/a/a/h0/m;->a()V

    :goto_15
    return-void
.end method

.method public d()V
    .registers 2

    .line 2
    invoke-virtual {p0}, Lc/a/a/a/h0/m;->g()V

    .line 3
    invoke-virtual {p0}, Lc/a/a/a/h0/m;->i()V

    .line 4
    iget-object v0, p0, Lc/a/a/a/h0/m;->d:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    return-void
.end method

.method public e()V
    .registers 2

    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lc/a/a/a/h0/m;->k:Lb/t/a/a/b$a;

    return-void
.end method

.method public final f()F
    .registers 2

    .line 1
    iget v0, p0, Lc/a/a/a/h0/m;->i:F

    return v0
.end method

.method public final g()V
    .registers 4

    .line 1
    iget-object v0, p0, Lc/a/a/a/h0/m;->d:Landroid/animation/ObjectAnimator;

    if-nez v0, :cond_2d

    .line 2
    sget-object v0, Lc/a/a/a/h0/m;->n:Landroid/util/Property;

    const/4 v1, 0x2

    new-array v1, v1, [F

    fill-array-data v1, :array_2e

    invoke-static {p0, v0, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    iput-object v0, p0, Lc/a/a/a/h0/m;->d:Landroid/animation/ObjectAnimator;

    const-wide/16 v1, 0x708

    .line 3
    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 4
    iget-object v0, p0, Lc/a/a/a/h0/m;->d:Landroid/animation/ObjectAnimator;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 5
    iget-object v0, p0, Lc/a/a/a/h0/m;->d:Landroid/animation/ObjectAnimator;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->setRepeatCount(I)V

    .line 6
    iget-object v0, p0, Lc/a/a/a/h0/m;->d:Landroid/animation/ObjectAnimator;

    new-instance v1, Lc/a/a/a/h0/m$a;

    invoke-direct {v1, p0}, Lc/a/a/a/h0/m$a;-><init>(Lc/a/a/a/h0/m;)V

    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    :cond_2d
    return-void

    :array_2e
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final h()V
    .registers 4

    .line 1
    iget-boolean v0, p0, Lc/a/a/a/h0/m;->h:Z

    if-eqz v0, :cond_1e

    .line 2
    iget-object v0, p0, Lc/a/a/a/h0/i;->c:[I

    iget-object v1, p0, Lc/a/a/a/h0/m;->f:Lc/a/a/a/h0/c;

    iget-object v1, v1, Lc/a/a/a/h0/c;->c:[I

    iget v2, p0, Lc/a/a/a/h0/m;->g:I

    aget v1, v1, v2

    iget-object v2, p0, Lc/a/a/a/h0/i;->a:Lc/a/a/a/h0/j;

    .line 3
    invoke-virtual {v2}, Lc/a/a/a/h0/g;->getAlpha()I

    move-result v2

    .line 4
    invoke-static {v1, v2}, Lc/a/a/a/w/a;->a(II)I

    move-result v1

    .line 5
    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([II)V

    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Lc/a/a/a/h0/m;->h:Z

    :cond_1e
    return-void
.end method

.method public i()V
    .registers 4

    const/4 v0, 0x0

    .line 1
    iput v0, p0, Lc/a/a/a/h0/m;->g:I

    .line 2
    iget-object v1, p0, Lc/a/a/a/h0/m;->f:Lc/a/a/a/h0/c;

    iget-object v1, v1, Lc/a/a/a/h0/c;->c:[I

    aget v1, v1, v0

    iget-object v2, p0, Lc/a/a/a/h0/i;->a:Lc/a/a/a/h0/j;

    .line 3
    invoke-virtual {v2}, Lc/a/a/a/h0/g;->getAlpha()I

    move-result v2

    invoke-static {v1, v2}, Lc/a/a/a/w/a;->a(II)I

    move-result v1

    .line 4
    iget-object v2, p0, Lc/a/a/a/h0/i;->c:[I

    aput v1, v2, v0

    const/4 v0, 0x1

    .line 5
    aput v1, v2, v0

    return-void
.end method
