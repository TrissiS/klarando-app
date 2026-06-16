.class public final Lc/a/a/a/h0/l;
.super Lc/a/a/a/h0/i;
.source "LinearIndeterminateContiguousAnimatorDelegate.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lc/a/a/a/h0/i<",
        "Landroid/animation/ObjectAnimator;",
        ">;"
    }
.end annotation


# static fields
.field public static final j:Landroid/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Property<",
            "Lc/a/a/a/h0/l;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public d:Landroid/animation/ObjectAnimator;

.field public e:Lb/m/a/a/b;

.field public final f:Lc/a/a/a/h0/c;

.field public g:I

.field public h:Z

.field public i:F


# direct methods
.method public static constructor <clinit>()V
    .registers 3

    .line 1
    new-instance v0, Lc/a/a/a/h0/l$b;

    const-class v1, Ljava/lang/Float;

    const-string v2, "animationFraction"

    invoke-direct {v0, v1, v2}, Lc/a/a/a/h0/l$b;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    sput-object v0, Lc/a/a/a/h0/l;->j:Landroid/util/Property;

    return-void
.end method

.method public constructor <init>(Lcom/google/android/material/progressindicator/LinearProgressIndicatorSpec;)V
    .registers 3

    const/4 v0, 0x3

    .line 1
    invoke-direct {p0, v0}, Lc/a/a/a/h0/i;-><init>(I)V

    const/4 v0, 0x1

    .line 2
    iput v0, p0, Lc/a/a/a/h0/l;->g:I

    .line 3
    iput-object p1, p0, Lc/a/a/a/h0/l;->f:Lc/a/a/a/h0/c;

    .line 4
    new-instance p1, Lb/m/a/a/b;

    invoke-direct {p1}, Lb/m/a/a/b;-><init>()V

    iput-object p1, p0, Lc/a/a/a/h0/l;->e:Lb/m/a/a/b;

    return-void
.end method

.method public static synthetic a(Lc/a/a/a/h0/l;)I
    .registers 1

    .line 1
    iget p0, p0, Lc/a/a/a/h0/l;->g:I

    return p0
.end method

.method public static synthetic a(Lc/a/a/a/h0/l;I)I
    .registers 2

    .line 2
    iput p1, p0, Lc/a/a/a/h0/l;->g:I

    return p1
.end method

.method public static synthetic a(Lc/a/a/a/h0/l;Z)Z
    .registers 2

    .line 3
    iput-boolean p1, p0, Lc/a/a/a/h0/l;->h:Z

    return p1
.end method

.method public static synthetic b(Lc/a/a/a/h0/l;)Lc/a/a/a/h0/c;
    .registers 1

    .line 1
    iget-object p0, p0, Lc/a/a/a/h0/l;->f:Lc/a/a/a/h0/c;

    return-object p0
.end method

.method public static synthetic c(Lc/a/a/a/h0/l;)F
    .registers 1

    .line 1
    invoke-virtual {p0}, Lc/a/a/a/h0/l;->f()F

    move-result p0

    return p0
.end method


# virtual methods
.method public a()V
    .registers 2

    .line 4
    iget-object v0, p0, Lc/a/a/a/h0/l;->d:Landroid/animation/ObjectAnimator;

    if-eqz v0, :cond_7

    .line 5
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->cancel()V

    :cond_7
    return-void
.end method

.method public a(F)V
    .registers 3

    .line 11
    iput p1, p0, Lc/a/a/a/h0/l;->i:F

    const v0, 0x43a68000    # 333.0f

    mul-float p1, p1, v0

    float-to-int p1, p1

    .line 12
    invoke-virtual {p0, p1}, Lc/a/a/a/h0/l;->a(I)V

    .line 13
    invoke-virtual {p0}, Lc/a/a/a/h0/l;->h()V

    .line 14
    iget-object p1, p0, Lc/a/a/a/h0/i;->a:Lc/a/a/a/h0/j;

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    return-void
.end method

.method public final a(I)V
    .registers 5

    .line 6
    iget-object v0, p0, Lc/a/a/a/h0/i;->b:[F

    const/4 v1, 0x0

    const/4 v2, 0x0

    aput v1, v0, v2

    const/16 v0, 0x29b

    .line 7
    invoke-virtual {p0, p1, v2, v0}, Lc/a/a/a/h0/i;->a(III)F

    move-result p1

    .line 8
    iget-object v0, p0, Lc/a/a/a/h0/i;->b:[F

    iget-object v1, p0, Lc/a/a/a/h0/l;->e:Lb/m/a/a/b;

    invoke-virtual {v1, p1}, Lb/m/a/a/d;->getInterpolation(F)F

    move-result v1

    const/4 v2, 0x2

    aput v1, v0, v2

    const/4 v2, 0x1

    aput v1, v0, v2

    const v0, 0x3eff9dbf

    add-float/2addr p1, v0

    .line 9
    iget-object v0, p0, Lc/a/a/a/h0/i;->b:[F

    iget-object v1, p0, Lc/a/a/a/h0/l;->e:Lb/m/a/a/b;

    invoke-virtual {v1, p1}, Lb/m/a/a/d;->getInterpolation(F)F

    move-result p1

    const/4 v1, 0x4

    aput p1, v0, v1

    const/4 v1, 0x3

    aput p1, v0, v1

    .line 10
    iget-object p1, p0, Lc/a/a/a/h0/i;->b:[F

    const/4 v0, 0x5

    const/high16 v1, 0x3f800000    # 1.0f

    aput v1, p1, v0

    return-void
.end method

.method public a(Lb/t/a/a/b$a;)V
    .registers 2

    return-void
.end method

.method public b()V
    .registers 1

    .line 2
    invoke-virtual {p0}, Lc/a/a/a/h0/l;->i()V

    return-void
.end method

.method public c()V
    .registers 1

    return-void
.end method

.method public d()V
    .registers 2

    .line 1
    invoke-virtual {p0}, Lc/a/a/a/h0/l;->g()V

    .line 2
    invoke-virtual {p0}, Lc/a/a/a/h0/l;->i()V

    .line 3
    iget-object v0, p0, Lc/a/a/a/h0/l;->d:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    return-void
.end method

.method public e()V
    .registers 1

    return-void
.end method

.method public final f()F
    .registers 2

    .line 1
    iget v0, p0, Lc/a/a/a/h0/l;->i:F

    return v0
.end method

.method public final g()V
    .registers 4

    .line 1
    iget-object v0, p0, Lc/a/a/a/h0/l;->d:Landroid/animation/ObjectAnimator;

    if-nez v0, :cond_2d

    .line 2
    sget-object v0, Lc/a/a/a/h0/l;->j:Landroid/util/Property;

    const/4 v1, 0x2

    new-array v1, v1, [F

    fill-array-data v1, :array_2e

    invoke-static {p0, v0, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    iput-object v0, p0, Lc/a/a/a/h0/l;->d:Landroid/animation/ObjectAnimator;

    const-wide/16 v1, 0x14d

    .line 3
    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 4
    iget-object v0, p0, Lc/a/a/a/h0/l;->d:Landroid/animation/ObjectAnimator;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 5
    iget-object v0, p0, Lc/a/a/a/h0/l;->d:Landroid/animation/ObjectAnimator;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->setRepeatCount(I)V

    .line 6
    iget-object v0, p0, Lc/a/a/a/h0/l;->d:Landroid/animation/ObjectAnimator;

    new-instance v1, Lc/a/a/a/h0/l$a;

    invoke-direct {v1, p0}, Lc/a/a/a/h0/l$a;-><init>(Lc/a/a/a/h0/l;)V

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
    .registers 5

    .line 1
    iget-boolean v0, p0, Lc/a/a/a/h0/l;->h:Z

    if-eqz v0, :cond_32

    iget-object v0, p0, Lc/a/a/a/h0/i;->b:[F

    const/4 v1, 0x3

    aget v0, v0, v1

    const/high16 v1, 0x3f800000    # 1.0f

    cmpg-float v0, v0, v1

    if-gez v0, :cond_32

    .line 2
    iget-object v0, p0, Lc/a/a/a/h0/i;->c:[I

    const/4 v1, 0x2

    const/4 v2, 0x1

    aget v3, v0, v2

    aput v3, v0, v1

    const/4 v1, 0x0

    .line 3
    aget v3, v0, v1

    aput v3, v0, v2

    .line 4
    iget-object v2, p0, Lc/a/a/a/h0/l;->f:Lc/a/a/a/h0/c;

    iget-object v2, v2, Lc/a/a/a/h0/c;->c:[I

    iget v3, p0, Lc/a/a/a/h0/l;->g:I

    aget v2, v2, v3

    iget-object v3, p0, Lc/a/a/a/h0/i;->a:Lc/a/a/a/h0/j;

    .line 5
    invoke-virtual {v3}, Lc/a/a/a/h0/g;->getAlpha()I

    move-result v3

    .line 6
    invoke-static {v2, v3}, Lc/a/a/a/w/a;->a(II)I

    move-result v2

    aput v2, v0, v1

    .line 7
    iput-boolean v1, p0, Lc/a/a/a/h0/l;->h:Z

    :cond_32
    return-void
.end method

.method public i()V
    .registers 4

    const/4 v0, 0x1

    .line 1
    iput-boolean v0, p0, Lc/a/a/a/h0/l;->h:Z

    .line 2
    iput v0, p0, Lc/a/a/a/h0/l;->g:I

    .line 3
    iget-object v0, p0, Lc/a/a/a/h0/i;->c:[I

    iget-object v1, p0, Lc/a/a/a/h0/l;->f:Lc/a/a/a/h0/c;

    iget-object v1, v1, Lc/a/a/a/h0/c;->c:[I

    const/4 v2, 0x0

    aget v1, v1, v2

    iget-object v2, p0, Lc/a/a/a/h0/i;->a:Lc/a/a/a/h0/j;

    .line 4
    invoke-virtual {v2}, Lc/a/a/a/h0/g;->getAlpha()I

    move-result v2

    invoke-static {v1, v2}, Lc/a/a/a/w/a;->a(II)I

    move-result v1

    .line 5
    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([II)V

    return-void
.end method
