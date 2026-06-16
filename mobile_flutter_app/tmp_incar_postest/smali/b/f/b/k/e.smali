.class public Lb/f/b/k/e;
.super Ljava/lang/Object;
.source "ConstraintWidget.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lb/f/b/k/e$b;
    }
.end annotation


# static fields
.field public static C0:F = 0.5f


# instance fields
.field public A:Lb/f/b/k/d;

.field public A0:Lb/f/b/k/e;

.field public B:Lb/f/b/k/d;

.field public B0:Lb/f/b/k/e;

.field public C:Lb/f/b/k/d;

.field public D:Lb/f/b/k/d;

.field public E:Lb/f/b/k/d;

.field public F:Lb/f/b/k/d;

.field public G:Lb/f/b/k/d;

.field public H:Lb/f/b/k/d;

.field public I:[Lb/f/b/k/d;

.field public J:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lb/f/b/k/d;",
            ">;"
        }
    .end annotation
.end field

.field public K:[Z

.field public L:[Lb/f/b/k/e$b;

.field public M:Lb/f/b/k/e;

.field public N:I

.field public O:I

.field public P:F

.field public Q:I

.field public R:I

.field public S:I

.field public T:I

.field public U:I

.field public V:I

.field public W:I

.field public X:I

.field public Y:I

.field public Z:I

.field public a:Z

.field public a0:F

.field public b:Lb/f/b/k/n/c;

.field public b0:F

.field public c:Lb/f/b/k/n/c;

.field public c0:Ljava/lang/Object;

.field public d:Lb/f/b/k/n/j;

.field public d0:I

.field public e:Lb/f/b/k/n/l;

.field public e0:I

.field public f:[Z

.field public f0:Ljava/lang/String;

.field public g:[I

.field public g0:Ljava/lang/String;

.field public h:I

.field public h0:I

.field public i:I

.field public i0:I

.field public j:I

.field public j0:I

.field public k:I

.field public k0:I

.field public l:[I

.field public l0:Z

.field public m:I

.field public m0:Z

.field public n:I

.field public n0:Z

.field public o:F

.field public o0:Z

.field public p:I

.field public p0:Z

.field public q:I

.field public q0:Z

.field public r:F

.field public r0:Z

.field public s:Z

.field public s0:Z

.field public t:Z

.field public t0:I

.field public u:I

.field public u0:I

.field public v:F

.field public v0:Z

.field public w:[I

.field public w0:Z

.field public x:F

.field public x0:[F

.field public y:Z

.field public y0:[Lb/f/b/k/e;

.field public z:Z

.field public z0:[Lb/f/b/k/e;


# direct methods
.method public static constructor <clinit>()V
    .registers 0

    return-void
.end method

.method public constructor <init>()V
    .registers 11

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lb/f/b/k/e;->a:Z

    .line 3
    new-instance v1, Lb/f/b/k/n/j;

    invoke-direct {v1, p0}, Lb/f/b/k/n/j;-><init>(Lb/f/b/k/e;)V

    iput-object v1, p0, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    .line 4
    new-instance v1, Lb/f/b/k/n/l;

    invoke-direct {v1, p0}, Lb/f/b/k/n/l;-><init>(Lb/f/b/k/e;)V

    iput-object v1, p0, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    const/4 v1, 0x2

    new-array v2, v1, [Z

    .line 5
    fill-array-data v2, :array_118

    iput-object v2, p0, Lb/f/b/k/e;->f:[Z

    const/4 v2, 0x4

    new-array v3, v2, [I

    .line 6
    fill-array-data v3, :array_11e

    iput-object v3, p0, Lb/f/b/k/e;->g:[I

    const/4 v3, -0x1

    .line 7
    iput v3, p0, Lb/f/b/k/e;->h:I

    .line 8
    iput v3, p0, Lb/f/b/k/e;->i:I

    .line 9
    iput v0, p0, Lb/f/b/k/e;->j:I

    .line 10
    iput v0, p0, Lb/f/b/k/e;->k:I

    new-array v4, v1, [I

    .line 11
    iput-object v4, p0, Lb/f/b/k/e;->l:[I

    .line 12
    iput v0, p0, Lb/f/b/k/e;->m:I

    .line 13
    iput v0, p0, Lb/f/b/k/e;->n:I

    const/high16 v4, 0x3f800000    # 1.0f

    .line 14
    iput v4, p0, Lb/f/b/k/e;->o:F

    .line 15
    iput v0, p0, Lb/f/b/k/e;->p:I

    .line 16
    iput v0, p0, Lb/f/b/k/e;->q:I

    .line 17
    iput v4, p0, Lb/f/b/k/e;->r:F

    .line 18
    iput v3, p0, Lb/f/b/k/e;->u:I

    .line 19
    iput v4, p0, Lb/f/b/k/e;->v:F

    new-array v4, v1, [I

    .line 20
    fill-array-data v4, :array_12a

    iput-object v4, p0, Lb/f/b/k/e;->w:[I

    const/4 v4, 0x0

    .line 21
    iput v4, p0, Lb/f/b/k/e;->x:F

    .line 22
    iput-boolean v0, p0, Lb/f/b/k/e;->y:Z

    .line 23
    new-instance v5, Lb/f/b/k/d;

    sget-object v6, Lb/f/b/k/d$b;->LEFT:Lb/f/b/k/d$b;

    invoke-direct {v5, p0, v6}, Lb/f/b/k/d;-><init>(Lb/f/b/k/e;Lb/f/b/k/d$b;)V

    iput-object v5, p0, Lb/f/b/k/e;->A:Lb/f/b/k/d;

    .line 24
    new-instance v5, Lb/f/b/k/d;

    sget-object v6, Lb/f/b/k/d$b;->TOP:Lb/f/b/k/d$b;

    invoke-direct {v5, p0, v6}, Lb/f/b/k/d;-><init>(Lb/f/b/k/e;Lb/f/b/k/d$b;)V

    iput-object v5, p0, Lb/f/b/k/e;->B:Lb/f/b/k/d;

    .line 25
    new-instance v5, Lb/f/b/k/d;

    sget-object v6, Lb/f/b/k/d$b;->RIGHT:Lb/f/b/k/d$b;

    invoke-direct {v5, p0, v6}, Lb/f/b/k/d;-><init>(Lb/f/b/k/e;Lb/f/b/k/d$b;)V

    iput-object v5, p0, Lb/f/b/k/e;->C:Lb/f/b/k/d;

    .line 26
    new-instance v5, Lb/f/b/k/d;

    sget-object v6, Lb/f/b/k/d$b;->BOTTOM:Lb/f/b/k/d$b;

    invoke-direct {v5, p0, v6}, Lb/f/b/k/d;-><init>(Lb/f/b/k/e;Lb/f/b/k/d$b;)V

    iput-object v5, p0, Lb/f/b/k/e;->D:Lb/f/b/k/d;

    .line 27
    new-instance v5, Lb/f/b/k/d;

    sget-object v6, Lb/f/b/k/d$b;->BASELINE:Lb/f/b/k/d$b;

    invoke-direct {v5, p0, v6}, Lb/f/b/k/d;-><init>(Lb/f/b/k/e;Lb/f/b/k/d$b;)V

    iput-object v5, p0, Lb/f/b/k/e;->E:Lb/f/b/k/d;

    .line 28
    new-instance v5, Lb/f/b/k/d;

    sget-object v6, Lb/f/b/k/d$b;->CENTER_X:Lb/f/b/k/d$b;

    invoke-direct {v5, p0, v6}, Lb/f/b/k/d;-><init>(Lb/f/b/k/e;Lb/f/b/k/d$b;)V

    iput-object v5, p0, Lb/f/b/k/e;->F:Lb/f/b/k/d;

    .line 29
    new-instance v5, Lb/f/b/k/d;

    sget-object v6, Lb/f/b/k/d$b;->CENTER_Y:Lb/f/b/k/d$b;

    invoke-direct {v5, p0, v6}, Lb/f/b/k/d;-><init>(Lb/f/b/k/e;Lb/f/b/k/d$b;)V

    iput-object v5, p0, Lb/f/b/k/e;->G:Lb/f/b/k/d;

    .line 30
    new-instance v5, Lb/f/b/k/d;

    sget-object v6, Lb/f/b/k/d$b;->CENTER:Lb/f/b/k/d$b;

    invoke-direct {v5, p0, v6}, Lb/f/b/k/d;-><init>(Lb/f/b/k/e;Lb/f/b/k/d$b;)V

    iput-object v5, p0, Lb/f/b/k/e;->H:Lb/f/b/k/d;

    const/4 v6, 0x6

    new-array v6, v6, [Lb/f/b/k/d;

    .line 31
    iget-object v7, p0, Lb/f/b/k/e;->A:Lb/f/b/k/d;

    aput-object v7, v6, v0

    iget-object v7, p0, Lb/f/b/k/e;->C:Lb/f/b/k/d;

    const/4 v8, 0x1

    aput-object v7, v6, v8

    iget-object v7, p0, Lb/f/b/k/e;->B:Lb/f/b/k/d;

    aput-object v7, v6, v1

    iget-object v7, p0, Lb/f/b/k/e;->D:Lb/f/b/k/d;

    const/4 v9, 0x3

    aput-object v7, v6, v9

    iget-object v7, p0, Lb/f/b/k/e;->E:Lb/f/b/k/d;

    aput-object v7, v6, v2

    const/4 v2, 0x5

    aput-object v5, v6, v2

    iput-object v6, p0, Lb/f/b/k/e;->I:[Lb/f/b/k/d;

    .line 32
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lb/f/b/k/e;->J:Ljava/util/ArrayList;

    new-array v2, v1, [Z

    .line 33
    iput-object v2, p0, Lb/f/b/k/e;->K:[Z

    new-array v2, v1, [Lb/f/b/k/e$b;

    .line 34
    sget-object v5, Lb/f/b/k/e$b;->FIXED:Lb/f/b/k/e$b;

    aput-object v5, v2, v0

    aput-object v5, v2, v8

    iput-object v2, p0, Lb/f/b/k/e;->L:[Lb/f/b/k/e$b;

    const/4 v2, 0x0

    .line 35
    iput-object v2, p0, Lb/f/b/k/e;->M:Lb/f/b/k/e;

    .line 36
    iput v0, p0, Lb/f/b/k/e;->N:I

    .line 37
    iput v0, p0, Lb/f/b/k/e;->O:I

    .line 38
    iput v4, p0, Lb/f/b/k/e;->P:F

    .line 39
    iput v3, p0, Lb/f/b/k/e;->Q:I

    .line 40
    iput v0, p0, Lb/f/b/k/e;->R:I

    .line 41
    iput v0, p0, Lb/f/b/k/e;->S:I

    .line 42
    iput v0, p0, Lb/f/b/k/e;->T:I

    .line 43
    iput v0, p0, Lb/f/b/k/e;->U:I

    .line 44
    iput v0, p0, Lb/f/b/k/e;->V:I

    .line 45
    iput v0, p0, Lb/f/b/k/e;->W:I

    .line 46
    iput v0, p0, Lb/f/b/k/e;->X:I

    .line 47
    sget v3, Lb/f/b/k/e;->C0:F

    iput v3, p0, Lb/f/b/k/e;->a0:F

    .line 48
    iput v3, p0, Lb/f/b/k/e;->b0:F

    .line 49
    iput v0, p0, Lb/f/b/k/e;->d0:I

    .line 50
    iput v0, p0, Lb/f/b/k/e;->e0:I

    .line 51
    iput-object v2, p0, Lb/f/b/k/e;->f0:Ljava/lang/String;

    .line 52
    iput-object v2, p0, Lb/f/b/k/e;->g0:Ljava/lang/String;

    .line 53
    iput-boolean v0, p0, Lb/f/b/k/e;->r0:Z

    .line 54
    iput-boolean v0, p0, Lb/f/b/k/e;->s0:Z

    .line 55
    iput v0, p0, Lb/f/b/k/e;->t0:I

    .line 56
    iput v0, p0, Lb/f/b/k/e;->u0:I

    new-array v3, v1, [F

    .line 57
    fill-array-data v3, :array_132

    iput-object v3, p0, Lb/f/b/k/e;->x0:[F

    new-array v3, v1, [Lb/f/b/k/e;

    aput-object v2, v3, v0

    aput-object v2, v3, v8

    .line 58
    iput-object v3, p0, Lb/f/b/k/e;->y0:[Lb/f/b/k/e;

    new-array v1, v1, [Lb/f/b/k/e;

    aput-object v2, v1, v0

    aput-object v2, v1, v8

    .line 59
    iput-object v1, p0, Lb/f/b/k/e;->z0:[Lb/f/b/k/e;

    .line 60
    iput-object v2, p0, Lb/f/b/k/e;->A0:Lb/f/b/k/e;

    .line 61
    iput-object v2, p0, Lb/f/b/k/e;->B0:Lb/f/b/k/e;

    .line 62
    invoke-virtual {p0}, Lb/f/b/k/e;->b()V

    return-void

    :array_118
    .array-data 1
        0x1t
        0x1t
    .end array-data

    nop

    :array_11e
    .array-data 4
        0x0
        0x0
        0x0
        0x0
    .end array-data

    :array_12a
    .array-data 4
        0x7fffffff
        0x7fffffff
    .end array-data

    :array_132
    .array-data 4
        -0x40800000    # -1.0f
        -0x40800000    # -1.0f
    .end array-data
.end method


# virtual methods
.method public A()I
    .registers 3

    .line 1
    iget v0, p0, Lb/f/b/k/e;->e0:I

    const/16 v1, 0x8

    if-ne v0, v1, :cond_8

    const/4 v0, 0x0

    return v0

    .line 2
    :cond_8
    iget v0, p0, Lb/f/b/k/e;->N:I

    return v0
.end method

.method public B()I
    .registers 3

    .line 1
    iget-object v0, p0, Lb/f/b/k/e;->M:Lb/f/b/k/e;

    if-eqz v0, :cond_10

    instance-of v1, v0, Lb/f/b/k/f;

    if-eqz v1, :cond_10

    .line 2
    check-cast v0, Lb/f/b/k/f;

    iget v0, v0, Lb/f/b/k/f;->K0:I

    iget v1, p0, Lb/f/b/k/e;->R:I

    add-int/2addr v0, v1

    return v0

    .line 3
    :cond_10
    iget v0, p0, Lb/f/b/k/e;->R:I

    return v0
.end method

.method public C()I
    .registers 3

    .line 1
    iget-object v0, p0, Lb/f/b/k/e;->M:Lb/f/b/k/e;

    if-eqz v0, :cond_10

    instance-of v1, v0, Lb/f/b/k/f;

    if-eqz v1, :cond_10

    .line 2
    check-cast v0, Lb/f/b/k/f;

    iget v0, v0, Lb/f/b/k/f;->L0:I

    iget v1, p0, Lb/f/b/k/e;->S:I

    add-int/2addr v0, v1

    return v0

    .line 3
    :cond_10
    iget v0, p0, Lb/f/b/k/e;->S:I

    return v0
.end method

.method public D()Z
    .registers 2

    .line 1
    iget-boolean v0, p0, Lb/f/b/k/e;->y:Z

    return v0
.end method

.method public E()Z
    .registers 3

    .line 1
    iget-object v0, p0, Lb/f/b/k/e;->A:Lb/f/b/k/d;

    iget-object v1, v0, Lb/f/b/k/d;->d:Lb/f/b/k/d;

    if-eqz v1, :cond_a

    iget-object v1, v1, Lb/f/b/k/d;->d:Lb/f/b/k/d;

    if-eq v1, v0, :cond_14

    :cond_a
    iget-object v0, p0, Lb/f/b/k/e;->C:Lb/f/b/k/d;

    iget-object v1, v0, Lb/f/b/k/d;->d:Lb/f/b/k/d;

    if-eqz v1, :cond_16

    iget-object v1, v1, Lb/f/b/k/d;->d:Lb/f/b/k/d;

    if-ne v1, v0, :cond_16

    :cond_14
    const/4 v0, 0x1

    return v0

    :cond_16
    const/4 v0, 0x0

    return v0
.end method

.method public F()Z
    .registers 2

    .line 1
    iget-boolean v0, p0, Lb/f/b/k/e;->z:Z

    return v0
.end method

.method public G()Z
    .registers 3

    .line 1
    iget-object v0, p0, Lb/f/b/k/e;->B:Lb/f/b/k/d;

    iget-object v1, v0, Lb/f/b/k/d;->d:Lb/f/b/k/d;

    if-eqz v1, :cond_a

    iget-object v1, v1, Lb/f/b/k/d;->d:Lb/f/b/k/d;

    if-eq v1, v0, :cond_14

    :cond_a
    iget-object v0, p0, Lb/f/b/k/e;->D:Lb/f/b/k/d;

    iget-object v1, v0, Lb/f/b/k/d;->d:Lb/f/b/k/d;

    if-eqz v1, :cond_16

    iget-object v1, v1, Lb/f/b/k/d;->d:Lb/f/b/k/d;

    if-ne v1, v0, :cond_16

    :cond_14
    const/4 v0, 0x1

    return v0

    :cond_16
    const/4 v0, 0x0

    return v0
.end method

.method public H()V
    .registers 7

    .line 1
    iget-object v0, p0, Lb/f/b/k/e;->A:Lb/f/b/k/d;

    invoke-virtual {v0}, Lb/f/b/k/d;->i()V

    .line 2
    iget-object v0, p0, Lb/f/b/k/e;->B:Lb/f/b/k/d;

    invoke-virtual {v0}, Lb/f/b/k/d;->i()V

    .line 3
    iget-object v0, p0, Lb/f/b/k/e;->C:Lb/f/b/k/d;

    invoke-virtual {v0}, Lb/f/b/k/d;->i()V

    .line 4
    iget-object v0, p0, Lb/f/b/k/e;->D:Lb/f/b/k/d;

    invoke-virtual {v0}, Lb/f/b/k/d;->i()V

    .line 5
    iget-object v0, p0, Lb/f/b/k/e;->E:Lb/f/b/k/d;

    invoke-virtual {v0}, Lb/f/b/k/d;->i()V

    .line 6
    iget-object v0, p0, Lb/f/b/k/e;->F:Lb/f/b/k/d;

    invoke-virtual {v0}, Lb/f/b/k/d;->i()V

    .line 7
    iget-object v0, p0, Lb/f/b/k/e;->G:Lb/f/b/k/d;

    invoke-virtual {v0}, Lb/f/b/k/d;->i()V

    .line 8
    iget-object v0, p0, Lb/f/b/k/e;->H:Lb/f/b/k/d;

    invoke-virtual {v0}, Lb/f/b/k/d;->i()V

    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lb/f/b/k/e;->M:Lb/f/b/k/e;

    const/4 v1, 0x0

    .line 10
    iput v1, p0, Lb/f/b/k/e;->x:F

    const/4 v2, 0x0

    .line 11
    iput v2, p0, Lb/f/b/k/e;->N:I

    .line 12
    iput v2, p0, Lb/f/b/k/e;->O:I

    .line 13
    iput v1, p0, Lb/f/b/k/e;->P:F

    const/4 v1, -0x1

    .line 14
    iput v1, p0, Lb/f/b/k/e;->Q:I

    .line 15
    iput v2, p0, Lb/f/b/k/e;->R:I

    .line 16
    iput v2, p0, Lb/f/b/k/e;->S:I

    .line 17
    iput v2, p0, Lb/f/b/k/e;->V:I

    .line 18
    iput v2, p0, Lb/f/b/k/e;->W:I

    .line 19
    iput v2, p0, Lb/f/b/k/e;->X:I

    .line 20
    iput v2, p0, Lb/f/b/k/e;->Y:I

    .line 21
    iput v2, p0, Lb/f/b/k/e;->Z:I

    .line 22
    sget v3, Lb/f/b/k/e;->C0:F

    iput v3, p0, Lb/f/b/k/e;->a0:F

    .line 23
    iput v3, p0, Lb/f/b/k/e;->b0:F

    .line 24
    iget-object v3, p0, Lb/f/b/k/e;->L:[Lb/f/b/k/e$b;

    sget-object v4, Lb/f/b/k/e$b;->FIXED:Lb/f/b/k/e$b;

    aput-object v4, v3, v2

    const/4 v5, 0x1

    .line 25
    aput-object v4, v3, v5

    .line 26
    iput-object v0, p0, Lb/f/b/k/e;->c0:Ljava/lang/Object;

    .line 27
    iput v2, p0, Lb/f/b/k/e;->d0:I

    .line 28
    iput v2, p0, Lb/f/b/k/e;->e0:I

    .line 29
    iput-object v0, p0, Lb/f/b/k/e;->g0:Ljava/lang/String;

    .line 30
    iput-boolean v2, p0, Lb/f/b/k/e;->p0:Z

    .line 31
    iput-boolean v2, p0, Lb/f/b/k/e;->q0:Z

    .line 32
    iput v2, p0, Lb/f/b/k/e;->t0:I

    .line 33
    iput v2, p0, Lb/f/b/k/e;->u0:I

    .line 34
    iput-boolean v2, p0, Lb/f/b/k/e;->v0:Z

    .line 35
    iput-boolean v2, p0, Lb/f/b/k/e;->w0:Z

    .line 36
    iget-object v0, p0, Lb/f/b/k/e;->x0:[F

    const/high16 v3, -0x40800000    # -1.0f

    aput v3, v0, v2

    .line 37
    aput v3, v0, v5

    .line 38
    iput v1, p0, Lb/f/b/k/e;->h:I

    .line 39
    iput v1, p0, Lb/f/b/k/e;->i:I

    .line 40
    iget-object v0, p0, Lb/f/b/k/e;->w:[I

    const v3, 0x7fffffff

    aput v3, v0, v2

    .line 41
    aput v3, v0, v5

    .line 42
    iput v2, p0, Lb/f/b/k/e;->j:I

    .line 43
    iput v2, p0, Lb/f/b/k/e;->k:I

    const/high16 v0, 0x3f800000    # 1.0f

    .line 44
    iput v0, p0, Lb/f/b/k/e;->o:F

    .line 45
    iput v0, p0, Lb/f/b/k/e;->r:F

    .line 46
    iput v3, p0, Lb/f/b/k/e;->n:I

    .line 47
    iput v3, p0, Lb/f/b/k/e;->q:I

    .line 48
    iput v2, p0, Lb/f/b/k/e;->m:I

    .line 49
    iput v2, p0, Lb/f/b/k/e;->p:I

    .line 50
    iput v1, p0, Lb/f/b/k/e;->u:I

    .line 51
    iput v0, p0, Lb/f/b/k/e;->v:F

    .line 52
    iput-boolean v2, p0, Lb/f/b/k/e;->r0:Z

    .line 53
    iput-boolean v2, p0, Lb/f/b/k/e;->s0:Z

    .line 54
    iget-object v0, p0, Lb/f/b/k/e;->f:[Z

    aput-boolean v5, v0, v2

    .line 55
    aput-boolean v5, v0, v5

    .line 56
    iget-object v0, p0, Lb/f/b/k/e;->K:[Z

    aput-boolean v2, v0, v2

    .line 57
    aput-boolean v2, v0, v5

    return-void
.end method

.method public I()V
    .registers 4

    .line 1
    invoke-virtual {p0}, Lb/f/b/k/e;->t()Lb/f/b/k/e;

    move-result-object v0

    if-eqz v0, :cond_17

    .line 2
    instance-of v0, v0, Lb/f/b/k/f;

    if-eqz v0, :cond_17

    .line 3
    invoke-virtual {p0}, Lb/f/b/k/e;->t()Lb/f/b/k/e;

    move-result-object v0

    check-cast v0, Lb/f/b/k/f;

    .line 4
    invoke-virtual {v0}, Lb/f/b/k/f;->O()Z

    move-result v0

    if-eqz v0, :cond_17

    return-void

    :cond_17
    const/4 v0, 0x0

    .line 5
    iget-object v1, p0, Lb/f/b/k/e;->J:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    :goto_1e
    if-ge v0, v1, :cond_2e

    .line 6
    iget-object v2, p0, Lb/f/b/k/e;->J:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb/f/b/k/d;

    .line 7
    invoke-virtual {v2}, Lb/f/b/k/d;->i()V

    add-int/lit8 v0, v0, 0x1

    goto :goto_1e

    :cond_2e
    return-void
.end method

.method public a(I)F
    .registers 3

    if-nez p1, :cond_5

    .line 14
    iget p1, p0, Lb/f/b/k/e;->a0:F

    return p1

    :cond_5
    const/4 v0, 0x1

    if-ne p1, v0, :cond_b

    .line 15
    iget p1, p0, Lb/f/b/k/e;->b0:F

    return p1

    :cond_b
    const/high16 p1, -0x40800000    # -1.0f

    return p1
.end method

.method public a(Lb/f/b/k/d$b;)Lb/f/b/k/d;
    .registers 4

    .line 139
    sget-object v0, Lb/f/b/k/e$a;->a:[I

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_30

    .line 140
    new-instance v0, Ljava/lang/AssertionError;

    invoke-virtual {p1}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    :pswitch_15
    const/4 p1, 0x0

    return-object p1

    .line 141
    :pswitch_17
    iget-object p1, p0, Lb/f/b/k/e;->G:Lb/f/b/k/d;

    return-object p1

    .line 142
    :pswitch_1a
    iget-object p1, p0, Lb/f/b/k/e;->F:Lb/f/b/k/d;

    return-object p1

    .line 143
    :pswitch_1d
    iget-object p1, p0, Lb/f/b/k/e;->H:Lb/f/b/k/d;

    return-object p1

    .line 144
    :pswitch_20
    iget-object p1, p0, Lb/f/b/k/e;->E:Lb/f/b/k/d;

    return-object p1

    .line 145
    :pswitch_23
    iget-object p1, p0, Lb/f/b/k/e;->D:Lb/f/b/k/d;

    return-object p1

    .line 146
    :pswitch_26
    iget-object p1, p0, Lb/f/b/k/e;->C:Lb/f/b/k/d;

    return-object p1

    .line 147
    :pswitch_29
    iget-object p1, p0, Lb/f/b/k/e;->B:Lb/f/b/k/d;

    return-object p1

    .line 148
    :pswitch_2c
    iget-object p1, p0, Lb/f/b/k/e;->A:Lb/f/b/k/d;

    return-object p1

    nop

    :pswitch_data_30
    .packed-switch 0x1
        :pswitch_2c
        :pswitch_29
        :pswitch_26
        :pswitch_23
        :pswitch_20
        :pswitch_1d
        :pswitch_1a
        :pswitch_17
        :pswitch_15
    .end packed-switch
.end method

.method public a(F)V
    .registers 2

    .line 22
    iput p1, p0, Lb/f/b/k/e;->a0:F

    return-void
.end method

.method public a(II)V
    .registers 3

    .line 36
    iput p1, p0, Lb/f/b/k/e;->R:I

    sub-int/2addr p2, p1

    .line 37
    iput p2, p0, Lb/f/b/k/e;->N:I

    .line 38
    iget p1, p0, Lb/f/b/k/e;->Y:I

    if-ge p2, p1, :cond_b

    .line 39
    iput p1, p0, Lb/f/b/k/e;->N:I

    :cond_b
    return-void
.end method

.method public a(IIIF)V
    .registers 5

    .line 16
    iput p1, p0, Lb/f/b/k/e;->j:I

    .line 17
    iput p2, p0, Lb/f/b/k/e;->m:I

    const p1, 0x7fffffff

    if-ne p3, p1, :cond_a

    const/4 p3, 0x0

    .line 18
    :cond_a
    iput p3, p0, Lb/f/b/k/e;->n:I

    .line 19
    iput p4, p0, Lb/f/b/k/e;->o:F

    const/4 p1, 0x0

    cmpl-float p1, p4, p1

    if-lez p1, :cond_20

    const/high16 p1, 0x3f800000    # 1.0f

    cmpg-float p1, p4, p1

    if-gez p1, :cond_20

    .line 20
    iget p1, p0, Lb/f/b/k/e;->j:I

    if-nez p1, :cond_20

    const/4 p1, 0x2

    .line 21
    iput p1, p0, Lb/f/b/k/e;->j:I

    :cond_20
    return-void
.end method

.method public a(IIII)V
    .registers 6

    sub-int/2addr p3, p1

    sub-int/2addr p4, p2

    .line 23
    iput p1, p0, Lb/f/b/k/e;->R:I

    .line 24
    iput p2, p0, Lb/f/b/k/e;->S:I

    .line 25
    iget p1, p0, Lb/f/b/k/e;->e0:I

    const/4 p2, 0x0

    const/16 v0, 0x8

    if-ne p1, v0, :cond_12

    .line 26
    iput p2, p0, Lb/f/b/k/e;->N:I

    .line 27
    iput p2, p0, Lb/f/b/k/e;->O:I

    return-void

    .line 28
    :cond_12
    iget-object p1, p0, Lb/f/b/k/e;->L:[Lb/f/b/k/e$b;

    aget-object p1, p1, p2

    sget-object p2, Lb/f/b/k/e$b;->FIXED:Lb/f/b/k/e$b;

    if-ne p1, p2, :cond_1f

    iget p1, p0, Lb/f/b/k/e;->N:I

    if-ge p3, p1, :cond_1f

    move p3, p1

    .line 29
    :cond_1f
    iget-object p1, p0, Lb/f/b/k/e;->L:[Lb/f/b/k/e$b;

    const/4 p2, 0x1

    aget-object p1, p1, p2

    sget-object p2, Lb/f/b/k/e$b;->FIXED:Lb/f/b/k/e$b;

    if-ne p1, p2, :cond_2d

    iget p1, p0, Lb/f/b/k/e;->O:I

    if-ge p4, p1, :cond_2d

    move p4, p1

    .line 30
    :cond_2d
    iput p3, p0, Lb/f/b/k/e;->N:I

    .line 31
    iput p4, p0, Lb/f/b/k/e;->O:I

    .line 32
    iget p1, p0, Lb/f/b/k/e;->Z:I

    if-ge p4, p1, :cond_37

    .line 33
    iput p1, p0, Lb/f/b/k/e;->O:I

    .line 34
    :cond_37
    iget p1, p0, Lb/f/b/k/e;->N:I

    iget p2, p0, Lb/f/b/k/e;->Y:I

    if-ge p1, p2, :cond_3f

    .line 35
    iput p2, p0, Lb/f/b/k/e;->N:I

    :cond_3f
    return-void
.end method

.method public a(IZ)V
    .registers 4

    .line 2
    iget-object v0, p0, Lb/f/b/k/e;->K:[Z

    aput-boolean p2, v0, p1

    return-void
.end method

.method public a(Lb/f/b/c;)V
    .registers 3

    .line 3
    iget-object v0, p0, Lb/f/b/k/e;->A:Lb/f/b/k/d;

    invoke-virtual {v0, p1}, Lb/f/b/k/d;->a(Lb/f/b/c;)V

    .line 4
    iget-object v0, p0, Lb/f/b/k/e;->B:Lb/f/b/k/d;

    invoke-virtual {v0, p1}, Lb/f/b/k/d;->a(Lb/f/b/c;)V

    .line 5
    iget-object v0, p0, Lb/f/b/k/e;->C:Lb/f/b/k/d;

    invoke-virtual {v0, p1}, Lb/f/b/k/d;->a(Lb/f/b/c;)V

    .line 6
    iget-object v0, p0, Lb/f/b/k/e;->D:Lb/f/b/k/d;

    invoke-virtual {v0, p1}, Lb/f/b/k/d;->a(Lb/f/b/c;)V

    .line 7
    iget-object v0, p0, Lb/f/b/k/e;->E:Lb/f/b/k/d;

    invoke-virtual {v0, p1}, Lb/f/b/k/d;->a(Lb/f/b/c;)V

    .line 8
    iget-object v0, p0, Lb/f/b/k/e;->H:Lb/f/b/k/d;

    invoke-virtual {v0, p1}, Lb/f/b/k/d;->a(Lb/f/b/c;)V

    .line 9
    iget-object v0, p0, Lb/f/b/k/e;->F:Lb/f/b/k/d;

    invoke-virtual {v0, p1}, Lb/f/b/k/d;->a(Lb/f/b/c;)V

    .line 10
    iget-object v0, p0, Lb/f/b/k/e;->G:Lb/f/b/k/d;

    invoke-virtual {v0, p1}, Lb/f/b/k/d;->a(Lb/f/b/c;)V

    return-void
.end method

.method public a(Lb/f/b/d;)V
    .registers 45

    move-object/from16 v13, p0

    move-object/from16 v9, p1

    .line 150
    iget-object v0, v13, Lb/f/b/k/e;->A:Lb/f/b/k/d;

    invoke-virtual {v9, v0}, Lb/f/b/d;->a(Ljava/lang/Object;)Lb/f/b/i;

    move-result-object v7

    .line 151
    iget-object v0, v13, Lb/f/b/k/e;->C:Lb/f/b/k/d;

    invoke-virtual {v9, v0}, Lb/f/b/d;->a(Ljava/lang/Object;)Lb/f/b/i;

    move-result-object v6

    .line 152
    iget-object v0, v13, Lb/f/b/k/e;->B:Lb/f/b/k/d;

    invoke-virtual {v9, v0}, Lb/f/b/d;->a(Ljava/lang/Object;)Lb/f/b/i;

    move-result-object v4

    .line 153
    iget-object v0, v13, Lb/f/b/k/e;->D:Lb/f/b/k/d;

    invoke-virtual {v9, v0}, Lb/f/b/d;->a(Ljava/lang/Object;)Lb/f/b/i;

    move-result-object v3

    .line 154
    iget-object v0, v13, Lb/f/b/k/e;->E:Lb/f/b/k/d;

    invoke-virtual {v9, v0}, Lb/f/b/d;->a(Ljava/lang/Object;)Lb/f/b/i;

    move-result-object v1

    .line 155
    sget-object v0, Lb/f/b/d;->r:Lb/f/b/e;

    const-wide/16 v10, 0x1

    if-eqz v0, :cond_2d

    .line 156
    iget-wide v14, v0, Lb/f/b/e;->y:J

    add-long/2addr v14, v10

    iput-wide v14, v0, Lb/f/b/e;->y:J

    .line 157
    :cond_2d
    iget-object v0, v13, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    iget-object v2, v0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-boolean v2, v2, Lb/f/b/k/n/f;->j:Z

    const/4 v12, 0x0

    if-eqz v2, :cond_d9

    iget-object v0, v0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget-boolean v0, v0, Lb/f/b/k/n/f;->j:Z

    if-eqz v0, :cond_d9

    iget-object v0, v13, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v2, v0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-boolean v2, v2, Lb/f/b/k/n/f;->j:Z

    if-eqz v2, :cond_d9

    iget-object v0, v0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget-boolean v0, v0, Lb/f/b/k/n/f;->j:Z

    if-eqz v0, :cond_d9

    .line 158
    sget-object v0, Lb/f/b/d;->r:Lb/f/b/e;

    if-eqz v0, :cond_53

    .line 159
    iget-wide v14, v0, Lb/f/b/e;->r:J

    add-long/2addr v14, v10

    iput-wide v14, v0, Lb/f/b/e;->r:J

    .line 160
    :cond_53
    iget-object v0, v13, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    iget-object v0, v0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget v0, v0, Lb/f/b/k/n/f;->g:I

    invoke-virtual {v9, v7, v0}, Lb/f/b/d;->a(Lb/f/b/i;I)V

    .line 161
    iget-object v0, v13, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    iget-object v0, v0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget v0, v0, Lb/f/b/k/n/f;->g:I

    invoke-virtual {v9, v6, v0}, Lb/f/b/d;->a(Lb/f/b/i;I)V

    .line 162
    iget-object v0, v13, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v0, v0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget v0, v0, Lb/f/b/k/n/f;->g:I

    invoke-virtual {v9, v4, v0}, Lb/f/b/d;->a(Lb/f/b/i;I)V

    .line 163
    iget-object v0, v13, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v0, v0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget v0, v0, Lb/f/b/k/n/f;->g:I

    invoke-virtual {v9, v3, v0}, Lb/f/b/d;->a(Lb/f/b/i;I)V

    .line 164
    iget-object v0, v13, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v0, v0, Lb/f/b/k/n/l;->k:Lb/f/b/k/n/f;

    iget v0, v0, Lb/f/b/k/n/f;->g:I

    invoke-virtual {v9, v1, v0}, Lb/f/b/d;->a(Lb/f/b/i;I)V

    .line 165
    iget-object v0, v13, Lb/f/b/k/e;->M:Lb/f/b/k/e;

    if-eqz v0, :cond_d8

    if-eqz v0, :cond_90

    .line 166
    iget-object v0, v0, Lb/f/b/k/e;->L:[Lb/f/b/k/e$b;

    aget-object v0, v0, v12

    sget-object v1, Lb/f/b/k/e$b;->WRAP_CONTENT:Lb/f/b/k/e$b;

    if-ne v0, v1, :cond_90

    const/4 v0, 0x1

    goto :goto_91

    :cond_90
    const/4 v0, 0x0

    .line 167
    :goto_91
    iget-object v1, v13, Lb/f/b/k/e;->M:Lb/f/b/k/e;

    if-eqz v1, :cond_a0

    iget-object v1, v1, Lb/f/b/k/e;->L:[Lb/f/b/k/e$b;

    const/4 v2, 0x1

    aget-object v1, v1, v2

    sget-object v2, Lb/f/b/k/e$b;->WRAP_CONTENT:Lb/f/b/k/e$b;

    if-ne v1, v2, :cond_a0

    const/4 v1, 0x1

    goto :goto_a1

    :cond_a0
    const/4 v1, 0x0

    :goto_a1
    if-eqz v0, :cond_bc

    .line 168
    iget-object v0, v13, Lb/f/b/k/e;->f:[Z

    aget-boolean v0, v0, v12

    if-eqz v0, :cond_bc

    invoke-virtual/range {p0 .. p0}, Lb/f/b/k/e;->E()Z

    move-result v0

    if-nez v0, :cond_bc

    .line 169
    iget-object v0, v13, Lb/f/b/k/e;->M:Lb/f/b/k/e;

    iget-object v0, v0, Lb/f/b/k/e;->C:Lb/f/b/k/d;

    invoke-virtual {v9, v0}, Lb/f/b/d;->a(Ljava/lang/Object;)Lb/f/b/i;

    move-result-object v0

    const/16 v2, 0x8

    .line 170
    invoke-virtual {v9, v0, v6, v12, v2}, Lb/f/b/d;->b(Lb/f/b/i;Lb/f/b/i;II)V

    :cond_bc
    if-eqz v1, :cond_d8

    .line 171
    iget-object v0, v13, Lb/f/b/k/e;->f:[Z

    const/4 v1, 0x1

    aget-boolean v0, v0, v1

    if-eqz v0, :cond_d8

    invoke-virtual/range {p0 .. p0}, Lb/f/b/k/e;->G()Z

    move-result v0

    if-nez v0, :cond_d8

    .line 172
    iget-object v0, v13, Lb/f/b/k/e;->M:Lb/f/b/k/e;

    iget-object v0, v0, Lb/f/b/k/e;->D:Lb/f/b/k/d;

    invoke-virtual {v9, v0}, Lb/f/b/d;->a(Ljava/lang/Object;)Lb/f/b/i;

    move-result-object v0

    const/16 v1, 0x8

    .line 173
    invoke-virtual {v9, v0, v3, v12, v1}, Lb/f/b/d;->b(Lb/f/b/i;Lb/f/b/i;II)V

    :cond_d8
    return-void

    .line 174
    :cond_d9
    sget-object v0, Lb/f/b/d;->r:Lb/f/b/e;

    if-eqz v0, :cond_e2

    .line 175
    iget-wide v14, v0, Lb/f/b/e;->s:J

    add-long/2addr v14, v10

    iput-wide v14, v0, Lb/f/b/e;->s:J

    .line 176
    :cond_e2
    iget-object v0, v13, Lb/f/b/k/e;->M:Lb/f/b/k/e;

    if-eqz v0, :cond_179

    if-eqz v0, :cond_f2

    .line 177
    iget-object v0, v0, Lb/f/b/k/e;->L:[Lb/f/b/k/e$b;

    aget-object v0, v0, v12

    sget-object v2, Lb/f/b/k/e$b;->WRAP_CONTENT:Lb/f/b/k/e$b;

    if-ne v0, v2, :cond_f2

    const/4 v0, 0x1

    goto :goto_f3

    :cond_f2
    const/4 v0, 0x0

    .line 178
    :goto_f3
    iget-object v2, v13, Lb/f/b/k/e;->M:Lb/f/b/k/e;

    if-eqz v2, :cond_102

    iget-object v2, v2, Lb/f/b/k/e;->L:[Lb/f/b/k/e$b;

    const/4 v5, 0x1

    aget-object v2, v2, v5

    sget-object v5, Lb/f/b/k/e$b;->WRAP_CONTENT:Lb/f/b/k/e$b;

    if-ne v2, v5, :cond_102

    const/4 v2, 0x1

    goto :goto_103

    :cond_102
    const/4 v2, 0x0

    .line 179
    :goto_103
    invoke-virtual {v13, v12}, Lb/f/b/k/e;->g(I)Z

    move-result v5

    if-eqz v5, :cond_112

    .line 180
    iget-object v5, v13, Lb/f/b/k/e;->M:Lb/f/b/k/e;

    check-cast v5, Lb/f/b/k/f;

    invoke-virtual {v5, v13, v12}, Lb/f/b/k/f;->a(Lb/f/b/k/e;I)V

    const/4 v5, 0x1

    goto :goto_116

    .line 181
    :cond_112
    invoke-virtual/range {p0 .. p0}, Lb/f/b/k/e;->E()Z

    move-result v5

    :goto_116
    const/4 v8, 0x1

    .line 182
    invoke-virtual {v13, v8}, Lb/f/b/k/e;->g(I)Z

    move-result v10

    if-eqz v10, :cond_126

    .line 183
    iget-object v10, v13, Lb/f/b/k/e;->M:Lb/f/b/k/e;

    check-cast v10, Lb/f/b/k/f;

    invoke-virtual {v10, v13, v8}, Lb/f/b/k/f;->a(Lb/f/b/k/e;I)V

    const/4 v8, 0x1

    goto :goto_12a

    .line 184
    :cond_126
    invoke-virtual/range {p0 .. p0}, Lb/f/b/k/e;->G()Z

    move-result v8

    :goto_12a
    if-nez v5, :cond_14c

    if-eqz v0, :cond_14c

    .line 185
    iget v10, v13, Lb/f/b/k/e;->e0:I

    const/16 v11, 0x8

    if-eq v10, v11, :cond_14c

    iget-object v10, v13, Lb/f/b/k/e;->A:Lb/f/b/k/d;

    iget-object v10, v10, Lb/f/b/k/d;->d:Lb/f/b/k/d;

    if-nez v10, :cond_14c

    iget-object v10, v13, Lb/f/b/k/e;->C:Lb/f/b/k/d;

    iget-object v10, v10, Lb/f/b/k/d;->d:Lb/f/b/k/d;

    if-nez v10, :cond_14c

    .line 186
    iget-object v10, v13, Lb/f/b/k/e;->M:Lb/f/b/k/e;

    iget-object v10, v10, Lb/f/b/k/e;->C:Lb/f/b/k/d;

    invoke-virtual {v9, v10}, Lb/f/b/d;->a(Ljava/lang/Object;)Lb/f/b/i;

    move-result-object v10

    const/4 v11, 0x1

    .line 187
    invoke-virtual {v9, v10, v6, v12, v11}, Lb/f/b/d;->b(Lb/f/b/i;Lb/f/b/i;II)V

    :cond_14c
    if-nez v8, :cond_172

    if-eqz v2, :cond_172

    .line 188
    iget v10, v13, Lb/f/b/k/e;->e0:I

    const/16 v11, 0x8

    if-eq v10, v11, :cond_172

    iget-object v10, v13, Lb/f/b/k/e;->B:Lb/f/b/k/d;

    iget-object v10, v10, Lb/f/b/k/d;->d:Lb/f/b/k/d;

    if-nez v10, :cond_172

    iget-object v10, v13, Lb/f/b/k/e;->D:Lb/f/b/k/d;

    iget-object v10, v10, Lb/f/b/k/d;->d:Lb/f/b/k/d;

    if-nez v10, :cond_172

    iget-object v10, v13, Lb/f/b/k/e;->E:Lb/f/b/k/d;

    if-nez v10, :cond_172

    .line 189
    iget-object v10, v13, Lb/f/b/k/e;->M:Lb/f/b/k/e;

    iget-object v10, v10, Lb/f/b/k/e;->D:Lb/f/b/k/d;

    invoke-virtual {v9, v10}, Lb/f/b/d;->a(Ljava/lang/Object;)Lb/f/b/i;

    move-result-object v10

    const/4 v11, 0x1

    .line 190
    invoke-virtual {v9, v10, v3, v12, v11}, Lb/f/b/d;->b(Lb/f/b/i;Lb/f/b/i;II)V

    :cond_172
    move v15, v0

    move v0, v2

    move/from16 v28, v5

    move/from16 v27, v8

    goto :goto_17f

    :cond_179
    const/4 v0, 0x0

    const/4 v15, 0x0

    const/16 v27, 0x0

    const/16 v28, 0x0

    .line 191
    :goto_17f
    iget v2, v13, Lb/f/b/k/e;->N:I

    .line 192
    iget v5, v13, Lb/f/b/k/e;->Y:I

    if-ge v2, v5, :cond_186

    move v2, v5

    .line 193
    :cond_186
    iget v5, v13, Lb/f/b/k/e;->O:I

    .line 194
    iget v8, v13, Lb/f/b/k/e;->Z:I

    if-ge v5, v8, :cond_18d

    move v5, v8

    .line 195
    :cond_18d
    iget-object v8, v13, Lb/f/b/k/e;->L:[Lb/f/b/k/e$b;

    aget-object v8, v8, v12

    sget-object v10, Lb/f/b/k/e$b;->MATCH_CONSTRAINT:Lb/f/b/k/e$b;

    if-eq v8, v10, :cond_197

    const/4 v8, 0x1

    goto :goto_198

    :cond_197
    const/4 v8, 0x0

    .line 196
    :goto_198
    iget-object v10, v13, Lb/f/b/k/e;->L:[Lb/f/b/k/e$b;

    const/4 v11, 0x1

    aget-object v10, v10, v11

    sget-object v11, Lb/f/b/k/e$b;->MATCH_CONSTRAINT:Lb/f/b/k/e$b;

    if-eq v10, v11, :cond_1a3

    const/4 v10, 0x1

    goto :goto_1a4

    :cond_1a3
    const/4 v10, 0x0

    .line 197
    :goto_1a4
    iget v11, v13, Lb/f/b/k/e;->Q:I

    iput v11, v13, Lb/f/b/k/e;->u:I

    .line 198
    iget v11, v13, Lb/f/b/k/e;->P:F

    iput v11, v13, Lb/f/b/k/e;->v:F

    .line 199
    iget v14, v13, Lb/f/b/k/e;->j:I

    .line 200
    iget v12, v13, Lb/f/b/k/e;->k:I

    const/16 v19, 0x0

    const/16 v20, 0x4

    move/from16 v21, v2

    cmpl-float v11, v11, v19

    if-lez v11, :cond_25f

    .line 201
    iget v11, v13, Lb/f/b/k/e;->e0:I

    const/16 v2, 0x8

    if-eq v11, v2, :cond_25f

    .line 202
    iget-object v2, v13, Lb/f/b/k/e;->L:[Lb/f/b/k/e$b;

    const/4 v11, 0x0

    aget-object v2, v2, v11

    sget-object v11, Lb/f/b/k/e$b;->MATCH_CONSTRAINT:Lb/f/b/k/e$b;

    move-object/from16 v22, v1

    if-ne v2, v11, :cond_1ce

    if-nez v14, :cond_1ce

    const/4 v14, 0x3

    .line 203
    :cond_1ce
    iget-object v2, v13, Lb/f/b/k/e;->L:[Lb/f/b/k/e$b;

    const/4 v11, 0x1

    aget-object v2, v2, v11

    sget-object v11, Lb/f/b/k/e$b;->MATCH_CONSTRAINT:Lb/f/b/k/e$b;

    if-ne v2, v11, :cond_1da

    if-nez v12, :cond_1da

    const/4 v12, 0x3

    .line 204
    :cond_1da
    iget-object v2, v13, Lb/f/b/k/e;->L:[Lb/f/b/k/e$b;

    const/4 v11, 0x0

    aget-object v1, v2, v11

    sget-object v11, Lb/f/b/k/e$b;->MATCH_CONSTRAINT:Lb/f/b/k/e$b;

    if-ne v1, v11, :cond_1f1

    const/4 v1, 0x1

    aget-object v2, v2, v1

    if-ne v2, v11, :cond_1f1

    const/4 v1, 0x3

    if-ne v14, v1, :cond_1f2

    if-ne v12, v1, :cond_1f2

    .line 205
    invoke-virtual {v13, v15, v0, v8, v10}, Lb/f/b/k/e;->a(ZZZZ)V

    goto :goto_254

    :cond_1f1
    const/4 v1, 0x3

    .line 206
    :cond_1f2
    iget-object v2, v13, Lb/f/b/k/e;->L:[Lb/f/b/k/e$b;

    const/4 v8, 0x0

    aget-object v10, v2, v8

    sget-object v11, Lb/f/b/k/e$b;->MATCH_CONSTRAINT:Lb/f/b/k/e$b;

    if-ne v10, v11, :cond_21e

    if-ne v14, v1, :cond_21e

    .line 207
    iput v8, v13, Lb/f/b/k/e;->u:I

    .line 208
    iget v1, v13, Lb/f/b/k/e;->v:F

    iget v8, v13, Lb/f/b/k/e;->O:I

    int-to-float v8, v8

    mul-float v1, v1, v8

    float-to-int v1, v1

    const/4 v8, 0x1

    .line 209
    aget-object v2, v2, v8

    if-eq v2, v11, :cond_216

    move v2, v1

    move/from16 v30, v5

    move/from16 v31, v12

    const/16 v29, 0x0

    const/16 v32, 0x4

    goto :goto_26b

    :cond_216
    move v2, v1

    move/from16 v30, v5

    move/from16 v31, v12

    move/from16 v32, v14

    goto :goto_25c

    :cond_21e
    const/4 v8, 0x1

    .line 210
    iget-object v1, v13, Lb/f/b/k/e;->L:[Lb/f/b/k/e$b;

    aget-object v1, v1, v8

    sget-object v2, Lb/f/b/k/e$b;->MATCH_CONSTRAINT:Lb/f/b/k/e$b;

    if-ne v1, v2, :cond_254

    const/4 v1, 0x3

    if-ne v12, v1, :cond_254

    .line 211
    iput v8, v13, Lb/f/b/k/e;->u:I

    .line 212
    iget v1, v13, Lb/f/b/k/e;->Q:I

    const/4 v2, -0x1

    if-ne v1, v2, :cond_238

    const/high16 v1, 0x3f800000    # 1.0f

    .line 213
    iget v2, v13, Lb/f/b/k/e;->v:F

    div-float/2addr v1, v2

    iput v1, v13, Lb/f/b/k/e;->v:F

    .line 214
    :cond_238
    iget v1, v13, Lb/f/b/k/e;->v:F

    iget v2, v13, Lb/f/b/k/e;->N:I

    int-to-float v2, v2

    mul-float v1, v1, v2

    float-to-int v5, v1

    .line 215
    iget-object v1, v13, Lb/f/b/k/e;->L:[Lb/f/b/k/e$b;

    const/4 v2, 0x0

    aget-object v1, v1, v2

    sget-object v2, Lb/f/b/k/e$b;->MATCH_CONSTRAINT:Lb/f/b/k/e$b;

    if-eq v1, v2, :cond_254

    move/from16 v30, v5

    move/from16 v32, v14

    move/from16 v2, v21

    const/16 v29, 0x0

    const/16 v31, 0x4

    goto :goto_26b

    :cond_254
    :goto_254
    move/from16 v30, v5

    move/from16 v31, v12

    move/from16 v32, v14

    move/from16 v2, v21

    :goto_25c
    const/16 v29, 0x1

    goto :goto_26b

    :cond_25f
    move-object/from16 v22, v1

    move/from16 v30, v5

    move/from16 v31, v12

    move/from16 v32, v14

    move/from16 v2, v21

    const/16 v29, 0x0

    .line 216
    :goto_26b
    iget-object v1, v13, Lb/f/b/k/e;->l:[I

    const/4 v5, 0x0

    aput v32, v1, v5

    const/4 v5, 0x1

    .line 217
    aput v31, v1, v5

    if-eqz v29, :cond_27f

    .line 218
    iget v1, v13, Lb/f/b/k/e;->u:I

    const/4 v5, -0x1

    if-eqz v1, :cond_27c

    if-ne v1, v5, :cond_280

    :cond_27c
    const/16 v19, 0x1

    goto :goto_282

    :cond_27f
    const/4 v5, -0x1

    :cond_280
    const/16 v19, 0x0

    .line 219
    :goto_282
    iget-object v1, v13, Lb/f/b/k/e;->L:[Lb/f/b/k/e$b;

    const/4 v8, 0x0

    aget-object v1, v1, v8

    sget-object v8, Lb/f/b/k/e$b;->WRAP_CONTENT:Lb/f/b/k/e$b;

    if-ne v1, v8, :cond_292

    instance-of v1, v13, Lb/f/b/k/f;

    if-eqz v1, :cond_292

    const/16 v20, 0x1

    goto :goto_294

    :cond_292
    const/16 v20, 0x0

    :goto_294
    if-eqz v20, :cond_299

    const/16 v21, 0x0

    goto :goto_29b

    :cond_299
    move/from16 v21, v2

    .line 220
    :goto_29b
    iget-object v1, v13, Lb/f/b/k/e;->H:Lb/f/b/k/d;

    invoke-virtual {v1}, Lb/f/b/k/d;->h()Z

    move-result v1

    const/4 v14, 0x1

    xor-int/lit8 v33, v1, 0x1

    .line 221
    iget-object v1, v13, Lb/f/b/k/e;->K:[Z

    const/4 v2, 0x0

    aget-boolean v26, v1, v2

    .line 222
    aget-boolean v34, v1, v14

    .line 223
    iget v1, v13, Lb/f/b/k/e;->h:I

    const/4 v12, 0x2

    const/16 v35, 0x0

    if-eq v1, v12, :cond_37f

    .line 224
    iget-object v1, v13, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    iget-object v2, v1, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-boolean v8, v2, Lb/f/b/k/n/f;->j:Z

    if-eqz v8, :cond_2ff

    iget-object v1, v1, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget-boolean v1, v1, Lb/f/b/k/n/f;->j:Z

    if-nez v1, :cond_2c1

    goto :goto_2ff

    .line 225
    :cond_2c1
    iget v1, v2, Lb/f/b/k/n/f;->g:I

    invoke-virtual {v9, v7, v1}, Lb/f/b/d;->a(Lb/f/b/i;I)V

    .line 226
    iget-object v1, v13, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    iget-object v1, v1, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget v1, v1, Lb/f/b/k/n/f;->g:I

    invoke-virtual {v9, v6, v1}, Lb/f/b/d;->a(Lb/f/b/i;I)V

    .line 227
    iget-object v1, v13, Lb/f/b/k/e;->M:Lb/f/b/k/e;

    if-eqz v1, :cond_2ef

    if-eqz v15, :cond_2ef

    .line 228
    iget-object v1, v13, Lb/f/b/k/e;->f:[Z

    const/4 v2, 0x0

    aget-boolean v1, v1, v2

    if-eqz v1, :cond_2ef

    invoke-virtual/range {p0 .. p0}, Lb/f/b/k/e;->E()Z

    move-result v1

    if-nez v1, :cond_2ef

    .line 229
    iget-object v1, v13, Lb/f/b/k/e;->M:Lb/f/b/k/e;

    iget-object v1, v1, Lb/f/b/k/e;->C:Lb/f/b/k/d;

    invoke-virtual {v9, v1}, Lb/f/b/d;->a(Ljava/lang/Object;)Lb/f/b/i;

    move-result-object v1

    const/16 v11, 0x8

    .line 230
    invoke-virtual {v9, v1, v6, v2, v11}, Lb/f/b/d;->b(Lb/f/b/i;Lb/f/b/i;II)V

    :cond_2ef
    move/from16 v38, v0

    move-object/from16 v40, v3

    move-object/from16 v41, v4

    move-object/from16 v42, v6

    move-object/from16 v36, v7

    move/from16 v37, v15

    move-object/from16 v39, v22

    goto/16 :goto_38f

    :cond_2ff
    :goto_2ff
    const/16 v11, 0x8

    .line 231
    iget-object v1, v13, Lb/f/b/k/e;->M:Lb/f/b/k/e;

    if-eqz v1, :cond_30e

    iget-object v1, v1, Lb/f/b/k/e;->C:Lb/f/b/k/d;

    invoke-virtual {v9, v1}, Lb/f/b/d;->a(Ljava/lang/Object;)Lb/f/b/i;

    move-result-object v1

    move-object/from16 v17, v1

    goto :goto_310

    :cond_30e
    move-object/from16 v17, v35

    .line 232
    :goto_310
    iget-object v1, v13, Lb/f/b/k/e;->M:Lb/f/b/k/e;

    if-eqz v1, :cond_31d

    iget-object v1, v1, Lb/f/b/k/e;->A:Lb/f/b/k/d;

    invoke-virtual {v9, v1}, Lb/f/b/d;->a(Ljava/lang/Object;)Lb/f/b/i;

    move-result-object v1

    move-object/from16 v36, v1

    goto :goto_31f

    :cond_31d
    move-object/from16 v36, v35

    :goto_31f
    const/4 v2, 0x1

    const/4 v1, -0x1

    .line 233
    iget-object v5, v13, Lb/f/b/k/e;->f:[Z

    const/16 v16, 0x0

    aget-boolean v5, v5, v16

    iget-object v8, v13, Lb/f/b/k/e;->L:[Lb/f/b/k/e$b;

    aget-object v8, v8, v16

    iget-object v10, v13, Lb/f/b/k/e;->A:Lb/f/b/k/d;

    iget-object v1, v13, Lb/f/b/k/e;->C:Lb/f/b/k/d;

    const/16 v23, 0x8

    move-object v11, v1

    iget v1, v13, Lb/f/b/k/e;->R:I

    const/4 v2, 0x0

    move v12, v1

    iget v1, v13, Lb/f/b/k/e;->Y:I

    move v14, v1

    iget-object v1, v13, Lb/f/b/k/e;->w:[I

    aget v1, v1, v2

    move/from16 v37, v15

    move v15, v1

    iget v1, v13, Lb/f/b/k/e;->a0:F

    move/from16 v16, v1

    iget v1, v13, Lb/f/b/k/e;->m:I

    move/from16 v23, v1

    iget v1, v13, Lb/f/b/k/e;->n:I

    move/from16 v24, v1

    iget v1, v13, Lb/f/b/k/e;->o:F

    move/from16 v25, v1

    move/from16 v38, v0

    move-object/from16 v0, p0

    move-object/from16 v39, v22

    move-object/from16 v1, p1

    move-object/from16 v40, v3

    move/from16 v3, v37

    move-object/from16 v41, v4

    move/from16 v4, v38

    move-object/from16 v42, v6

    move-object/from16 v6, v36

    move-object/from16 v36, v7

    move-object/from16 v7, v17

    move/from16 v9, v20

    move/from16 v13, v21

    move/from16 v17, v19

    move/from16 v18, v28

    move/from16 v19, v27

    move/from16 v20, v26

    move/from16 v21, v32

    move/from16 v22, v31

    move/from16 v26, v33

    const/4 v2, 0x1

    invoke-virtual/range {v0 .. v26}, Lb/f/b/k/e;->a(Lb/f/b/d;ZZZZLb/f/b/i;Lb/f/b/i;Lb/f/b/k/e$b;ZLb/f/b/k/d;Lb/f/b/k/d;IIIIFZZZZIIIIFZ)V

    goto :goto_38d

    :cond_37f
    move/from16 v38, v0

    move-object/from16 v40, v3

    move-object/from16 v41, v4

    move-object/from16 v42, v6

    move-object/from16 v36, v7

    move/from16 v37, v15

    move-object/from16 v39, v22

    :goto_38d
    move-object/from16 v13, p0

    .line 234
    :goto_38f
    iget-object v0, v13, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v1, v0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-boolean v2, v1, Lb/f/b/k/n/f;->j:Z

    if-eqz v2, :cond_3e2

    iget-object v0, v0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget-boolean v0, v0, Lb/f/b/k/n/f;->j:Z

    if-eqz v0, :cond_3e2

    .line 235
    iget v0, v1, Lb/f/b/k/n/f;->g:I

    move-object/from16 v9, p1

    move-object/from16 v7, v41

    invoke-virtual {v9, v7, v0}, Lb/f/b/d;->a(Lb/f/b/i;I)V

    .line 236
    iget-object v0, v13, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v0, v0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget v0, v0, Lb/f/b/k/n/f;->g:I

    move-object/from16 v6, v40

    invoke-virtual {v9, v6, v0}, Lb/f/b/d;->a(Lb/f/b/i;I)V

    .line 237
    iget-object v0, v13, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v0, v0, Lb/f/b/k/n/l;->k:Lb/f/b/k/n/f;

    iget v0, v0, Lb/f/b/k/n/f;->g:I

    move-object/from16 v1, v39

    invoke-virtual {v9, v1, v0}, Lb/f/b/d;->a(Lb/f/b/i;I)V

    .line 238
    iget-object v0, v13, Lb/f/b/k/e;->M:Lb/f/b/k/e;

    if-eqz v0, :cond_3dc

    if-nez v27, :cond_3dc

    if-eqz v38, :cond_3dc

    .line 239
    iget-object v2, v13, Lb/f/b/k/e;->f:[Z

    const/4 v4, 0x1

    aget-boolean v2, v2, v4

    if-eqz v2, :cond_3d8

    .line 240
    iget-object v0, v0, Lb/f/b/k/e;->D:Lb/f/b/k/d;

    invoke-virtual {v9, v0}, Lb/f/b/d;->a(Ljava/lang/Object;)Lb/f/b/i;

    move-result-object v0

    const/16 v2, 0x8

    const/4 v3, 0x0

    .line 241
    invoke-virtual {v9, v0, v6, v3, v2}, Lb/f/b/d;->b(Lb/f/b/i;Lb/f/b/i;II)V

    goto :goto_3e0

    :cond_3d8
    const/16 v2, 0x8

    const/4 v3, 0x0

    goto :goto_3e0

    :cond_3dc
    const/16 v2, 0x8

    const/4 v3, 0x0

    const/4 v4, 0x1

    :goto_3e0
    const/4 v14, 0x0

    goto :goto_3ef

    :cond_3e2
    move-object/from16 v9, p1

    move-object/from16 v1, v39

    move-object/from16 v6, v40

    move-object/from16 v7, v41

    const/16 v2, 0x8

    const/4 v3, 0x0

    const/4 v4, 0x1

    const/4 v14, 0x1

    .line 242
    :goto_3ef
    iget v0, v13, Lb/f/b/k/e;->i:I

    const/4 v5, 0x2

    if-ne v0, v5, :cond_3f6

    const/4 v12, 0x0

    goto :goto_3f7

    :cond_3f6
    move v12, v14

    :goto_3f7
    if-eqz v12, :cond_4b4

    .line 243
    iget-object v0, v13, Lb/f/b/k/e;->L:[Lb/f/b/k/e$b;

    aget-object v0, v0, v4

    sget-object v5, Lb/f/b/k/e$b;->WRAP_CONTENT:Lb/f/b/k/e$b;

    if-ne v0, v5, :cond_408

    instance-of v0, v13, Lb/f/b/k/f;

    if-eqz v0, :cond_408

    const/16 v17, 0x1

    goto :goto_40a

    :cond_408
    const/16 v17, 0x0

    :goto_40a
    if-eqz v17, :cond_40e

    const/16 v30, 0x0

    :cond_40e
    if-eqz v29, :cond_41a

    .line 244
    iget v0, v13, Lb/f/b/k/e;->u:I

    if-eq v0, v4, :cond_417

    const/4 v5, -0x1

    if-ne v0, v5, :cond_41a

    :cond_417
    const/16 v18, 0x1

    goto :goto_41c

    :cond_41a
    const/16 v18, 0x0

    .line 245
    :goto_41c
    iget-object v0, v13, Lb/f/b/k/e;->M:Lb/f/b/k/e;

    if-eqz v0, :cond_427

    iget-object v0, v0, Lb/f/b/k/e;->D:Lb/f/b/k/d;

    invoke-virtual {v9, v0}, Lb/f/b/d;->a(Ljava/lang/Object;)Lb/f/b/i;

    move-result-object v0

    goto :goto_429

    :cond_427
    move-object/from16 v0, v35

    .line 246
    :goto_429
    iget-object v5, v13, Lb/f/b/k/e;->M:Lb/f/b/k/e;

    if-eqz v5, :cond_435

    iget-object v5, v5, Lb/f/b/k/e;->B:Lb/f/b/k/d;

    invoke-virtual {v9, v5}, Lb/f/b/d;->a(Ljava/lang/Object;)Lb/f/b/i;

    move-result-object v5

    move-object/from16 v35, v5

    .line 247
    :cond_435
    iget v5, v13, Lb/f/b/k/e;->X:I

    if-gtz v5, :cond_43d

    iget v5, v13, Lb/f/b/k/e;->e0:I

    if-ne v5, v2, :cond_467

    .line 248
    :cond_43d
    invoke-virtual/range {p0 .. p0}, Lb/f/b/k/e;->e()I

    move-result v5

    invoke-virtual {v9, v1, v7, v5, v2}, Lb/f/b/d;->a(Lb/f/b/i;Lb/f/b/i;II)Lb/f/b/b;

    .line 249
    iget-object v5, v13, Lb/f/b/k/e;->E:Lb/f/b/k/d;

    iget-object v5, v5, Lb/f/b/k/d;->d:Lb/f/b/k/d;

    if-eqz v5, :cond_460

    .line 250
    invoke-virtual {v9, v5}, Lb/f/b/d;->a(Ljava/lang/Object;)Lb/f/b/i;

    move-result-object v5

    .line 251
    invoke-virtual {v9, v1, v5, v3, v2}, Lb/f/b/d;->a(Lb/f/b/i;Lb/f/b/i;II)Lb/f/b/b;

    if-eqz v38, :cond_45d

    .line 252
    iget-object v1, v13, Lb/f/b/k/e;->D:Lb/f/b/k/d;

    invoke-virtual {v9, v1}, Lb/f/b/d;->a(Ljava/lang/Object;)Lb/f/b/i;

    move-result-object v1

    const/4 v2, 0x5

    .line 253
    invoke-virtual {v9, v0, v1, v3, v2}, Lb/f/b/d;->b(Lb/f/b/i;Lb/f/b/i;II)V

    :cond_45d
    const/16 v26, 0x0

    goto :goto_469

    .line 254
    :cond_460
    iget v5, v13, Lb/f/b/k/e;->e0:I

    if-ne v5, v2, :cond_467

    .line 255
    invoke-virtual {v9, v1, v7, v3, v2}, Lb/f/b/d;->a(Lb/f/b/i;Lb/f/b/i;II)Lb/f/b/b;

    :cond_467
    move/from16 v26, v33

    :goto_469
    const/4 v2, 0x0

    .line 256
    iget-object v1, v13, Lb/f/b/k/e;->f:[Z

    aget-boolean v5, v1, v4

    iget-object v1, v13, Lb/f/b/k/e;->L:[Lb/f/b/k/e$b;

    aget-object v8, v1, v4

    iget-object v10, v13, Lb/f/b/k/e;->B:Lb/f/b/k/d;

    iget-object v11, v13, Lb/f/b/k/e;->D:Lb/f/b/k/d;

    iget v12, v13, Lb/f/b/k/e;->S:I

    iget v14, v13, Lb/f/b/k/e;->Z:I

    iget-object v1, v13, Lb/f/b/k/e;->w:[I

    aget v15, v1, v4

    iget v1, v13, Lb/f/b/k/e;->b0:F

    move/from16 v16, v1

    iget v1, v13, Lb/f/b/k/e;->p:I

    move/from16 v23, v1

    iget v1, v13, Lb/f/b/k/e;->q:I

    move/from16 v24, v1

    iget v1, v13, Lb/f/b/k/e;->r:F

    move/from16 v25, v1

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v3, v38

    move/from16 v4, v37

    move-object/from16 v33, v6

    move-object/from16 v6, v35

    move-object/from16 v35, v7

    move-object/from16 v7, v19

    move/from16 v9, v17

    move/from16 v13, v30

    move/from16 v17, v18

    move/from16 v18, v27

    move/from16 v19, v28

    move/from16 v20, v34

    move/from16 v21, v31

    move/from16 v22, v32

    invoke-virtual/range {v0 .. v26}, Lb/f/b/k/e;->a(Lb/f/b/d;ZZZZLb/f/b/i;Lb/f/b/i;Lb/f/b/k/e$b;ZLb/f/b/k/d;Lb/f/b/k/d;IIIIFZZZZIIIIFZ)V

    goto :goto_4b8

    :cond_4b4
    move-object/from16 v33, v6

    move-object/from16 v35, v7

    :goto_4b8
    if-eqz v29, :cond_4e5

    const/16 v6, 0x8

    move-object/from16 v7, p0

    .line 257
    iget v0, v7, Lb/f/b/k/e;->u:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_4d3

    .line 258
    iget v5, v7, Lb/f/b/k/e;->v:F

    move-object/from16 v0, p1

    move-object/from16 v1, v33

    move-object/from16 v2, v35

    move-object/from16 v3, v42

    move-object/from16 v4, v36

    invoke-virtual/range {v0 .. v6}, Lb/f/b/d;->a(Lb/f/b/i;Lb/f/b/i;Lb/f/b/i;Lb/f/b/i;FI)V

    goto :goto_4e7

    .line 259
    :cond_4d3
    iget v5, v7, Lb/f/b/k/e;->v:F

    const/16 v6, 0x8

    move-object/from16 v0, p1

    move-object/from16 v1, v42

    move-object/from16 v2, v36

    move-object/from16 v3, v33

    move-object/from16 v4, v35

    invoke-virtual/range {v0 .. v6}, Lb/f/b/d;->a(Lb/f/b/i;Lb/f/b/i;Lb/f/b/i;Lb/f/b/i;FI)V

    goto :goto_4e7

    :cond_4e5
    move-object/from16 v7, p0

    .line 260
    :goto_4e7
    iget-object v0, v7, Lb/f/b/k/e;->H:Lb/f/b/k/d;

    invoke-virtual {v0}, Lb/f/b/k/d;->h()Z

    move-result v0

    if-eqz v0, :cond_50f

    .line 261
    iget-object v0, v7, Lb/f/b/k/e;->H:Lb/f/b/k/d;

    invoke-virtual {v0}, Lb/f/b/k/d;->e()Lb/f/b/k/d;

    move-result-object v0

    invoke-virtual {v0}, Lb/f/b/k/d;->c()Lb/f/b/k/e;

    move-result-object v0

    iget v1, v7, Lb/f/b/k/e;->x:F

    const/high16 v2, 0x42b40000    # 90.0f

    add-float/2addr v1, v2

    float-to-double v1, v1

    invoke-static {v1, v2}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v1

    double-to-float v1, v1

    iget-object v2, v7, Lb/f/b/k/e;->H:Lb/f/b/k/d;

    invoke-virtual {v2}, Lb/f/b/k/d;->a()I

    move-result v2

    move-object/from16 v3, p1

    invoke-virtual {v3, v7, v0, v1, v2}, Lb/f/b/d;->a(Lb/f/b/k/e;Lb/f/b/k/e;FI)V

    :cond_50f
    return-void
.end method

.method public final a(Lb/f/b/d;ZZZZLb/f/b/i;Lb/f/b/i;Lb/f/b/k/e$b;ZLb/f/b/k/d;Lb/f/b/k/d;IIIIFZZZZIIIIFZ)V
    .registers 61

    move-object/from16 v0, p0

    move-object/from16 v10, p1

    move-object/from16 v11, p6

    move-object/from16 v12, p7

    move-object/from16 v13, p10

    move-object/from16 v14, p11

    move/from16 v15, p14

    move/from16 v1, p15

    move/from16 v2, p22

    move/from16 v3, p23

    move/from16 v4, p24

    .line 285
    invoke-virtual {v10, v13}, Lb/f/b/d;->a(Ljava/lang/Object;)Lb/f/b/i;

    move-result-object v9

    .line 286
    invoke-virtual {v10, v14}, Lb/f/b/d;->a(Ljava/lang/Object;)Lb/f/b/i;

    move-result-object v8

    .line 287
    invoke-virtual/range {p10 .. p10}, Lb/f/b/k/d;->e()Lb/f/b/k/d;

    move-result-object v5

    invoke-virtual {v10, v5}, Lb/f/b/d;->a(Ljava/lang/Object;)Lb/f/b/i;

    move-result-object v7

    .line 288
    invoke-virtual/range {p11 .. p11}, Lb/f/b/k/d;->e()Lb/f/b/k/d;

    move-result-object v5

    invoke-virtual {v10, v5}, Lb/f/b/d;->a(Ljava/lang/Object;)Lb/f/b/i;

    move-result-object v6

    .line 289
    invoke-static {}, Lb/f/b/d;->j()Lb/f/b/e;

    move-result-object v5

    if-eqz v5, :cond_40

    .line 290
    invoke-static {}, Lb/f/b/d;->j()Lb/f/b/e;

    move-result-object v5

    iget-wide v12, v5, Lb/f/b/e;->w:J

    const-wide/16 v16, 0x1

    add-long v12, v12, v16

    iput-wide v12, v5, Lb/f/b/e;->w:J

    .line 291
    :cond_40
    invoke-virtual/range {p10 .. p10}, Lb/f/b/k/d;->h()Z

    move-result v12

    .line 292
    invoke-virtual/range {p11 .. p11}, Lb/f/b/k/d;->h()Z

    move-result v13

    .line 293
    iget-object v5, v0, Lb/f/b/k/e;->H:Lb/f/b/k/d;

    invoke-virtual {v5}, Lb/f/b/k/d;->h()Z

    move-result v16

    if-eqz v12, :cond_53

    const/16 v18, 0x1

    goto :goto_55

    :cond_53
    const/16 v18, 0x0

    :goto_55
    if-eqz v13, :cond_59

    add-int/lit8 v18, v18, 0x1

    :cond_59
    if-eqz v16, :cond_5d

    add-int/lit8 v18, v18, 0x1

    :cond_5d
    move/from16 v19, v18

    if-eqz p17, :cond_64

    const/16 v20, 0x3

    goto :goto_66

    :cond_64
    move/from16 v20, p21

    .line 294
    :goto_66
    sget-object v21, Lb/f/b/k/e$a;->b:[I

    invoke-virtual/range {p8 .. p8}, Ljava/lang/Enum;->ordinal()I

    move-result v22

    aget v5, v21, v22

    const/4 v2, 0x2

    const/4 v14, 0x1

    if-eq v5, v14, :cond_7a

    if-eq v5, v2, :cond_7a

    const/4 v14, 0x3

    if-eq v5, v14, :cond_7a

    const/4 v14, 0x4

    if-eq v5, v14, :cond_7f

    :cond_7a
    move/from16 v5, v20

    :goto_7c
    const/16 v20, 0x0

    goto :goto_86

    :cond_7f
    move/from16 v5, v20

    if-ne v5, v14, :cond_84

    goto :goto_7c

    :cond_84
    const/16 v20, 0x1

    .line 295
    :goto_86
    iget v14, v0, Lb/f/b/k/e;->e0:I

    const/16 v2, 0x8

    if-ne v14, v2, :cond_90

    const/4 v14, 0x0

    const/16 v20, 0x0

    goto :goto_92

    :cond_90
    move/from16 v14, p13

    :goto_92
    if-eqz p26, :cond_b0

    if-nez v12, :cond_a0

    if-nez v13, :cond_a0

    if-nez v16, :cond_a0

    move/from16 v2, p12

    .line 296
    invoke-virtual {v10, v9, v2}, Lb/f/b/d;->a(Lb/f/b/i;I)V

    goto :goto_b0

    :cond_a0
    if-eqz v12, :cond_b0

    if-nez v13, :cond_b0

    .line 297
    invoke-virtual/range {p10 .. p10}, Lb/f/b/k/d;->a()I

    move-result v2

    move-object/from16 v22, v6

    const/16 v6, 0x8

    invoke-virtual {v10, v9, v7, v2, v6}, Lb/f/b/d;->a(Lb/f/b/i;Lb/f/b/i;II)Lb/f/b/b;

    goto :goto_b4

    :cond_b0
    :goto_b0
    move-object/from16 v22, v6

    const/16 v6, 0x8

    :goto_b4
    if-nez v20, :cond_e3

    if-eqz p9, :cond_cd

    const/4 v2, 0x0

    const/4 v6, 0x3

    .line 298
    invoke-virtual {v10, v8, v9, v2, v6}, Lb/f/b/d;->a(Lb/f/b/i;Lb/f/b/i;II)Lb/f/b/b;

    const/16 v14, 0x8

    if-lez v15, :cond_c4

    .line 299
    invoke-virtual {v10, v8, v9, v15, v14}, Lb/f/b/d;->b(Lb/f/b/i;Lb/f/b/i;II)V

    :cond_c4
    const v2, 0x7fffffff

    if-ge v1, v2, :cond_d3

    .line 300
    invoke-virtual {v10, v8, v9, v1, v14}, Lb/f/b/d;->c(Lb/f/b/i;Lb/f/b/i;II)V

    goto :goto_d3

    :cond_cd
    const/16 v1, 0x8

    const/4 v6, 0x3

    .line 301
    invoke-virtual {v10, v8, v9, v14, v1}, Lb/f/b/d;->a(Lb/f/b/i;Lb/f/b/i;II)Lb/f/b/b;

    :cond_d3
    :goto_d3
    move/from16 v25, v5

    move-object v1, v7

    move-object v14, v8

    move/from16 v18, v19

    move-object/from16 v15, v22

    move/from16 v19, p5

    :goto_dd
    move/from16 v22, v20

    move/from16 v20, v3

    goto/16 :goto_1ec

    :cond_e3
    move/from16 v1, v19

    const/4 v2, 0x2

    const/4 v6, 0x3

    if-eq v1, v2, :cond_10f

    if-nez p17, :cond_10f

    const/4 v2, 0x1

    if-eq v5, v2, :cond_f0

    if-nez v5, :cond_10f

    .line 302
    :cond_f0
    invoke-static {v3, v14}, Ljava/lang/Math;->max(II)I

    move-result v2

    if-lez v4, :cond_fa

    .line 303
    invoke-static {v4, v2}, Ljava/lang/Math;->min(II)I

    move-result v2

    :cond_fa
    const/16 v14, 0x8

    .line 304
    invoke-virtual {v10, v8, v9, v2, v14}, Lb/f/b/d;->a(Lb/f/b/i;Lb/f/b/i;II)Lb/f/b/b;

    move/from16 v19, p5

    move/from16 v18, v1

    move/from16 v20, v3

    move/from16 v25, v5

    move-object v1, v7

    move-object v14, v8

    move-object/from16 v15, v22

    const/16 v22, 0x0

    goto/16 :goto_1ec

    :cond_10f
    const/4 v2, -0x2

    if-ne v3, v2, :cond_113

    move v3, v14

    :cond_113
    if-ne v4, v2, :cond_117

    move v2, v14

    goto :goto_118

    :cond_117
    move v2, v4

    :goto_118
    if-lez v14, :cond_11e

    const/4 v4, 0x1

    if-eq v5, v4, :cond_11e

    const/4 v14, 0x0

    :cond_11e
    if-lez v3, :cond_129

    const/16 v4, 0x8

    .line 305
    invoke-virtual {v10, v8, v9, v3, v4}, Lb/f/b/d;->b(Lb/f/b/i;Lb/f/b/i;II)V

    .line 306
    invoke-static {v14, v3}, Ljava/lang/Math;->max(II)I

    move-result v14

    :cond_129
    if-lez v2, :cond_142

    if-eqz p3, :cond_132

    const/4 v4, 0x1

    if-ne v5, v4, :cond_132

    const/4 v4, 0x0

    goto :goto_133

    :cond_132
    const/4 v4, 0x1

    :goto_133
    if-eqz v4, :cond_13b

    const/16 v4, 0x8

    .line 307
    invoke-virtual {v10, v8, v9, v2, v4}, Lb/f/b/d;->c(Lb/f/b/i;Lb/f/b/i;II)V

    goto :goto_13d

    :cond_13b
    const/16 v4, 0x8

    .line 308
    :goto_13d
    invoke-static {v14, v2}, Ljava/lang/Math;->min(II)I

    move-result v14

    goto :goto_144

    :cond_142
    const/16 v4, 0x8

    :goto_144
    const/4 v6, 0x1

    if-ne v5, v6, :cond_16b

    if-eqz p3, :cond_14d

    .line 309
    invoke-virtual {v10, v8, v9, v14, v4}, Lb/f/b/d;->a(Lb/f/b/i;Lb/f/b/i;II)Lb/f/b/b;

    goto :goto_15e

    :cond_14d
    if-eqz p18, :cond_157

    const/4 v6, 0x5

    .line 310
    invoke-virtual {v10, v8, v9, v14, v6}, Lb/f/b/d;->a(Lb/f/b/i;Lb/f/b/i;II)Lb/f/b/b;

    .line 311
    invoke-virtual {v10, v8, v9, v14, v4}, Lb/f/b/d;->c(Lb/f/b/i;Lb/f/b/i;II)V

    goto :goto_15e

    :cond_157
    const/4 v6, 0x5

    .line 312
    invoke-virtual {v10, v8, v9, v14, v6}, Lb/f/b/d;->a(Lb/f/b/i;Lb/f/b/i;II)Lb/f/b/b;

    .line 313
    invoke-virtual {v10, v8, v9, v14, v4}, Lb/f/b/d;->c(Lb/f/b/i;Lb/f/b/i;II)V

    :goto_15e
    move/from16 v19, p5

    move/from16 v18, v1

    move v4, v2

    move/from16 v25, v5

    move-object v1, v7

    move-object v14, v8

    move-object/from16 v15, v22

    goto/16 :goto_dd

    :cond_16b
    const/4 v14, 0x2

    if-ne v5, v14, :cond_1d8

    .line 314
    invoke-virtual/range {p10 .. p10}, Lb/f/b/k/d;->f()Lb/f/b/k/d$b;

    move-result-object v4

    sget-object v6, Lb/f/b/k/d$b;->TOP:Lb/f/b/k/d$b;

    if-eq v4, v6, :cond_198

    invoke-virtual/range {p10 .. p10}, Lb/f/b/k/d;->f()Lb/f/b/k/d$b;

    move-result-object v4

    sget-object v6, Lb/f/b/k/d$b;->BOTTOM:Lb/f/b/k/d$b;

    if-ne v4, v6, :cond_17f

    goto :goto_198

    .line 315
    :cond_17f
    iget-object v4, v0, Lb/f/b/k/e;->M:Lb/f/b/k/e;

    sget-object v6, Lb/f/b/k/d$b;->LEFT:Lb/f/b/k/d$b;

    invoke-virtual {v4, v6}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object v4

    invoke-virtual {v10, v4}, Lb/f/b/d;->a(Ljava/lang/Object;)Lb/f/b/i;

    move-result-object v4

    .line 316
    iget-object v6, v0, Lb/f/b/k/e;->M:Lb/f/b/k/e;

    sget-object v14, Lb/f/b/k/d$b;->RIGHT:Lb/f/b/k/d$b;

    invoke-virtual {v6, v14}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object v6

    invoke-virtual {v10, v6}, Lb/f/b/d;->a(Ljava/lang/Object;)Lb/f/b/i;

    move-result-object v6

    goto :goto_1b0

    .line 317
    :cond_198
    :goto_198
    iget-object v4, v0, Lb/f/b/k/e;->M:Lb/f/b/k/e;

    sget-object v6, Lb/f/b/k/d$b;->TOP:Lb/f/b/k/d$b;

    invoke-virtual {v4, v6}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object v4

    invoke-virtual {v10, v4}, Lb/f/b/d;->a(Ljava/lang/Object;)Lb/f/b/i;

    move-result-object v4

    .line 318
    iget-object v6, v0, Lb/f/b/k/e;->M:Lb/f/b/k/e;

    sget-object v14, Lb/f/b/k/d$b;->BOTTOM:Lb/f/b/k/d$b;

    invoke-virtual {v6, v14}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object v6

    invoke-virtual {v10, v6}, Lb/f/b/d;->a(Ljava/lang/Object;)Lb/f/b/i;

    move-result-object v6

    :goto_1b0
    move-object v14, v4

    .line 319
    invoke-virtual/range {p1 .. p1}, Lb/f/b/d;->c()Lb/f/b/b;

    move-result-object v4

    move/from16 v19, v3

    move-object v3, v4

    move/from16 p9, v2

    move-object v2, v4

    move-object v4, v8

    move/from16 v25, v5

    const/4 v15, 0x0

    move-object v5, v9

    move-object/from16 v15, v22

    move/from16 v18, v1

    move-object v1, v7

    move-object v7, v14

    move-object v14, v8

    move/from16 v8, p25

    invoke-virtual/range {v3 .. v8}, Lb/f/b/b;->a(Lb/f/b/i;Lb/f/b/i;Lb/f/b/i;Lb/f/b/i;F)Lb/f/b/b;

    invoke-virtual {v10, v2}, Lb/f/b/d;->a(Lb/f/b/b;)V

    move/from16 v4, p9

    move/from16 v20, v19

    const/16 v22, 0x0

    move/from16 v19, p5

    goto :goto_1ec

    :cond_1d8
    move/from16 v18, v1

    move/from16 p9, v2

    move/from16 v19, v3

    move/from16 v25, v5

    move-object v1, v7

    move-object v14, v8

    move-object/from16 v15, v22

    move/from16 v4, p9

    move/from16 v22, v20

    move/from16 v20, v19

    const/16 v19, 0x1

    :goto_1ec
    if-eqz p26, :cond_444

    if-eqz p18, :cond_1fd

    move-object/from16 v3, p7

    move-object v5, v9

    move/from16 v1, v18

    const/4 v2, 0x0

    const/4 v8, 0x2

    const/16 v12, 0x8

    const/16 v29, 0x1

    goto/16 :goto_44f

    :cond_1fd
    if-nez v12, :cond_205

    if-nez v13, :cond_205

    if-nez v16, :cond_205

    goto/16 :goto_428

    :cond_205
    if-eqz v12, :cond_20b

    if-nez v13, :cond_20b

    goto/16 :goto_428

    :cond_20b
    if-nez v12, :cond_222

    if-eqz v13, :cond_222

    .line 320
    invoke-virtual/range {p11 .. p11}, Lb/f/b/k/d;->a()I

    move-result v1

    neg-int v1, v1

    const/16 v2, 0x8

    invoke-virtual {v10, v14, v15, v1, v2}, Lb/f/b/d;->a(Lb/f/b/i;Lb/f/b/i;II)Lb/f/b/b;

    if-eqz p3, :cond_428

    const/4 v2, 0x5

    const/4 v8, 0x0

    .line 321
    invoke-virtual {v10, v9, v11, v8, v2}, Lb/f/b/d;->b(Lb/f/b/i;Lb/f/b/i;II)V

    goto/16 :goto_428

    :cond_222
    const/4 v2, 0x5

    const/4 v8, 0x0

    if-eqz v12, :cond_428

    if-eqz v13, :cond_428

    move-object/from16 v12, p10

    .line 322
    iget-object v3, v12, Lb/f/b/k/d;->d:Lb/f/b/k/d;

    iget-object v13, v3, Lb/f/b/k/d;->b:Lb/f/b/k/e;

    move-object/from16 v7, p11

    const/16 v16, 0x4

    .line 323
    iget-object v3, v7, Lb/f/b/k/d;->d:Lb/f/b/k/d;

    iget-object v6, v3, Lb/f/b/k/d;->b:Lb/f/b/k/e;

    .line 324
    invoke-virtual/range {p0 .. p0}, Lb/f/b/k/e;->t()Lb/f/b/k/e;

    move-result-object v5

    const/16 v17, 0x6

    if-eqz v22, :cond_2fb

    move/from16 v3, v25

    if-nez v3, :cond_273

    if-nez v4, :cond_24e

    if-nez v20, :cond_24e

    const/4 v4, 0x0

    const/16 v18, 0x1

    const/16 v23, 0x8

    const/16 v25, 0x8

    goto :goto_255

    :cond_24e
    const/4 v4, 0x1

    const/16 v18, 0x0

    const/16 v23, 0x5

    const/16 v25, 0x5

    .line 325
    :goto_255
    instance-of v2, v13, Lb/f/b/k/a;

    if-nez v2, :cond_267

    instance-of v2, v6, Lb/f/b/k/a;

    if-eqz v2, :cond_25e

    goto :goto_267

    :cond_25e
    move/from16 v26, v25

    const/4 v2, 0x6

    const/4 v8, 0x1

    const/16 v24, 0x0

    move/from16 v25, v23

    goto :goto_26f

    :cond_267
    :goto_267
    move/from16 v25, v23

    const/4 v2, 0x6

    const/4 v8, 0x1

    const/16 v24, 0x0

    const/16 v26, 0x4

    :goto_26f
    move/from16 v23, v18

    goto/16 :goto_308

    :cond_273
    const/4 v2, 0x1

    if-ne v3, v2, :cond_281

    const/4 v2, 0x6

    const/4 v4, 0x1

    const/4 v8, 0x1

    const/16 v23, 0x0

    const/16 v24, 0x1

    const/16 v25, 0x8

    goto/16 :goto_306

    :cond_281
    const/4 v2, 0x3

    if-ne v3, v2, :cond_2f3

    .line 326
    iget v2, v0, Lb/f/b/k/e;->u:I

    const/4 v8, -0x1

    if-ne v2, v8, :cond_29f

    if-eqz p19, :cond_291

    if-eqz p3, :cond_28f

    const/4 v2, 0x5

    goto :goto_293

    :cond_28f
    const/4 v2, 0x4

    goto :goto_293

    :cond_291
    const/16 v2, 0x8

    :goto_293
    const/4 v4, 0x1

    const/4 v8, 0x1

    const/16 v23, 0x1

    const/16 v24, 0x1

    const/16 v25, 0x8

    :goto_29b
    const/16 v26, 0x5

    goto/16 :goto_308

    :cond_29f
    if-eqz p17, :cond_2c1

    move/from16 v2, p22

    const/4 v8, 0x2

    if-eq v2, v8, :cond_2ac

    const/4 v8, 0x1

    if-ne v2, v8, :cond_2aa

    goto :goto_2ad

    :cond_2aa
    const/4 v2, 0x0

    goto :goto_2ae

    :cond_2ac
    const/4 v8, 0x1

    :goto_2ad
    const/4 v2, 0x1

    :goto_2ae
    if-nez v2, :cond_2b4

    const/16 v2, 0x8

    const/4 v4, 0x5

    goto :goto_2b6

    :cond_2b4
    const/4 v2, 0x5

    const/4 v4, 0x4

    :goto_2b6
    move/from16 v25, v2

    move/from16 v26, v4

    const/4 v2, 0x6

    const/4 v4, 0x1

    const/16 v23, 0x1

    const/16 v24, 0x1

    goto :goto_308

    :cond_2c1
    const/4 v8, 0x1

    if-lez v4, :cond_2cd

    const/4 v2, 0x6

    const/4 v4, 0x1

    const/16 v23, 0x1

    const/16 v24, 0x1

    const/16 v25, 0x5

    goto :goto_29b

    :cond_2cd
    if-nez v4, :cond_2ee

    if-nez v20, :cond_2ee

    if-nez p19, :cond_2de

    const/4 v2, 0x6

    const/4 v4, 0x1

    const/16 v23, 0x1

    const/16 v24, 0x1

    const/16 v25, 0x5

    const/16 v26, 0x8

    goto :goto_308

    :cond_2de
    if-eq v13, v5, :cond_2e4

    if-eq v6, v5, :cond_2e4

    const/4 v2, 0x4

    goto :goto_2e5

    :cond_2e4
    const/4 v2, 0x5

    :goto_2e5
    move/from16 v25, v2

    const/4 v2, 0x6

    const/4 v4, 0x1

    const/16 v23, 0x1

    const/16 v24, 0x1

    goto :goto_306

    :cond_2ee
    const/4 v2, 0x6

    const/4 v4, 0x1

    const/16 v23, 0x1

    goto :goto_302

    :cond_2f3
    const/4 v8, 0x1

    const/4 v2, 0x6

    const/4 v4, 0x0

    const/16 v23, 0x0

    const/16 v24, 0x0

    goto :goto_304

    :cond_2fb
    move/from16 v3, v25

    const/4 v8, 0x1

    const/4 v2, 0x6

    const/4 v4, 0x1

    const/16 v23, 0x0

    :goto_302
    const/16 v24, 0x1

    :goto_304
    const/16 v25, 0x5

    :goto_306
    const/16 v26, 0x4

    :goto_308
    if-eqz v24, :cond_313

    if-ne v1, v15, :cond_313

    if-eq v13, v5, :cond_313

    const/16 v24, 0x0

    const/16 v27, 0x0

    goto :goto_315

    :cond_313
    const/16 v27, 0x1

    :goto_315
    if-eqz v4, :cond_34d

    .line 327
    iget v4, v0, Lb/f/b/k/e;->e0:I

    const/16 v8, 0x8

    if-ne v4, v8, :cond_320

    const/16 v21, 0x4

    goto :goto_322

    :cond_320
    move/from16 v21, v2

    .line 328
    :goto_322
    invoke-virtual/range {p10 .. p10}, Lb/f/b/k/d;->a()I

    move-result v4

    .line 329
    invoke-virtual/range {p11 .. p11}, Lb/f/b/k/d;->a()I

    move-result v28

    move-object v2, v1

    move-object/from16 v1, p1

    move-object/from16 p2, v2

    const/4 v8, 0x5

    const/16 v12, 0x8

    const/16 v29, 0x1

    move-object v2, v9

    move/from16 v30, v3

    move-object/from16 v3, p2

    move-object/from16 v31, v5

    move/from16 v5, p16

    move-object/from16 v32, v6

    move-object v6, v15

    move-object v7, v14

    const/16 v18, 0x0

    move/from16 v8, v28

    move-object/from16 v33, v9

    move/from16 v9, v21

    .line 330
    invoke-virtual/range {v1 .. v9}, Lb/f/b/d;->a(Lb/f/b/i;Lb/f/b/i;IFLb/f/b/i;Lb/f/b/i;II)V

    goto :goto_35d

    :cond_34d
    move-object/from16 p2, v1

    move/from16 v30, v3

    move-object/from16 v31, v5

    move-object/from16 v32, v6

    move-object/from16 v33, v9

    const/16 v12, 0x8

    const/16 v18, 0x0

    const/16 v29, 0x1

    .line 331
    :goto_35d
    iget v1, v0, Lb/f/b/k/e;->e0:I

    if-ne v1, v12, :cond_362

    return-void

    :cond_362
    move-object/from16 v1, p2

    if-eqz v24, :cond_393

    if-eqz p3, :cond_37b

    if-eq v1, v15, :cond_37b

    if-nez v22, :cond_37b

    .line 332
    instance-of v2, v13, Lb/f/b/k/a;

    if-nez v2, :cond_377

    move-object/from16 v2, v32

    instance-of v3, v2, Lb/f/b/k/a;

    if-eqz v3, :cond_37d

    goto :goto_379

    :cond_377
    move-object/from16 v2, v32

    :goto_379
    const/4 v3, 0x6

    goto :goto_37f

    :cond_37b
    move-object/from16 v2, v32

    :cond_37d
    move/from16 v3, v25

    .line 333
    :goto_37f
    invoke-virtual/range {p10 .. p10}, Lb/f/b/k/d;->a()I

    move-result v4

    move-object/from16 v5, v33

    invoke-virtual {v10, v5, v1, v4, v3}, Lb/f/b/d;->b(Lb/f/b/i;Lb/f/b/i;II)V

    .line 334
    invoke-virtual/range {p11 .. p11}, Lb/f/b/k/d;->a()I

    move-result v4

    neg-int v4, v4

    invoke-virtual {v10, v14, v15, v4, v3}, Lb/f/b/d;->c(Lb/f/b/i;Lb/f/b/i;II)V

    move/from16 v25, v3

    goto :goto_397

    :cond_393
    move-object/from16 v2, v32

    move-object/from16 v5, v33

    :goto_397
    if-eqz p3, :cond_3a8

    if-eqz p20, :cond_3a8

    .line 335
    instance-of v3, v13, Lb/f/b/k/a;

    if-nez v3, :cond_3a8

    instance-of v3, v2, Lb/f/b/k/a;

    if-nez v3, :cond_3a8

    const/4 v3, 0x6

    const/4 v4, 0x6

    const/16 v27, 0x1

    goto :goto_3ac

    :cond_3a8
    move/from16 v3, v25

    move/from16 v4, v26

    :goto_3ac
    if-eqz v27, :cond_3fe

    if-eqz v23, :cond_3dc

    if-eqz p19, :cond_3b4

    if-eqz p4, :cond_3dc

    :cond_3b4
    move-object/from16 v6, v31

    if-eq v13, v6, :cond_3bd

    if-ne v2, v6, :cond_3bb

    goto :goto_3bd

    :cond_3bb
    move/from16 v17, v4

    .line 336
    :cond_3bd
    :goto_3bd
    instance-of v7, v13, Lb/f/b/k/h;

    if-nez v7, :cond_3c5

    instance-of v7, v2, Lb/f/b/k/h;

    if-eqz v7, :cond_3c7

    :cond_3c5
    const/16 v17, 0x5

    .line 337
    :cond_3c7
    instance-of v7, v13, Lb/f/b/k/a;

    if-nez v7, :cond_3cf

    instance-of v7, v2, Lb/f/b/k/a;

    if-eqz v7, :cond_3d1

    :cond_3cf
    const/16 v17, 0x5

    :cond_3d1
    if-eqz p19, :cond_3d5

    const/4 v7, 0x5

    goto :goto_3d7

    :cond_3d5
    move/from16 v7, v17

    .line 338
    :goto_3d7
    invoke-static {v7, v4}, Ljava/lang/Math;->max(II)I

    move-result v4

    goto :goto_3de

    :cond_3dc
    move-object/from16 v6, v31

    :goto_3de
    if-eqz p3, :cond_3ee

    .line 339
    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v3

    if-eqz p17, :cond_3ef

    if-nez p19, :cond_3ef

    if-eq v13, v6, :cond_3ec

    if-ne v2, v6, :cond_3ef

    :cond_3ec
    const/4 v3, 0x4

    goto :goto_3ef

    :cond_3ee
    move v3, v4

    .line 340
    :cond_3ef
    :goto_3ef
    invoke-virtual/range {p10 .. p10}, Lb/f/b/k/d;->a()I

    move-result v2

    invoke-virtual {v10, v5, v1, v2, v3}, Lb/f/b/d;->a(Lb/f/b/i;Lb/f/b/i;II)Lb/f/b/b;

    .line 341
    invoke-virtual/range {p11 .. p11}, Lb/f/b/k/d;->a()I

    move-result v2

    neg-int v2, v2

    invoke-virtual {v10, v14, v15, v2, v3}, Lb/f/b/d;->a(Lb/f/b/i;Lb/f/b/i;II)Lb/f/b/b;

    :cond_3fe
    if-eqz p3, :cond_40f

    if-ne v11, v1, :cond_407

    .line 342
    invoke-virtual/range {p10 .. p10}, Lb/f/b/k/d;->a()I

    move-result v2

    goto :goto_408

    :cond_407
    const/4 v2, 0x0

    :goto_408
    if-eq v1, v11, :cond_40f

    const/4 v1, 0x5

    .line 343
    invoke-virtual {v10, v5, v11, v2, v1}, Lb/f/b/d;->b(Lb/f/b/i;Lb/f/b/i;II)V

    goto :goto_410

    :cond_40f
    const/4 v1, 0x5

    :goto_410
    if-eqz p3, :cond_429

    if-eqz v22, :cond_429

    const/4 v2, 0x0

    if-nez p14, :cond_42a

    if-nez v20, :cond_42a

    if-eqz v22, :cond_424

    move/from16 v3, v30

    const/4 v4, 0x3

    if-ne v3, v4, :cond_424

    .line 344
    invoke-virtual {v10, v14, v5, v2, v12}, Lb/f/b/d;->b(Lb/f/b/i;Lb/f/b/i;II)V

    goto :goto_42a

    .line 345
    :cond_424
    invoke-virtual {v10, v14, v5, v2, v1}, Lb/f/b/d;->b(Lb/f/b/i;Lb/f/b/i;II)V

    goto :goto_42a

    :cond_428
    :goto_428
    const/4 v1, 0x5

    :cond_429
    const/4 v2, 0x0

    :cond_42a
    :goto_42a
    if-eqz p3, :cond_443

    if-eqz v19, :cond_443

    move-object/from16 v3, p11

    .line 346
    iget-object v4, v3, Lb/f/b/k/d;->d:Lb/f/b/k/d;

    if-eqz v4, :cond_43b

    .line 347
    invoke-virtual/range {p11 .. p11}, Lb/f/b/k/d;->a()I

    move-result v5

    move-object/from16 v3, p7

    goto :goto_43e

    :cond_43b
    move-object/from16 v3, p7

    const/4 v5, 0x0

    :goto_43e
    if-eq v15, v3, :cond_443

    .line 348
    invoke-virtual {v10, v3, v14, v5, v1}, Lb/f/b/d;->b(Lb/f/b/i;Lb/f/b/i;II)V

    :cond_443
    return-void

    :cond_444
    move-object/from16 v3, p7

    move-object v5, v9

    const/4 v2, 0x0

    const/4 v8, 0x2

    const/16 v12, 0x8

    const/16 v29, 0x1

    move/from16 v1, v18

    :goto_44f
    if-ge v1, v8, :cond_489

    if-eqz p3, :cond_489

    if-eqz v19, :cond_489

    .line 349
    invoke-virtual {v10, v5, v11, v2, v12}, Lb/f/b/d;->b(Lb/f/b/i;Lb/f/b/i;II)V

    if-nez p2, :cond_463

    .line 350
    iget-object v1, v0, Lb/f/b/k/e;->E:Lb/f/b/k/d;

    iget-object v1, v1, Lb/f/b/k/d;->d:Lb/f/b/k/d;

    if-nez v1, :cond_461

    goto :goto_463

    :cond_461
    const/4 v5, 0x0

    goto :goto_464

    :cond_463
    :goto_463
    const/4 v5, 0x1

    :goto_464
    if-nez p2, :cond_484

    .line 351
    iget-object v1, v0, Lb/f/b/k/e;->E:Lb/f/b/k/d;

    iget-object v1, v1, Lb/f/b/k/d;->d:Lb/f/b/k/d;

    if-eqz v1, :cond_484

    .line 352
    iget-object v1, v1, Lb/f/b/k/d;->b:Lb/f/b/k/e;

    .line 353
    iget v4, v1, Lb/f/b/k/e;->P:F

    const/4 v5, 0x0

    cmpl-float v4, v4, v5

    if-eqz v4, :cond_483

    iget-object v1, v1, Lb/f/b/k/e;->L:[Lb/f/b/k/e$b;

    aget-object v4, v1, v2

    sget-object v5, Lb/f/b/k/e$b;->MATCH_CONSTRAINT:Lb/f/b/k/e$b;

    if-ne v4, v5, :cond_483

    aget-object v1, v1, v29

    if-ne v1, v5, :cond_483

    const/4 v5, 0x1

    goto :goto_484

    :cond_483
    const/4 v5, 0x0

    :cond_484
    :goto_484
    if-eqz v5, :cond_489

    .line 354
    invoke-virtual {v10, v3, v14, v2, v12}, Lb/f/b/d;->b(Lb/f/b/i;Lb/f/b/i;II)V

    :cond_489
    return-void
.end method

.method public a(Lb/f/b/k/d$b;Lb/f/b/k/e;Lb/f/b/k/d$b;I)V
    .registers 8

    .line 46
    sget-object v0, Lb/f/b/k/d$b;->CENTER:Lb/f/b/k/d$b;

    const/4 v1, 0x0

    if-ne p1, v0, :cond_d7

    if-ne p3, v0, :cond_94

    .line 47
    sget-object p1, Lb/f/b/k/d$b;->LEFT:Lb/f/b/k/d$b;

    invoke-virtual {p0, p1}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object p1

    .line 48
    sget-object p3, Lb/f/b/k/d$b;->RIGHT:Lb/f/b/k/d$b;

    invoke-virtual {p0, p3}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object p3

    .line 49
    sget-object p4, Lb/f/b/k/d$b;->TOP:Lb/f/b/k/d$b;

    invoke-virtual {p0, p4}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object p4

    .line 50
    sget-object v0, Lb/f/b/k/d$b;->BOTTOM:Lb/f/b/k/d$b;

    invoke-virtual {p0, v0}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object v0

    const/4 v2, 0x1

    if-eqz p1, :cond_28

    .line 51
    invoke-virtual {p1}, Lb/f/b/k/d;->h()Z

    move-result p1

    if-nez p1, :cond_30

    :cond_28
    if-eqz p3, :cond_32

    .line 52
    invoke-virtual {p3}, Lb/f/b/k/d;->h()Z

    move-result p1

    if-eqz p1, :cond_32

    :cond_30
    const/4 p1, 0x0

    goto :goto_3d

    .line 53
    :cond_32
    sget-object p1, Lb/f/b/k/d$b;->LEFT:Lb/f/b/k/d$b;

    invoke-virtual {p0, p1, p2, p1, v1}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;Lb/f/b/k/e;Lb/f/b/k/d$b;I)V

    .line 54
    sget-object p1, Lb/f/b/k/d$b;->RIGHT:Lb/f/b/k/d$b;

    invoke-virtual {p0, p1, p2, p1, v1}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;Lb/f/b/k/e;Lb/f/b/k/d$b;I)V

    const/4 p1, 0x1

    :goto_3d
    if-eqz p4, :cond_45

    .line 55
    invoke-virtual {p4}, Lb/f/b/k/d;->h()Z

    move-result p3

    if-nez p3, :cond_4d

    :cond_45
    if-eqz v0, :cond_4f

    .line 56
    invoke-virtual {v0}, Lb/f/b/k/d;->h()Z

    move-result p3

    if-eqz p3, :cond_4f

    :cond_4d
    const/4 v2, 0x0

    goto :goto_59

    .line 57
    :cond_4f
    sget-object p3, Lb/f/b/k/d$b;->TOP:Lb/f/b/k/d$b;

    invoke-virtual {p0, p3, p2, p3, v1}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;Lb/f/b/k/e;Lb/f/b/k/d$b;I)V

    .line 58
    sget-object p3, Lb/f/b/k/d$b;->BOTTOM:Lb/f/b/k/d$b;

    invoke-virtual {p0, p3, p2, p3, v1}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;Lb/f/b/k/e;Lb/f/b/k/d$b;I)V

    :goto_59
    if-eqz p1, :cond_6e

    if-eqz v2, :cond_6e

    .line 59
    sget-object p1, Lb/f/b/k/d$b;->CENTER:Lb/f/b/k/d$b;

    invoke-virtual {p0, p1}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object p1

    .line 60
    sget-object p3, Lb/f/b/k/d$b;->CENTER:Lb/f/b/k/d$b;

    invoke-virtual {p2, p3}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object p2

    invoke-virtual {p1, p2, v1}, Lb/f/b/k/d;->a(Lb/f/b/k/d;I)Z

    goto/16 :goto_233

    :cond_6e
    if-eqz p1, :cond_81

    .line 61
    sget-object p1, Lb/f/b/k/d$b;->CENTER_X:Lb/f/b/k/d$b;

    invoke-virtual {p0, p1}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object p1

    .line 62
    sget-object p3, Lb/f/b/k/d$b;->CENTER_X:Lb/f/b/k/d$b;

    invoke-virtual {p2, p3}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object p2

    invoke-virtual {p1, p2, v1}, Lb/f/b/k/d;->a(Lb/f/b/k/d;I)Z

    goto/16 :goto_233

    :cond_81
    if-eqz v2, :cond_233

    .line 63
    sget-object p1, Lb/f/b/k/d$b;->CENTER_Y:Lb/f/b/k/d$b;

    invoke-virtual {p0, p1}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object p1

    .line 64
    sget-object p3, Lb/f/b/k/d$b;->CENTER_Y:Lb/f/b/k/d$b;

    invoke-virtual {p2, p3}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object p2

    invoke-virtual {p1, p2, v1}, Lb/f/b/k/d;->a(Lb/f/b/k/d;I)Z

    goto/16 :goto_233

    .line 65
    :cond_94
    sget-object p1, Lb/f/b/k/d$b;->LEFT:Lb/f/b/k/d$b;

    if-eq p3, p1, :cond_be

    sget-object p1, Lb/f/b/k/d$b;->RIGHT:Lb/f/b/k/d$b;

    if-ne p3, p1, :cond_9d

    goto :goto_be

    .line 66
    :cond_9d
    sget-object p1, Lb/f/b/k/d$b;->TOP:Lb/f/b/k/d$b;

    if-eq p3, p1, :cond_a5

    sget-object p1, Lb/f/b/k/d$b;->BOTTOM:Lb/f/b/k/d$b;

    if-ne p3, p1, :cond_233

    .line 67
    :cond_a5
    sget-object p1, Lb/f/b/k/d$b;->TOP:Lb/f/b/k/d$b;

    invoke-virtual {p0, p1, p2, p3, v1}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;Lb/f/b/k/e;Lb/f/b/k/d$b;I)V

    .line 68
    sget-object p1, Lb/f/b/k/d$b;->BOTTOM:Lb/f/b/k/d$b;

    invoke-virtual {p0, p1, p2, p3, v1}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;Lb/f/b/k/e;Lb/f/b/k/d$b;I)V

    .line 69
    sget-object p1, Lb/f/b/k/d$b;->CENTER:Lb/f/b/k/d$b;

    invoke-virtual {p0, p1}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object p1

    .line 70
    invoke-virtual {p2, p3}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object p2

    invoke-virtual {p1, p2, v1}, Lb/f/b/k/d;->a(Lb/f/b/k/d;I)Z

    goto/16 :goto_233

    .line 71
    :cond_be
    :goto_be
    sget-object p1, Lb/f/b/k/d$b;->LEFT:Lb/f/b/k/d$b;

    invoke-virtual {p0, p1, p2, p3, v1}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;Lb/f/b/k/e;Lb/f/b/k/d$b;I)V

    .line 72
    sget-object p1, Lb/f/b/k/d$b;->RIGHT:Lb/f/b/k/d$b;

    :try_start_c5
    invoke-virtual {p0, p1, p2, p3, v1}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;Lb/f/b/k/e;Lb/f/b/k/d$b;I)V
    :try_end_c8
    .catchall {:try_start_c5 .. :try_end_c8} :catchall_234

    .line 73
    sget-object p1, Lb/f/b/k/d$b;->CENTER:Lb/f/b/k/d$b;

    invoke-virtual {p0, p1}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object p1

    .line 74
    invoke-virtual {p2, p3}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object p2

    invoke-virtual {p1, p2, v1}, Lb/f/b/k/d;->a(Lb/f/b/k/d;I)Z

    goto/16 :goto_233

    .line 75
    :cond_d7
    sget-object v0, Lb/f/b/k/d$b;->CENTER_X:Lb/f/b/k/d$b;

    if-ne p1, v0, :cond_104

    sget-object v0, Lb/f/b/k/d$b;->LEFT:Lb/f/b/k/d$b;

    if-eq p3, v0, :cond_e3

    sget-object v0, Lb/f/b/k/d$b;->RIGHT:Lb/f/b/k/d$b;

    if-ne p3, v0, :cond_104

    .line 76
    :cond_e3
    sget-object p1, Lb/f/b/k/d$b;->LEFT:Lb/f/b/k/d$b;

    invoke-virtual {p0, p1}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object p1

    .line 77
    invoke-virtual {p2, p3}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object p2

    .line 78
    sget-object p3, Lb/f/b/k/d$b;->RIGHT:Lb/f/b/k/d$b;

    invoke-virtual {p0, p3}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object p3

    .line 79
    invoke-virtual {p1, p2, v1}, Lb/f/b/k/d;->a(Lb/f/b/k/d;I)Z

    .line 80
    invoke-virtual {p3, p2, v1}, Lb/f/b/k/d;->a(Lb/f/b/k/d;I)Z

    .line 81
    sget-object p1, Lb/f/b/k/d$b;->CENTER_X:Lb/f/b/k/d$b;

    invoke-virtual {p0, p1}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object p1

    .line 82
    invoke-virtual {p1, p2, v1}, Lb/f/b/k/d;->a(Lb/f/b/k/d;I)Z

    goto/16 :goto_233

    .line 83
    :cond_104
    sget-object v0, Lb/f/b/k/d$b;->CENTER_Y:Lb/f/b/k/d$b;

    if-ne p1, v0, :cond_131

    sget-object v0, Lb/f/b/k/d$b;->TOP:Lb/f/b/k/d$b;

    if-eq p3, v0, :cond_110

    sget-object v0, Lb/f/b/k/d$b;->BOTTOM:Lb/f/b/k/d$b;

    if-ne p3, v0, :cond_131

    .line 84
    :cond_110
    invoke-virtual {p2, p3}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object p1

    .line 85
    sget-object p2, Lb/f/b/k/d$b;->TOP:Lb/f/b/k/d$b;

    invoke-virtual {p0, p2}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object p2

    .line 86
    invoke-virtual {p2, p1, v1}, Lb/f/b/k/d;->a(Lb/f/b/k/d;I)Z

    .line 87
    sget-object p2, Lb/f/b/k/d$b;->BOTTOM:Lb/f/b/k/d$b;

    invoke-virtual {p0, p2}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object p2

    .line 88
    invoke-virtual {p2, p1, v1}, Lb/f/b/k/d;->a(Lb/f/b/k/d;I)Z

    .line 89
    sget-object p2, Lb/f/b/k/d$b;->CENTER_Y:Lb/f/b/k/d$b;

    invoke-virtual {p0, p2}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object p2

    .line 90
    invoke-virtual {p2, p1, v1}, Lb/f/b/k/d;->a(Lb/f/b/k/d;I)Z

    goto/16 :goto_233

    .line 91
    :cond_131
    sget-object v0, Lb/f/b/k/d$b;->CENTER_X:Lb/f/b/k/d$b;

    if-ne p1, v0, :cond_164

    if-ne p3, v0, :cond_164

    .line 92
    sget-object p1, Lb/f/b/k/d$b;->LEFT:Lb/f/b/k/d$b;

    invoke-virtual {p0, p1}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object p1

    .line 93
    sget-object p4, Lb/f/b/k/d$b;->LEFT:Lb/f/b/k/d$b;

    invoke-virtual {p2, p4}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object p4

    .line 94
    invoke-virtual {p1, p4, v1}, Lb/f/b/k/d;->a(Lb/f/b/k/d;I)Z

    .line 95
    sget-object p1, Lb/f/b/k/d$b;->RIGHT:Lb/f/b/k/d$b;

    invoke-virtual {p0, p1}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object p1

    .line 96
    sget-object p4, Lb/f/b/k/d$b;->RIGHT:Lb/f/b/k/d$b;

    invoke-virtual {p2, p4}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object p4

    .line 97
    invoke-virtual {p1, p4, v1}, Lb/f/b/k/d;->a(Lb/f/b/k/d;I)Z

    .line 98
    sget-object p1, Lb/f/b/k/d$b;->CENTER_X:Lb/f/b/k/d$b;

    invoke-virtual {p0, p1}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object p1

    .line 99
    invoke-virtual {p2, p3}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object p2

    invoke-virtual {p1, p2, v1}, Lb/f/b/k/d;->a(Lb/f/b/k/d;I)Z

    goto/16 :goto_233

    .line 100
    :cond_164
    sget-object v0, Lb/f/b/k/d$b;->CENTER_Y:Lb/f/b/k/d$b;

    if-ne p1, v0, :cond_197

    if-ne p3, v0, :cond_197

    .line 101
    sget-object p1, Lb/f/b/k/d$b;->TOP:Lb/f/b/k/d$b;

    invoke-virtual {p0, p1}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object p1

    .line 102
    sget-object p4, Lb/f/b/k/d$b;->TOP:Lb/f/b/k/d$b;

    invoke-virtual {p2, p4}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object p4

    .line 103
    invoke-virtual {p1, p4, v1}, Lb/f/b/k/d;->a(Lb/f/b/k/d;I)Z

    .line 104
    sget-object p1, Lb/f/b/k/d$b;->BOTTOM:Lb/f/b/k/d$b;

    invoke-virtual {p0, p1}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object p1

    .line 105
    sget-object p4, Lb/f/b/k/d$b;->BOTTOM:Lb/f/b/k/d$b;

    invoke-virtual {p2, p4}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object p4

    .line 106
    invoke-virtual {p1, p4, v1}, Lb/f/b/k/d;->a(Lb/f/b/k/d;I)Z

    .line 107
    sget-object p1, Lb/f/b/k/d$b;->CENTER_Y:Lb/f/b/k/d$b;

    invoke-virtual {p0, p1}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object p1

    .line 108
    invoke-virtual {p2, p3}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object p2

    invoke-virtual {p1, p2, v1}, Lb/f/b/k/d;->a(Lb/f/b/k/d;I)Z

    goto/16 :goto_233

    .line 109
    :cond_197
    invoke-virtual {p0, p1}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object v0

    .line 110
    invoke-virtual {p2, p3}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object p2

    .line 111
    invoke-virtual {v0, p2}, Lb/f/b/k/d;->a(Lb/f/b/k/d;)Z

    move-result p3

    if-eqz p3, :cond_233

    .line 112
    sget-object p3, Lb/f/b/k/d$b;->BASELINE:Lb/f/b/k/d$b;

    if-ne p1, p3, :cond_1c1

    .line 113
    sget-object p1, Lb/f/b/k/d$b;->TOP:Lb/f/b/k/d$b;

    invoke-virtual {p0, p1}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object p1

    .line 114
    sget-object p3, Lb/f/b/k/d$b;->BOTTOM:Lb/f/b/k/d$b;

    invoke-virtual {p0, p3}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object p3

    if-eqz p1, :cond_1ba

    .line 115
    invoke-virtual {p1}, Lb/f/b/k/d;->i()V

    :cond_1ba
    if-eqz p3, :cond_1bf

    .line 116
    invoke-virtual {p3}, Lb/f/b/k/d;->i()V

    :cond_1bf
    const/4 p4, 0x0

    goto :goto_230

    .line 117
    :cond_1c1
    sget-object p3, Lb/f/b/k/d$b;->TOP:Lb/f/b/k/d$b;

    if-eq p1, p3, :cond_1fc

    sget-object p3, Lb/f/b/k/d$b;->BOTTOM:Lb/f/b/k/d$b;

    if-ne p1, p3, :cond_1ca

    goto :goto_1fc

    .line 118
    :cond_1ca
    sget-object p3, Lb/f/b/k/d$b;->LEFT:Lb/f/b/k/d$b;

    if-eq p1, p3, :cond_1d2

    sget-object p3, Lb/f/b/k/d$b;->RIGHT:Lb/f/b/k/d$b;

    if-ne p1, p3, :cond_230

    .line 119
    :cond_1d2
    sget-object p3, Lb/f/b/k/d$b;->CENTER:Lb/f/b/k/d$b;

    invoke-virtual {p0, p3}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object p3

    .line 120
    invoke-virtual {p3}, Lb/f/b/k/d;->e()Lb/f/b/k/d;

    move-result-object v1

    if-eq v1, p2, :cond_1e1

    .line 121
    invoke-virtual {p3}, Lb/f/b/k/d;->i()V

    .line 122
    :cond_1e1
    invoke-virtual {p0, p1}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object p1

    invoke-virtual {p1}, Lb/f/b/k/d;->b()Lb/f/b/k/d;

    move-result-object p1

    .line 123
    sget-object p3, Lb/f/b/k/d$b;->CENTER_X:Lb/f/b/k/d$b;

    invoke-virtual {p0, p3}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object p3

    .line 124
    invoke-virtual {p3}, Lb/f/b/k/d;->h()Z

    move-result v1

    if-eqz v1, :cond_230

    .line 125
    invoke-virtual {p1}, Lb/f/b/k/d;->i()V

    .line 126
    invoke-virtual {p3}, Lb/f/b/k/d;->i()V

    goto :goto_230

    .line 127
    :cond_1fc
    :goto_1fc
    sget-object p3, Lb/f/b/k/d$b;->BASELINE:Lb/f/b/k/d$b;

    invoke-virtual {p0, p3}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object p3

    if-eqz p3, :cond_207

    .line 128
    invoke-virtual {p3}, Lb/f/b/k/d;->i()V

    .line 129
    :cond_207
    sget-object p3, Lb/f/b/k/d$b;->CENTER:Lb/f/b/k/d$b;

    invoke-virtual {p0, p3}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object p3

    .line 130
    invoke-virtual {p3}, Lb/f/b/k/d;->e()Lb/f/b/k/d;

    move-result-object v1

    if-eq v1, p2, :cond_216

    .line 131
    invoke-virtual {p3}, Lb/f/b/k/d;->i()V

    .line 132
    :cond_216
    invoke-virtual {p0, p1}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object p1

    invoke-virtual {p1}, Lb/f/b/k/d;->b()Lb/f/b/k/d;

    move-result-object p1

    .line 133
    sget-object p3, Lb/f/b/k/d$b;->CENTER_Y:Lb/f/b/k/d$b;

    invoke-virtual {p0, p3}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object p3

    .line 134
    invoke-virtual {p3}, Lb/f/b/k/d;->h()Z

    move-result v1

    if-eqz v1, :cond_230

    .line 135
    invoke-virtual {p1}, Lb/f/b/k/d;->i()V

    .line 136
    invoke-virtual {p3}, Lb/f/b/k/d;->i()V

    .line 137
    :cond_230
    :goto_230
    invoke-virtual {v0, p2, p4}, Lb/f/b/k/d;->a(Lb/f/b/k/d;I)Z

    :cond_233
    :goto_233
    return-void

    :catchall_234
    move-exception p1

    .line 138
    throw p1
.end method

.method public a(Lb/f/b/k/d$b;Lb/f/b/k/e;Lb/f/b/k/d$b;II)V
    .registers 6

    .line 41
    invoke-virtual {p0, p1}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object p1

    .line 42
    invoke-virtual {p2, p3}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object p2

    const/4 p3, 0x1

    .line 43
    invoke-virtual {p1, p2, p4, p5, p3}, Lb/f/b/k/d;->a(Lb/f/b/k/d;IIZ)Z

    return-void
.end method

.method public a(Lb/f/b/k/d;Lb/f/b/k/d;I)V
    .registers 5

    .line 44
    invoke-virtual {p1}, Lb/f/b/k/d;->c()Lb/f/b/k/e;

    move-result-object v0

    if-ne v0, p0, :cond_15

    .line 45
    invoke-virtual {p1}, Lb/f/b/k/d;->f()Lb/f/b/k/d$b;

    move-result-object p1

    invoke-virtual {p2}, Lb/f/b/k/d;->c()Lb/f/b/k/e;

    move-result-object v0

    invoke-virtual {p2}, Lb/f/b/k/d;->f()Lb/f/b/k/d$b;

    move-result-object p2

    invoke-virtual {p0, p1, v0, p2, p3}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;Lb/f/b/k/e;Lb/f/b/k/d$b;I)V

    :cond_15
    return-void
.end method

.method public a(Lb/f/b/k/e$b;)V
    .registers 4

    .line 149
    iget-object v0, p0, Lb/f/b/k/e;->L:[Lb/f/b/k/e$b;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    return-void
.end method

.method public a(Lb/f/b/k/e;FI)V
    .registers 10

    .line 11
    sget-object v3, Lb/f/b/k/d$b;->CENTER:Lb/f/b/k/d$b;

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, v3

    move-object v2, p1

    move v4, p3

    invoke-virtual/range {v0 .. v5}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;Lb/f/b/k/e;Lb/f/b/k/d$b;II)V

    .line 12
    iput p2, p0, Lb/f/b/k/e;->x:F

    return-void
.end method

.method public a(Lb/f/b/k/e;Ljava/util/HashMap;)V
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lb/f/b/k/e;",
            "Ljava/util/HashMap<",
            "Lb/f/b/k/e;",
            "Lb/f/b/k/e;",
            ">;)V"
        }
    .end annotation

    .line 355
    iget v0, p1, Lb/f/b/k/e;->h:I

    iput v0, p0, Lb/f/b/k/e;->h:I

    .line 356
    iget v0, p1, Lb/f/b/k/e;->i:I

    iput v0, p0, Lb/f/b/k/e;->i:I

    .line 357
    iget v0, p1, Lb/f/b/k/e;->j:I

    iput v0, p0, Lb/f/b/k/e;->j:I

    .line 358
    iget v0, p1, Lb/f/b/k/e;->k:I

    iput v0, p0, Lb/f/b/k/e;->k:I

    .line 359
    iget-object v0, p0, Lb/f/b/k/e;->l:[I

    iget-object v1, p1, Lb/f/b/k/e;->l:[I

    const/4 v2, 0x0

    aget v3, v1, v2

    aput v3, v0, v2

    const/4 v3, 0x1

    .line 360
    aget v1, v1, v3

    aput v1, v0, v3

    .line 361
    iget v0, p1, Lb/f/b/k/e;->m:I

    iput v0, p0, Lb/f/b/k/e;->m:I

    .line 362
    iget v0, p1, Lb/f/b/k/e;->n:I

    iput v0, p0, Lb/f/b/k/e;->n:I

    .line 363
    iget v0, p1, Lb/f/b/k/e;->p:I

    iput v0, p0, Lb/f/b/k/e;->p:I

    .line 364
    iget v0, p1, Lb/f/b/k/e;->q:I

    iput v0, p0, Lb/f/b/k/e;->q:I

    .line 365
    iget v0, p1, Lb/f/b/k/e;->r:F

    iput v0, p0, Lb/f/b/k/e;->r:F

    .line 366
    iget-boolean v0, p1, Lb/f/b/k/e;->s:Z

    iput-boolean v0, p0, Lb/f/b/k/e;->s:Z

    .line 367
    iget-boolean v0, p1, Lb/f/b/k/e;->t:Z

    iput-boolean v0, p0, Lb/f/b/k/e;->t:Z

    .line 368
    iget v0, p1, Lb/f/b/k/e;->u:I

    iput v0, p0, Lb/f/b/k/e;->u:I

    .line 369
    iget v0, p1, Lb/f/b/k/e;->v:F

    iput v0, p0, Lb/f/b/k/e;->v:F

    .line 370
    iget-object v0, p1, Lb/f/b/k/e;->w:[I

    array-length v1, v0

    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v0

    iput-object v0, p0, Lb/f/b/k/e;->w:[I

    .line 371
    iget v0, p1, Lb/f/b/k/e;->x:F

    iput v0, p0, Lb/f/b/k/e;->x:F

    .line 372
    iget-boolean v0, p1, Lb/f/b/k/e;->y:Z

    iput-boolean v0, p0, Lb/f/b/k/e;->y:Z

    .line 373
    iget-boolean v0, p1, Lb/f/b/k/e;->z:Z

    iput-boolean v0, p0, Lb/f/b/k/e;->z:Z

    .line 374
    iget-object v0, p0, Lb/f/b/k/e;->A:Lb/f/b/k/d;

    invoke-virtual {v0}, Lb/f/b/k/d;->i()V

    .line 375
    iget-object v0, p0, Lb/f/b/k/e;->B:Lb/f/b/k/d;

    invoke-virtual {v0}, Lb/f/b/k/d;->i()V

    .line 376
    iget-object v0, p0, Lb/f/b/k/e;->C:Lb/f/b/k/d;

    invoke-virtual {v0}, Lb/f/b/k/d;->i()V

    .line 377
    iget-object v0, p0, Lb/f/b/k/e;->D:Lb/f/b/k/d;

    invoke-virtual {v0}, Lb/f/b/k/d;->i()V

    .line 378
    iget-object v0, p0, Lb/f/b/k/e;->E:Lb/f/b/k/d;

    invoke-virtual {v0}, Lb/f/b/k/d;->i()V

    .line 379
    iget-object v0, p0, Lb/f/b/k/e;->F:Lb/f/b/k/d;

    invoke-virtual {v0}, Lb/f/b/k/d;->i()V

    .line 380
    iget-object v0, p0, Lb/f/b/k/e;->G:Lb/f/b/k/d;

    invoke-virtual {v0}, Lb/f/b/k/d;->i()V

    .line 381
    iget-object v0, p0, Lb/f/b/k/e;->H:Lb/f/b/k/d;

    invoke-virtual {v0}, Lb/f/b/k/d;->i()V

    .line 382
    iget-object v0, p0, Lb/f/b/k/e;->L:[Lb/f/b/k/e$b;

    const/4 v1, 0x2

    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lb/f/b/k/e$b;

    iput-object v0, p0, Lb/f/b/k/e;->L:[Lb/f/b/k/e$b;

    .line 383
    iget-object v0, p0, Lb/f/b/k/e;->M:Lb/f/b/k/e;

    const/4 v1, 0x0

    if-nez v0, :cond_91

    move-object v0, v1

    goto :goto_99

    :cond_91
    iget-object v0, p1, Lb/f/b/k/e;->M:Lb/f/b/k/e;

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb/f/b/k/e;

    :goto_99
    iput-object v0, p0, Lb/f/b/k/e;->M:Lb/f/b/k/e;

    .line 384
    iget v0, p1, Lb/f/b/k/e;->N:I

    iput v0, p0, Lb/f/b/k/e;->N:I

    .line 385
    iget v0, p1, Lb/f/b/k/e;->O:I

    iput v0, p0, Lb/f/b/k/e;->O:I

    .line 386
    iget v0, p1, Lb/f/b/k/e;->P:F

    iput v0, p0, Lb/f/b/k/e;->P:F

    .line 387
    iget v0, p1, Lb/f/b/k/e;->Q:I

    iput v0, p0, Lb/f/b/k/e;->Q:I

    .line 388
    iget v0, p1, Lb/f/b/k/e;->R:I

    iput v0, p0, Lb/f/b/k/e;->R:I

    .line 389
    iget v0, p1, Lb/f/b/k/e;->S:I

    iput v0, p0, Lb/f/b/k/e;->S:I

    .line 390
    iget v0, p1, Lb/f/b/k/e;->T:I

    iput v0, p0, Lb/f/b/k/e;->T:I

    .line 391
    iget v0, p1, Lb/f/b/k/e;->U:I

    iput v0, p0, Lb/f/b/k/e;->U:I

    .line 392
    iget v0, p1, Lb/f/b/k/e;->V:I

    iput v0, p0, Lb/f/b/k/e;->V:I

    .line 393
    iget v0, p1, Lb/f/b/k/e;->W:I

    iput v0, p0, Lb/f/b/k/e;->W:I

    .line 394
    iget v0, p1, Lb/f/b/k/e;->X:I

    iput v0, p0, Lb/f/b/k/e;->X:I

    .line 395
    iget v0, p1, Lb/f/b/k/e;->Y:I

    iput v0, p0, Lb/f/b/k/e;->Y:I

    .line 396
    iget v0, p1, Lb/f/b/k/e;->Z:I

    iput v0, p0, Lb/f/b/k/e;->Z:I

    .line 397
    iget v0, p1, Lb/f/b/k/e;->a0:F

    iput v0, p0, Lb/f/b/k/e;->a0:F

    .line 398
    iget v0, p1, Lb/f/b/k/e;->b0:F

    iput v0, p0, Lb/f/b/k/e;->b0:F

    .line 399
    iget-object v0, p1, Lb/f/b/k/e;->c0:Ljava/lang/Object;

    iput-object v0, p0, Lb/f/b/k/e;->c0:Ljava/lang/Object;

    .line 400
    iget v0, p1, Lb/f/b/k/e;->d0:I

    iput v0, p0, Lb/f/b/k/e;->d0:I

    .line 401
    iget v0, p1, Lb/f/b/k/e;->e0:I

    iput v0, p0, Lb/f/b/k/e;->e0:I

    .line 402
    iget-object v0, p1, Lb/f/b/k/e;->f0:Ljava/lang/String;

    iput-object v0, p0, Lb/f/b/k/e;->f0:Ljava/lang/String;

    .line 403
    iget-object v0, p1, Lb/f/b/k/e;->g0:Ljava/lang/String;

    iput-object v0, p0, Lb/f/b/k/e;->g0:Ljava/lang/String;

    .line 404
    iget v0, p1, Lb/f/b/k/e;->h0:I

    iput v0, p0, Lb/f/b/k/e;->h0:I

    .line 405
    iget v0, p1, Lb/f/b/k/e;->i0:I

    iput v0, p0, Lb/f/b/k/e;->i0:I

    .line 406
    iget v0, p1, Lb/f/b/k/e;->j0:I

    iput v0, p0, Lb/f/b/k/e;->j0:I

    .line 407
    iget v0, p1, Lb/f/b/k/e;->k0:I

    iput v0, p0, Lb/f/b/k/e;->k0:I

    .line 408
    iget-boolean v0, p1, Lb/f/b/k/e;->l0:Z

    iput-boolean v0, p0, Lb/f/b/k/e;->l0:Z

    .line 409
    iget-boolean v0, p1, Lb/f/b/k/e;->m0:Z

    iput-boolean v0, p0, Lb/f/b/k/e;->m0:Z

    .line 410
    iget-boolean v0, p1, Lb/f/b/k/e;->n0:Z

    iput-boolean v0, p0, Lb/f/b/k/e;->n0:Z

    .line 411
    iget-boolean v0, p1, Lb/f/b/k/e;->o0:Z

    iput-boolean v0, p0, Lb/f/b/k/e;->o0:Z

    .line 412
    iget-boolean v0, p1, Lb/f/b/k/e;->p0:Z

    iput-boolean v0, p0, Lb/f/b/k/e;->p0:Z

    .line 413
    iget-boolean v0, p1, Lb/f/b/k/e;->q0:Z

    iput-boolean v0, p0, Lb/f/b/k/e;->q0:Z

    .line 414
    iget-boolean v0, p1, Lb/f/b/k/e;->r0:Z

    iput-boolean v0, p0, Lb/f/b/k/e;->r0:Z

    .line 415
    iget-boolean v0, p1, Lb/f/b/k/e;->s0:Z

    iput-boolean v0, p0, Lb/f/b/k/e;->s0:Z

    .line 416
    iget v0, p1, Lb/f/b/k/e;->t0:I

    iput v0, p0, Lb/f/b/k/e;->t0:I

    .line 417
    iget v0, p1, Lb/f/b/k/e;->u0:I

    iput v0, p0, Lb/f/b/k/e;->u0:I

    .line 418
    iget-boolean v0, p1, Lb/f/b/k/e;->v0:Z

    iput-boolean v0, p0, Lb/f/b/k/e;->v0:Z

    .line 419
    iget-boolean v0, p1, Lb/f/b/k/e;->w0:Z

    iput-boolean v0, p0, Lb/f/b/k/e;->w0:Z

    .line 420
    iget-object v0, p0, Lb/f/b/k/e;->x0:[F

    iget-object v4, p1, Lb/f/b/k/e;->x0:[F

    aget v5, v4, v2

    aput v5, v0, v2

    .line 421
    aget v4, v4, v3

    aput v4, v0, v3

    .line 422
    iget-object v0, p0, Lb/f/b/k/e;->y0:[Lb/f/b/k/e;

    iget-object v4, p1, Lb/f/b/k/e;->y0:[Lb/f/b/k/e;

    aget-object v5, v4, v2

    aput-object v5, v0, v2

    .line 423
    aget-object v4, v4, v3

    aput-object v4, v0, v3

    .line 424
    iget-object v0, p0, Lb/f/b/k/e;->z0:[Lb/f/b/k/e;

    iget-object v4, p1, Lb/f/b/k/e;->z0:[Lb/f/b/k/e;

    aget-object v5, v4, v2

    aput-object v5, v0, v2

    .line 425
    aget-object v2, v4, v3

    aput-object v2, v0, v3

    .line 426
    iget-object v0, p1, Lb/f/b/k/e;->A0:Lb/f/b/k/e;

    if-nez v0, :cond_155

    move-object v0, v1

    goto :goto_15b

    :cond_155
    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb/f/b/k/e;

    :goto_15b
    iput-object v0, p0, Lb/f/b/k/e;->A0:Lb/f/b/k/e;

    .line 427
    iget-object p1, p1, Lb/f/b/k/e;->B0:Lb/f/b/k/e;

    if-nez p1, :cond_162

    goto :goto_169

    :cond_162
    invoke-virtual {p2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    move-object v1, p1

    check-cast v1, Lb/f/b/k/e;

    :goto_169
    iput-object v1, p0, Lb/f/b/k/e;->B0:Lb/f/b/k/e;

    return-void
.end method

.method public a(Ljava/lang/Object;)V
    .registers 2

    .line 40
    iput-object p1, p0, Lb/f/b/k/e;->c0:Ljava/lang/Object;

    return-void
.end method

.method public a(Ljava/lang/String;)V
    .registers 2

    .line 13
    iput-object p1, p0, Lb/f/b/k/e;->f0:Ljava/lang/String;

    return-void
.end method

.method public a(Z)V
    .registers 2

    .line 1
    iput-boolean p1, p0, Lb/f/b/k/e;->y:Z

    return-void
.end method

.method public a(ZZ)V
    .registers 10

    .line 428
    iget-object v0, p0, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    invoke-virtual {v0}, Lb/f/b/k/n/m;->e()Z

    move-result v0

    and-int/2addr p1, v0

    .line 429
    iget-object v0, p0, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    invoke-virtual {v0}, Lb/f/b/k/n/m;->e()Z

    move-result v0

    and-int/2addr p2, v0

    .line 430
    iget-object v0, p0, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    iget-object v1, v0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget v1, v1, Lb/f/b/k/n/f;->g:I

    .line 431
    iget-object v2, p0, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v3, v2, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget v3, v3, Lb/f/b/k/n/f;->g:I

    .line 432
    iget-object v0, v0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget v0, v0, Lb/f/b/k/n/f;->g:I

    .line 433
    iget-object v2, v2, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget v2, v2, Lb/f/b/k/n/f;->g:I

    sub-int v4, v0, v1

    sub-int v5, v2, v3

    const/4 v6, 0x0

    if-ltz v4, :cond_40

    if-ltz v5, :cond_40

    const/high16 v4, -0x80000000

    if-eq v1, v4, :cond_40

    const v5, 0x7fffffff

    if-eq v1, v5, :cond_40

    if-eq v3, v4, :cond_40

    if-eq v3, v5, :cond_40

    if-eq v0, v4, :cond_40

    if-eq v0, v5, :cond_40

    if-eq v2, v4, :cond_40

    if-ne v2, v5, :cond_44

    :cond_40
    const/4 v0, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :cond_44
    sub-int/2addr v0, v1

    sub-int/2addr v2, v3

    if-eqz p1, :cond_4a

    .line 434
    iput v1, p0, Lb/f/b/k/e;->R:I

    :cond_4a
    if-eqz p2, :cond_4e

    .line 435
    iput v3, p0, Lb/f/b/k/e;->S:I

    .line 436
    :cond_4e
    iget v1, p0, Lb/f/b/k/e;->e0:I

    const/16 v3, 0x8

    if-ne v1, v3, :cond_59

    .line 437
    iput v6, p0, Lb/f/b/k/e;->N:I

    .line 438
    iput v6, p0, Lb/f/b/k/e;->O:I

    return-void

    :cond_59
    if-eqz p1, :cond_70

    .line 439
    iget-object p1, p0, Lb/f/b/k/e;->L:[Lb/f/b/k/e$b;

    aget-object p1, p1, v6

    sget-object v1, Lb/f/b/k/e$b;->FIXED:Lb/f/b/k/e$b;

    if-ne p1, v1, :cond_68

    iget p1, p0, Lb/f/b/k/e;->N:I

    if-ge v0, p1, :cond_68

    move v0, p1

    .line 440
    :cond_68
    iput v0, p0, Lb/f/b/k/e;->N:I

    .line 441
    iget p1, p0, Lb/f/b/k/e;->Y:I

    if-ge v0, p1, :cond_70

    .line 442
    iput p1, p0, Lb/f/b/k/e;->N:I

    :cond_70
    if-eqz p2, :cond_88

    .line 443
    iget-object p1, p0, Lb/f/b/k/e;->L:[Lb/f/b/k/e$b;

    const/4 p2, 0x1

    aget-object p1, p1, p2

    sget-object p2, Lb/f/b/k/e$b;->FIXED:Lb/f/b/k/e$b;

    if-ne p1, p2, :cond_80

    iget p1, p0, Lb/f/b/k/e;->O:I

    if-ge v2, p1, :cond_80

    move v2, p1

    .line 444
    :cond_80
    iput v2, p0, Lb/f/b/k/e;->O:I

    .line 445
    iget p1, p0, Lb/f/b/k/e;->Z:I

    if-ge v2, p1, :cond_88

    .line 446
    iput p1, p0, Lb/f/b/k/e;->O:I

    :cond_88
    return-void
.end method

.method public a(ZZZZ)V
    .registers 8

    .line 262
    iget p1, p0, Lb/f/b/k/e;->u:I

    const/high16 p2, 0x3f800000    # 1.0f

    const/4 v0, 0x0

    const/4 v1, -0x1

    const/4 v2, 0x1

    if-ne p1, v1, :cond_20

    if-eqz p3, :cond_10

    if-nez p4, :cond_10

    .line 263
    iput v0, p0, Lb/f/b/k/e;->u:I

    goto :goto_20

    :cond_10
    if-nez p3, :cond_20

    if-eqz p4, :cond_20

    .line 264
    iput v2, p0, Lb/f/b/k/e;->u:I

    .line 265
    iget p1, p0, Lb/f/b/k/e;->Q:I

    if-ne p1, v1, :cond_20

    .line 266
    iget p1, p0, Lb/f/b/k/e;->v:F

    div-float p1, p2, p1

    iput p1, p0, Lb/f/b/k/e;->v:F

    .line 267
    :cond_20
    :goto_20
    iget p1, p0, Lb/f/b/k/e;->u:I

    if-nez p1, :cond_37

    iget-object p1, p0, Lb/f/b/k/e;->B:Lb/f/b/k/d;

    invoke-virtual {p1}, Lb/f/b/k/d;->h()Z

    move-result p1

    if-eqz p1, :cond_34

    iget-object p1, p0, Lb/f/b/k/e;->D:Lb/f/b/k/d;

    invoke-virtual {p1}, Lb/f/b/k/d;->h()Z

    move-result p1

    if-nez p1, :cond_37

    .line 268
    :cond_34
    iput v2, p0, Lb/f/b/k/e;->u:I

    goto :goto_4d

    .line 269
    :cond_37
    iget p1, p0, Lb/f/b/k/e;->u:I

    if-ne p1, v2, :cond_4d

    iget-object p1, p0, Lb/f/b/k/e;->A:Lb/f/b/k/d;

    invoke-virtual {p1}, Lb/f/b/k/d;->h()Z

    move-result p1

    if-eqz p1, :cond_4b

    iget-object p1, p0, Lb/f/b/k/e;->C:Lb/f/b/k/d;

    invoke-virtual {p1}, Lb/f/b/k/d;->h()Z

    move-result p1

    if-nez p1, :cond_4d

    .line 270
    :cond_4b
    iput v0, p0, Lb/f/b/k/e;->u:I

    .line 271
    :cond_4d
    :goto_4d
    iget p1, p0, Lb/f/b/k/e;->u:I

    if-ne p1, v1, :cond_9c

    .line 272
    iget-object p1, p0, Lb/f/b/k/e;->B:Lb/f/b/k/d;

    invoke-virtual {p1}, Lb/f/b/k/d;->h()Z

    move-result p1

    if-eqz p1, :cond_71

    iget-object p1, p0, Lb/f/b/k/e;->D:Lb/f/b/k/d;

    invoke-virtual {p1}, Lb/f/b/k/d;->h()Z

    move-result p1

    if-eqz p1, :cond_71

    iget-object p1, p0, Lb/f/b/k/e;->A:Lb/f/b/k/d;

    .line 273
    invoke-virtual {p1}, Lb/f/b/k/d;->h()Z

    move-result p1

    if-eqz p1, :cond_71

    iget-object p1, p0, Lb/f/b/k/e;->C:Lb/f/b/k/d;

    invoke-virtual {p1}, Lb/f/b/k/d;->h()Z

    move-result p1

    if-nez p1, :cond_9c

    .line 274
    :cond_71
    iget-object p1, p0, Lb/f/b/k/e;->B:Lb/f/b/k/d;

    invoke-virtual {p1}, Lb/f/b/k/d;->h()Z

    move-result p1

    if-eqz p1, :cond_84

    iget-object p1, p0, Lb/f/b/k/e;->D:Lb/f/b/k/d;

    invoke-virtual {p1}, Lb/f/b/k/d;->h()Z

    move-result p1

    if-eqz p1, :cond_84

    .line 275
    iput v0, p0, Lb/f/b/k/e;->u:I

    goto :goto_9c

    .line 276
    :cond_84
    iget-object p1, p0, Lb/f/b/k/e;->A:Lb/f/b/k/d;

    invoke-virtual {p1}, Lb/f/b/k/d;->h()Z

    move-result p1

    if-eqz p1, :cond_9c

    iget-object p1, p0, Lb/f/b/k/e;->C:Lb/f/b/k/d;

    invoke-virtual {p1}, Lb/f/b/k/d;->h()Z

    move-result p1

    if-eqz p1, :cond_9c

    .line 277
    iget p1, p0, Lb/f/b/k/e;->v:F

    div-float p1, p2, p1

    iput p1, p0, Lb/f/b/k/e;->v:F

    .line 278
    iput v2, p0, Lb/f/b/k/e;->u:I

    .line 279
    :cond_9c
    :goto_9c
    iget p1, p0, Lb/f/b/k/e;->u:I

    if-ne p1, v1, :cond_ba

    .line 280
    iget p1, p0, Lb/f/b/k/e;->m:I

    if-lez p1, :cond_ab

    iget p1, p0, Lb/f/b/k/e;->p:I

    if-nez p1, :cond_ab

    .line 281
    iput v0, p0, Lb/f/b/k/e;->u:I

    goto :goto_ba

    .line 282
    :cond_ab
    iget p1, p0, Lb/f/b/k/e;->m:I

    if-nez p1, :cond_ba

    iget p1, p0, Lb/f/b/k/e;->p:I

    if-lez p1, :cond_ba

    .line 283
    iget p1, p0, Lb/f/b/k/e;->v:F

    div-float/2addr p2, p1

    iput p2, p0, Lb/f/b/k/e;->v:F

    .line 284
    iput v2, p0, Lb/f/b/k/e;->u:I

    :cond_ba
    :goto_ba
    return-void
.end method

.method public b(I)Lb/f/b/k/e$b;
    .registers 3

    if-nez p1, :cond_7

    .line 46
    invoke-virtual {p0}, Lb/f/b/k/e;->n()Lb/f/b/k/e$b;

    move-result-object p1

    return-object p1

    :cond_7
    const/4 v0, 0x1

    if-ne p1, v0, :cond_f

    .line 47
    invoke-virtual {p0}, Lb/f/b/k/e;->x()Lb/f/b/k/e$b;

    move-result-object p1

    return-object p1

    :cond_f
    const/4 p1, 0x0

    return-object p1
.end method

.method public final b()V
    .registers 3

    .line 2
    iget-object v0, p0, Lb/f/b/k/e;->J:Ljava/util/ArrayList;

    iget-object v1, p0, Lb/f/b/k/e;->A:Lb/f/b/k/d;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 3
    iget-object v0, p0, Lb/f/b/k/e;->J:Ljava/util/ArrayList;

    iget-object v1, p0, Lb/f/b/k/e;->B:Lb/f/b/k/d;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 4
    iget-object v0, p0, Lb/f/b/k/e;->J:Ljava/util/ArrayList;

    iget-object v1, p0, Lb/f/b/k/e;->C:Lb/f/b/k/d;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 5
    iget-object v0, p0, Lb/f/b/k/e;->J:Ljava/util/ArrayList;

    iget-object v1, p0, Lb/f/b/k/e;->D:Lb/f/b/k/d;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 6
    iget-object v0, p0, Lb/f/b/k/e;->J:Ljava/util/ArrayList;

    iget-object v1, p0, Lb/f/b/k/e;->F:Lb/f/b/k/d;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 7
    iget-object v0, p0, Lb/f/b/k/e;->J:Ljava/util/ArrayList;

    iget-object v1, p0, Lb/f/b/k/e;->G:Lb/f/b/k/d;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 8
    iget-object v0, p0, Lb/f/b/k/e;->J:Ljava/util/ArrayList;

    iget-object v1, p0, Lb/f/b/k/e;->H:Lb/f/b/k/d;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 9
    iget-object v0, p0, Lb/f/b/k/e;->J:Ljava/util/ArrayList;

    iget-object v1, p0, Lb/f/b/k/e;->E:Lb/f/b/k/d;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public b(F)V
    .registers 4

    .line 45
    iget-object v0, p0, Lb/f/b/k/e;->x0:[F

    const/4 v1, 0x0

    aput p1, v0, v1

    return-void
.end method

.method public b(II)V
    .registers 3

    .line 17
    iput p1, p0, Lb/f/b/k/e;->R:I

    .line 18
    iput p2, p0, Lb/f/b/k/e;->S:I

    return-void
.end method

.method public b(IIIF)V
    .registers 5

    .line 19
    iput p1, p0, Lb/f/b/k/e;->k:I

    .line 20
    iput p2, p0, Lb/f/b/k/e;->p:I

    const p1, 0x7fffffff

    if-ne p3, p1, :cond_a

    const/4 p3, 0x0

    .line 21
    :cond_a
    iput p3, p0, Lb/f/b/k/e;->q:I

    .line 22
    iput p4, p0, Lb/f/b/k/e;->r:F

    const/4 p1, 0x0

    cmpl-float p1, p4, p1

    if-lez p1, :cond_20

    const/high16 p1, 0x3f800000    # 1.0f

    cmpg-float p1, p4, p1

    if-gez p1, :cond_20

    .line 23
    iget p1, p0, Lb/f/b/k/e;->k:I

    if-nez p1, :cond_20

    const/4 p1, 0x2

    .line 24
    iput p1, p0, Lb/f/b/k/e;->k:I

    :cond_20
    return-void
.end method

.method public b(Lb/f/b/d;)V
    .registers 3

    .line 11
    iget-object v0, p0, Lb/f/b/k/e;->A:Lb/f/b/k/d;

    invoke-virtual {p1, v0}, Lb/f/b/d;->a(Ljava/lang/Object;)Lb/f/b/i;

    .line 12
    iget-object v0, p0, Lb/f/b/k/e;->B:Lb/f/b/k/d;

    invoke-virtual {p1, v0}, Lb/f/b/d;->a(Ljava/lang/Object;)Lb/f/b/i;

    .line 13
    iget-object v0, p0, Lb/f/b/k/e;->C:Lb/f/b/k/d;

    invoke-virtual {p1, v0}, Lb/f/b/d;->a(Ljava/lang/Object;)Lb/f/b/i;

    .line 14
    iget-object v0, p0, Lb/f/b/k/e;->D:Lb/f/b/k/d;

    invoke-virtual {p1, v0}, Lb/f/b/d;->a(Ljava/lang/Object;)Lb/f/b/i;

    .line 15
    iget v0, p0, Lb/f/b/k/e;->X:I

    if-lez v0, :cond_1d

    .line 16
    iget-object v0, p0, Lb/f/b/k/e;->E:Lb/f/b/k/d;

    invoke-virtual {p1, v0}, Lb/f/b/d;->a(Ljava/lang/Object;)Lb/f/b/i;

    :cond_1d
    return-void
.end method

.method public b(Lb/f/b/k/e$b;)V
    .registers 4

    .line 48
    iget-object v0, p0, Lb/f/b/k/e;->L:[Lb/f/b/k/e$b;

    const/4 v1, 0x1

    aput-object p1, v0, v1

    return-void
.end method

.method public b(Lb/f/b/k/e;)V
    .registers 2

    .line 10
    iput-object p1, p0, Lb/f/b/k/e;->M:Lb/f/b/k/e;

    return-void
.end method

.method public b(Ljava/lang/String;)V
    .registers 10

    const/4 v0, 0x0

    if-eqz p1, :cond_8e

    .line 25
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_b

    goto/16 :goto_8e

    :cond_b
    const/4 v1, -0x1

    .line 26
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    const/16 v3, 0x2c

    .line 27
    invoke-virtual {p1, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-lez v3, :cond_37

    add-int/lit8 v6, v2, -0x1

    if-ge v3, v6, :cond_37

    .line 28
    invoke-virtual {p1, v4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    const-string v7, "W"

    .line 29
    invoke-virtual {v6, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_2c

    const/4 v1, 0x0

    goto :goto_35

    :cond_2c
    const-string v4, "H"

    .line 30
    invoke-virtual {v6, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_35

    const/4 v1, 0x1

    :cond_35
    :goto_35
    add-int/lit8 v4, v3, 0x1

    :cond_37
    const/16 v3, 0x3a

    .line 31
    invoke-virtual {p1, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    if-ltz v3, :cond_75

    sub-int/2addr v2, v5

    if-ge v3, v2, :cond_75

    .line 32
    invoke-virtual {p1, v4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    add-int/2addr v3, v5

    .line 33
    invoke-virtual {p1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 34
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_84

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_84

    .line 35
    :try_start_57
    invoke-static {v2}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v2

    .line 36
    invoke-static {p1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result p1

    cmpl-float v3, v2, v0

    if-lez v3, :cond_84

    cmpl-float v3, p1, v0

    if-lez v3, :cond_84

    if-ne v1, v5, :cond_6f

    div-float/2addr p1, v2

    .line 37
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    goto :goto_85

    :cond_6f
    div-float/2addr v2, p1

    .line 38
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result p1
    :try_end_74
    .catch Ljava/lang/NumberFormatException; {:try_start_57 .. :try_end_74} :catch_84

    goto :goto_85

    .line 39
    :cond_75
    invoke-virtual {p1, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 40
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_84

    .line 41
    :try_start_7f
    invoke-static {p1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result p1
    :try_end_83
    .catch Ljava/lang/NumberFormatException; {:try_start_7f .. :try_end_83} :catch_84

    goto :goto_85

    :catch_84
    :cond_84
    const/4 p1, 0x0

    :goto_85
    cmpl-float v0, p1, v0

    if-lez v0, :cond_8d

    .line 42
    iput p1, p0, Lb/f/b/k/e;->P:F

    .line 43
    iput v1, p0, Lb/f/b/k/e;->Q:I

    :cond_8d
    return-void

    .line 44
    :cond_8e
    :goto_8e
    iput v0, p0, Lb/f/b/k/e;->P:F

    return-void
.end method

.method public b(Z)V
    .registers 2

    .line 1
    iput-boolean p1, p0, Lb/f/b/k/e;->z:Z

    return-void
.end method

.method public c(I)I
    .registers 3

    if-nez p1, :cond_7

    .line 1
    invoke-virtual {p0}, Lb/f/b/k/e;->A()I

    move-result p1

    return p1

    :cond_7
    const/4 v0, 0x1

    if-ne p1, v0, :cond_f

    .line 2
    invoke-virtual {p0}, Lb/f/b/k/e;->k()I

    move-result p1

    return p1

    :cond_f
    const/4 p1, 0x0

    return p1
.end method

.method public c(F)V
    .registers 2

    .line 3
    iput p1, p0, Lb/f/b/k/e;->b0:F

    return-void
.end method

.method public c(II)V
    .registers 3

    .line 4
    iput p1, p0, Lb/f/b/k/e;->S:I

    sub-int/2addr p2, p1

    .line 5
    iput p2, p0, Lb/f/b/k/e;->O:I

    .line 6
    iget p1, p0, Lb/f/b/k/e;->Z:I

    if-ge p2, p1, :cond_b

    .line 7
    iput p1, p0, Lb/f/b/k/e;->O:I

    :cond_b
    return-void
.end method

.method public c(Lb/f/b/d;)V
    .registers 8

    .line 9
    iget-object v0, p0, Lb/f/b/k/e;->A:Lb/f/b/k/d;

    invoke-virtual {p1, v0}, Lb/f/b/d;->b(Ljava/lang/Object;)I

    move-result v0

    .line 10
    iget-object v1, p0, Lb/f/b/k/e;->B:Lb/f/b/k/d;

    invoke-virtual {p1, v1}, Lb/f/b/d;->b(Ljava/lang/Object;)I

    move-result v1

    .line 11
    iget-object v2, p0, Lb/f/b/k/e;->C:Lb/f/b/k/d;

    invoke-virtual {p1, v2}, Lb/f/b/d;->b(Ljava/lang/Object;)I

    move-result v2

    .line 12
    iget-object v3, p0, Lb/f/b/k/e;->D:Lb/f/b/k/d;

    invoke-virtual {p1, v3}, Lb/f/b/d;->b(Ljava/lang/Object;)I

    move-result p1

    .line 13
    iget-object v3, p0, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    iget-object v4, v3, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-boolean v5, v4, Lb/f/b/k/n/f;->j:Z

    if-eqz v5, :cond_2a

    iget-object v3, v3, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget-boolean v5, v3, Lb/f/b/k/n/f;->j:Z

    if-eqz v5, :cond_2a

    .line 14
    iget v0, v4, Lb/f/b/k/n/f;->g:I

    .line 15
    iget v2, v3, Lb/f/b/k/n/f;->g:I

    .line 16
    :cond_2a
    iget-object v3, p0, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v4, v3, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-boolean v5, v4, Lb/f/b/k/n/f;->j:Z

    if-eqz v5, :cond_3c

    iget-object v3, v3, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget-boolean v5, v3, Lb/f/b/k/n/f;->j:Z

    if-eqz v5, :cond_3c

    .line 17
    iget v1, v4, Lb/f/b/k/n/f;->g:I

    .line 18
    iget p1, v3, Lb/f/b/k/n/f;->g:I

    :cond_3c
    sub-int v3, v2, v0

    sub-int v4, p1, v1

    const/4 v5, 0x0

    if-ltz v3, :cond_5a

    if-ltz v4, :cond_5a

    const/high16 v3, -0x80000000

    if-eq v0, v3, :cond_5a

    const v4, 0x7fffffff

    if-eq v0, v4, :cond_5a

    if-eq v1, v3, :cond_5a

    if-eq v1, v4, :cond_5a

    if-eq v2, v3, :cond_5a

    if-eq v2, v4, :cond_5a

    if-eq p1, v3, :cond_5a

    if-ne p1, v4, :cond_5e

    :cond_5a
    const/4 p1, 0x0

    const/4 v0, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 19
    :cond_5e
    invoke-virtual {p0, v0, v1, v2, p1}, Lb/f/b/k/e;->a(IIII)V

    return-void
.end method

.method public c(Z)V
    .registers 2

    return-void
.end method

.method public c()Z
    .registers 2

    .line 8
    instance-of v0, p0, Lb/f/b/k/l;

    if-nez v0, :cond_b

    instance-of v0, p0, Lb/f/b/k/h;

    if-eqz v0, :cond_9

    goto :goto_b

    :cond_9
    const/4 v0, 0x0

    goto :goto_c

    :cond_b
    :goto_b
    const/4 v0, 0x1

    :goto_c
    return v0
.end method

.method public d(I)Lb/f/b/k/e;
    .registers 4

    if-nez p1, :cond_f

    .line 3
    iget-object p1, p0, Lb/f/b/k/e;->C:Lb/f/b/k/d;

    iget-object v0, p1, Lb/f/b/k/d;->d:Lb/f/b/k/d;

    if-eqz v0, :cond_1f

    iget-object v1, v0, Lb/f/b/k/d;->d:Lb/f/b/k/d;

    if-ne v1, p1, :cond_1f

    .line 4
    iget-object p1, v0, Lb/f/b/k/d;->b:Lb/f/b/k/e;

    return-object p1

    :cond_f
    const/4 v0, 0x1

    if-ne p1, v0, :cond_1f

    .line 5
    iget-object p1, p0, Lb/f/b/k/e;->D:Lb/f/b/k/d;

    iget-object v0, p1, Lb/f/b/k/d;->d:Lb/f/b/k/d;

    if-eqz v0, :cond_1f

    iget-object v1, v0, Lb/f/b/k/d;->d:Lb/f/b/k/d;

    if-ne v1, p1, :cond_1f

    .line 6
    iget-object p1, v0, Lb/f/b/k/d;->b:Lb/f/b/k/e;

    return-object p1

    :cond_1f
    const/4 p1, 0x0

    return-object p1
.end method

.method public d(F)V
    .registers 4

    .line 1
    iget-object v0, p0, Lb/f/b/k/e;->x0:[F

    const/4 v1, 0x1

    aput p1, v0, v1

    return-void
.end method

.method public d()Z
    .registers 3

    .line 2
    iget v0, p0, Lb/f/b/k/e;->e0:I

    const/16 v1, 0x8

    if-eq v0, v1, :cond_8

    const/4 v0, 0x1

    goto :goto_9

    :cond_8
    const/4 v0, 0x0

    :goto_9
    return v0
.end method

.method public e()I
    .registers 2

    .line 1
    iget v0, p0, Lb/f/b/k/e;->X:I

    return v0
.end method

.method public e(I)Lb/f/b/k/e;
    .registers 4

    if-nez p1, :cond_f

    .line 2
    iget-object p1, p0, Lb/f/b/k/e;->A:Lb/f/b/k/d;

    iget-object v0, p1, Lb/f/b/k/d;->d:Lb/f/b/k/d;

    if-eqz v0, :cond_1f

    iget-object v1, v0, Lb/f/b/k/d;->d:Lb/f/b/k/d;

    if-ne v1, p1, :cond_1f

    .line 3
    iget-object p1, v0, Lb/f/b/k/d;->b:Lb/f/b/k/e;

    return-object p1

    :cond_f
    const/4 v0, 0x1

    if-ne p1, v0, :cond_1f

    .line 4
    iget-object p1, p0, Lb/f/b/k/e;->B:Lb/f/b/k/d;

    iget-object v0, p1, Lb/f/b/k/d;->d:Lb/f/b/k/d;

    if-eqz v0, :cond_1f

    iget-object v1, v0, Lb/f/b/k/d;->d:Lb/f/b/k/d;

    if-ne v1, p1, :cond_1f

    .line 5
    iget-object p1, v0, Lb/f/b/k/d;->b:Lb/f/b/k/e;

    return-object p1

    :cond_1f
    const/4 p1, 0x0

    return-object p1
.end method

.method public f()I
    .registers 3

    .line 3
    invoke-virtual {p0}, Lb/f/b/k/e;->C()I

    move-result v0

    iget v1, p0, Lb/f/b/k/e;->O:I

    add-int/2addr v0, v1

    return v0
.end method

.method public f(I)Lb/f/b/k/n/m;
    .registers 3

    if-nez p1, :cond_5

    .line 1
    iget-object p1, p0, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    return-object p1

    :cond_5
    const/4 v0, 0x1

    if-ne p1, v0, :cond_b

    .line 2
    iget-object p1, p0, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    return-object p1

    :cond_b
    const/4 p1, 0x0

    return-object p1
.end method

.method public g()Ljava/lang/Object;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/f/b/k/e;->c0:Ljava/lang/Object;

    return-object v0
.end method

.method public final g(I)Z
    .registers 6

    mul-int/lit8 p1, p1, 0x2

    .line 2
    iget-object v0, p0, Lb/f/b/k/e;->I:[Lb/f/b/k/d;

    aget-object v1, v0, p1

    iget-object v1, v1, Lb/f/b/k/d;->d:Lb/f/b/k/d;

    const/4 v2, 0x1

    if-eqz v1, :cond_27

    aget-object v1, v0, p1

    iget-object v1, v1, Lb/f/b/k/d;->d:Lb/f/b/k/d;

    iget-object v1, v1, Lb/f/b/k/d;->d:Lb/f/b/k/d;

    aget-object v3, v0, p1

    if-eq v1, v3, :cond_27

    add-int/2addr p1, v2

    aget-object v1, v0, p1

    iget-object v1, v1, Lb/f/b/k/d;->d:Lb/f/b/k/d;

    if-eqz v1, :cond_27

    aget-object v1, v0, p1

    iget-object v1, v1, Lb/f/b/k/d;->d:Lb/f/b/k/d;

    iget-object v1, v1, Lb/f/b/k/d;->d:Lb/f/b/k/d;

    aget-object p1, v0, p1

    if-ne v1, p1, :cond_27

    goto :goto_28

    :cond_27
    const/4 v2, 0x0

    :goto_28
    return v2
.end method

.method public h()Ljava/lang/String;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/f/b/k/e;->f0:Ljava/lang/String;

    return-object v0
.end method

.method public h(I)V
    .registers 2

    .line 2
    iput p1, p0, Lb/f/b/k/e;->X:I

    if-lez p1, :cond_6

    const/4 p1, 0x1

    goto :goto_7

    :cond_6
    const/4 p1, 0x0

    .line 3
    :goto_7
    iput-boolean p1, p0, Lb/f/b/k/e;->y:Z

    return-void
.end method

.method public i()F
    .registers 2

    .line 4
    iget v0, p0, Lb/f/b/k/e;->P:F

    return v0
.end method

.method public i(I)V
    .registers 3

    .line 1
    iput p1, p0, Lb/f/b/k/e;->O:I

    .line 2
    iget v0, p0, Lb/f/b/k/e;->Z:I

    if-ge p1, v0, :cond_8

    .line 3
    iput v0, p0, Lb/f/b/k/e;->O:I

    :cond_8
    return-void
.end method

.method public j()I
    .registers 2

    .line 1
    iget v0, p0, Lb/f/b/k/e;->Q:I

    return v0
.end method

.method public j(I)V
    .registers 2

    .line 2
    iput p1, p0, Lb/f/b/k/e;->t0:I

    return-void
.end method

.method public k()I
    .registers 3

    .line 2
    iget v0, p0, Lb/f/b/k/e;->e0:I

    const/16 v1, 0x8

    if-ne v0, v1, :cond_8

    const/4 v0, 0x0

    return v0

    .line 3
    :cond_8
    iget v0, p0, Lb/f/b/k/e;->O:I

    return v0
.end method

.method public k(I)V
    .registers 4

    .line 1
    iget-object v0, p0, Lb/f/b/k/e;->w:[I

    const/4 v1, 0x1

    aput p1, v0, v1

    return-void
.end method

.method public l()F
    .registers 2

    .line 2
    iget v0, p0, Lb/f/b/k/e;->a0:F

    return v0
.end method

.method public l(I)V
    .registers 4

    .line 1
    iget-object v0, p0, Lb/f/b/k/e;->w:[I

    const/4 v1, 0x0

    aput p1, v0, v1

    return-void
.end method

.method public m()I
    .registers 2

    .line 3
    iget v0, p0, Lb/f/b/k/e;->t0:I

    return v0
.end method

.method public m(I)V
    .registers 2

    if-gez p1, :cond_6

    const/4 p1, 0x0

    .line 1
    iput p1, p0, Lb/f/b/k/e;->Z:I

    goto :goto_8

    .line 2
    :cond_6
    iput p1, p0, Lb/f/b/k/e;->Z:I

    :goto_8
    return-void
.end method

.method public n()Lb/f/b/k/e$b;
    .registers 3

    .line 3
    iget-object v0, p0, Lb/f/b/k/e;->L:[Lb/f/b/k/e$b;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    return-object v0
.end method

.method public n(I)V
    .registers 2

    if-gez p1, :cond_6

    const/4 p1, 0x0

    .line 1
    iput p1, p0, Lb/f/b/k/e;->Y:I

    goto :goto_8

    .line 2
    :cond_6
    iput p1, p0, Lb/f/b/k/e;->Y:I

    :goto_8
    return-void
.end method

.method public o()I
    .registers 3

    .line 1
    iget-object v0, p0, Lb/f/b/k/e;->A:Lb/f/b/k/d;

    const/4 v1, 0x0

    if-eqz v0, :cond_8

    .line 2
    iget v0, v0, Lb/f/b/k/d;->e:I

    add-int/2addr v1, v0

    .line 3
    :cond_8
    iget-object v0, p0, Lb/f/b/k/e;->C:Lb/f/b/k/d;

    if-eqz v0, :cond_f

    .line 4
    iget v0, v0, Lb/f/b/k/d;->e:I

    add-int/2addr v1, v0

    :cond_f
    return v1
.end method

.method public o(I)V
    .registers 2

    .line 5
    iput p1, p0, Lb/f/b/k/e;->u0:I

    return-void
.end method

.method public p()I
    .registers 3

    .line 1
    iget-object v0, p0, Lb/f/b/k/e;->w:[I

    const/4 v1, 0x1

    aget v0, v0, v1

    return v0
.end method

.method public p(I)V
    .registers 2

    .line 2
    iput p1, p0, Lb/f/b/k/e;->e0:I

    return-void
.end method

.method public q()I
    .registers 3

    .line 1
    iget-object v0, p0, Lb/f/b/k/e;->w:[I

    const/4 v1, 0x0

    aget v0, v0, v1

    return v0
.end method

.method public q(I)V
    .registers 3

    .line 2
    iput p1, p0, Lb/f/b/k/e;->N:I

    .line 3
    iget v0, p0, Lb/f/b/k/e;->Y:I

    if-ge p1, v0, :cond_8

    .line 4
    iput v0, p0, Lb/f/b/k/e;->N:I

    :cond_8
    return-void
.end method

.method public r()I
    .registers 2

    .line 1
    iget v0, p0, Lb/f/b/k/e;->Z:I

    return v0
.end method

.method public r(I)V
    .registers 2

    .line 2
    iput p1, p0, Lb/f/b/k/e;->R:I

    return-void
.end method

.method public s()I
    .registers 2

    .line 1
    iget v0, p0, Lb/f/b/k/e;->Y:I

    return v0
.end method

.method public s(I)V
    .registers 2

    .line 2
    iput p1, p0, Lb/f/b/k/e;->S:I

    return-void
.end method

.method public t()Lb/f/b/k/e;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/f/b/k/e;->M:Lb/f/b/k/e;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 6

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lb/f/b/k/e;->g0:Ljava/lang/String;

    const-string v2, " "

    const-string v3, ""

    if-eqz v1, :cond_24

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "type: "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Lb/f/b/k/e;->g0:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_25

    :cond_24
    move-object v1, v3

    :goto_25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lb/f/b/k/e;->f0:Ljava/lang/String;

    if-eqz v1, :cond_42

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "id: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lb/f/b/k/e;->f0:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :cond_42
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lb/f/b/k/e;->R:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lb/f/b/k/e;->S:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ") - ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lb/f/b/k/e;->N:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " x "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lb/f/b/k/e;->O:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public u()I
    .registers 3

    .line 1
    invoke-virtual {p0}, Lb/f/b/k/e;->B()I

    move-result v0

    iget v1, p0, Lb/f/b/k/e;->N:I

    add-int/2addr v0, v1

    return v0
.end method

.method public v()F
    .registers 2

    .line 1
    iget v0, p0, Lb/f/b/k/e;->b0:F

    return v0
.end method

.method public w()I
    .registers 2

    .line 1
    iget v0, p0, Lb/f/b/k/e;->u0:I

    return v0
.end method

.method public x()Lb/f/b/k/e$b;
    .registers 3

    .line 1
    iget-object v0, p0, Lb/f/b/k/e;->L:[Lb/f/b/k/e$b;

    const/4 v1, 0x1

    aget-object v0, v0, v1

    return-object v0
.end method

.method public y()I
    .registers 3

    .line 1
    iget-object v0, p0, Lb/f/b/k/e;->A:Lb/f/b/k/d;

    const/4 v1, 0x0

    if-eqz v0, :cond_a

    .line 2
    iget-object v0, p0, Lb/f/b/k/e;->B:Lb/f/b/k/d;

    iget v0, v0, Lb/f/b/k/d;->e:I

    add-int/2addr v1, v0

    .line 3
    :cond_a
    iget-object v0, p0, Lb/f/b/k/e;->C:Lb/f/b/k/d;

    if-eqz v0, :cond_13

    .line 4
    iget-object v0, p0, Lb/f/b/k/e;->D:Lb/f/b/k/d;

    iget v0, v0, Lb/f/b/k/d;->e:I

    add-int/2addr v1, v0

    :cond_13
    return v1
.end method

.method public z()I
    .registers 2

    .line 1
    iget v0, p0, Lb/f/b/k/e;->e0:I

    return v0
.end method
