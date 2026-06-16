.class public Lb/f/b/k/g;
.super Lb/f/b/k/l;
.source "Flow.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lb/f/b/k/g$a;
    }
.end annotation


# instance fields
.field public Q0:I

.field public R0:I

.field public S0:I

.field public T0:I

.field public U0:I

.field public V0:I

.field public W0:F

.field public X0:F

.field public Y0:F

.field public Z0:F

.field public a1:F

.field public b1:F

.field public c1:I

.field public d1:I

.field public e1:I

.field public f1:I

.field public g1:I

.field public h1:I

.field public i1:I

.field public j1:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lb/f/b/k/g$a;",
            ">;"
        }
    .end annotation
.end field

.field public k1:[Lb/f/b/k/e;

.field public l1:[Lb/f/b/k/e;

.field public m1:[I

.field public n1:[Lb/f/b/k/e;

.field public o1:I


# direct methods
.method public constructor <init>()V
    .registers 4

    .line 1
    invoke-direct {p0}, Lb/f/b/k/l;-><init>()V

    const/4 v0, -0x1

    .line 2
    iput v0, p0, Lb/f/b/k/g;->Q0:I

    .line 3
    iput v0, p0, Lb/f/b/k/g;->R0:I

    .line 4
    iput v0, p0, Lb/f/b/k/g;->S0:I

    .line 5
    iput v0, p0, Lb/f/b/k/g;->T0:I

    .line 6
    iput v0, p0, Lb/f/b/k/g;->U0:I

    .line 7
    iput v0, p0, Lb/f/b/k/g;->V0:I

    const/high16 v1, 0x3f000000    # 0.5f

    .line 8
    iput v1, p0, Lb/f/b/k/g;->W0:F

    .line 9
    iput v1, p0, Lb/f/b/k/g;->X0:F

    .line 10
    iput v1, p0, Lb/f/b/k/g;->Y0:F

    .line 11
    iput v1, p0, Lb/f/b/k/g;->Z0:F

    .line 12
    iput v1, p0, Lb/f/b/k/g;->a1:F

    .line 13
    iput v1, p0, Lb/f/b/k/g;->b1:F

    const/4 v1, 0x0

    .line 14
    iput v1, p0, Lb/f/b/k/g;->c1:I

    .line 15
    iput v1, p0, Lb/f/b/k/g;->d1:I

    const/4 v2, 0x2

    .line 16
    iput v2, p0, Lb/f/b/k/g;->e1:I

    .line 17
    iput v2, p0, Lb/f/b/k/g;->f1:I

    .line 18
    iput v1, p0, Lb/f/b/k/g;->g1:I

    .line 19
    iput v0, p0, Lb/f/b/k/g;->h1:I

    .line 20
    iput v1, p0, Lb/f/b/k/g;->i1:I

    .line 21
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lb/f/b/k/g;->j1:Ljava/util/ArrayList;

    const/4 v0, 0x0

    .line 22
    iput-object v0, p0, Lb/f/b/k/g;->k1:[Lb/f/b/k/e;

    .line 23
    iput-object v0, p0, Lb/f/b/k/g;->l1:[Lb/f/b/k/e;

    .line 24
    iput-object v0, p0, Lb/f/b/k/g;->m1:[I

    .line 25
    iput v1, p0, Lb/f/b/k/g;->o1:I

    return-void
.end method

.method public static synthetic a(Lb/f/b/k/g;)I
    .registers 1

    .line 1
    iget p0, p0, Lb/f/b/k/g;->c1:I

    return p0
.end method

.method public static synthetic a(Lb/f/b/k/g;Lb/f/b/k/e;I)I
    .registers 3

    .line 2
    invoke-virtual {p0, p1, p2}, Lb/f/b/k/g;->b(Lb/f/b/k/e;I)I

    move-result p0

    return p0
.end method

.method public static synthetic b(Lb/f/b/k/g;)I
    .registers 1

    .line 1
    iget p0, p0, Lb/f/b/k/g;->d1:I

    return p0
.end method

.method public static synthetic b(Lb/f/b/k/g;Lb/f/b/k/e;I)I
    .registers 3

    .line 2
    invoke-virtual {p0, p1, p2}, Lb/f/b/k/g;->a(Lb/f/b/k/e;I)I

    move-result p0

    return p0
.end method

.method public static synthetic c(Lb/f/b/k/g;)I
    .registers 1

    .line 1
    iget p0, p0, Lb/f/b/k/g;->S0:I

    return p0
.end method

.method public static synthetic d(Lb/f/b/k/g;)F
    .registers 1

    .line 1
    iget p0, p0, Lb/f/b/k/g;->Y0:F

    return p0
.end method

.method public static synthetic e(Lb/f/b/k/g;)I
    .registers 1

    .line 1
    iget p0, p0, Lb/f/b/k/g;->U0:I

    return p0
.end method

.method public static synthetic f(Lb/f/b/k/g;)F
    .registers 1

    .line 1
    iget p0, p0, Lb/f/b/k/g;->a1:F

    return p0
.end method

.method public static synthetic g(Lb/f/b/k/g;)F
    .registers 1

    .line 1
    iget p0, p0, Lb/f/b/k/g;->X0:F

    return p0
.end method

.method public static synthetic h(Lb/f/b/k/g;)I
    .registers 1

    .line 1
    iget p0, p0, Lb/f/b/k/g;->T0:I

    return p0
.end method

.method public static synthetic i(Lb/f/b/k/g;)F
    .registers 1

    .line 1
    iget p0, p0, Lb/f/b/k/g;->Z0:F

    return p0
.end method

.method public static synthetic j(Lb/f/b/k/g;)I
    .registers 1

    .line 1
    iget p0, p0, Lb/f/b/k/g;->V0:I

    return p0
.end method

.method public static synthetic k(Lb/f/b/k/g;)F
    .registers 1

    .line 1
    iget p0, p0, Lb/f/b/k/g;->b1:F

    return p0
.end method

.method public static synthetic l(Lb/f/b/k/g;)I
    .registers 1

    .line 1
    iget p0, p0, Lb/f/b/k/g;->e1:I

    return p0
.end method

.method public static synthetic m(Lb/f/b/k/g;)I
    .registers 1

    .line 1
    iget p0, p0, Lb/f/b/k/g;->o1:I

    return p0
.end method

.method public static synthetic n(Lb/f/b/k/g;)[Lb/f/b/k/e;
    .registers 1

    .line 1
    iget-object p0, p0, Lb/f/b/k/g;->n1:[Lb/f/b/k/e;

    return-object p0
.end method

.method public static synthetic o(Lb/f/b/k/g;)I
    .registers 1

    .line 1
    iget p0, p0, Lb/f/b/k/g;->R0:I

    return p0
.end method

.method public static synthetic p(Lb/f/b/k/g;)I
    .registers 1

    .line 1
    iget p0, p0, Lb/f/b/k/g;->f1:I

    return p0
.end method

.method public static synthetic q(Lb/f/b/k/g;)I
    .registers 1

    .line 1
    iget p0, p0, Lb/f/b/k/g;->Q0:I

    return p0
.end method

.method public static synthetic r(Lb/f/b/k/g;)F
    .registers 1

    .line 1
    iget p0, p0, Lb/f/b/k/g;->W0:F

    return p0
.end method


# virtual methods
.method public A(I)V
    .registers 2

    .line 1
    iput p1, p0, Lb/f/b/k/g;->S0:I

    return-void
.end method

.method public B(I)V
    .registers 2

    .line 1
    iput p1, p0, Lb/f/b/k/g;->T0:I

    return-void
.end method

.method public C(I)V
    .registers 2

    .line 1
    iput p1, p0, Lb/f/b/k/g;->e1:I

    return-void
.end method

.method public D(I)V
    .registers 2

    .line 1
    iput p1, p0, Lb/f/b/k/g;->c1:I

    return-void
.end method

.method public E(I)V
    .registers 2

    .line 1
    iput p1, p0, Lb/f/b/k/g;->Q0:I

    return-void
.end method

.method public F(I)V
    .registers 2

    .line 1
    iput p1, p0, Lb/f/b/k/g;->U0:I

    return-void
.end method

.method public G(I)V
    .registers 2

    .line 1
    iput p1, p0, Lb/f/b/k/g;->V0:I

    return-void
.end method

.method public H(I)V
    .registers 2

    .line 1
    iput p1, p0, Lb/f/b/k/g;->h1:I

    return-void
.end method

.method public I(I)V
    .registers 2

    .line 1
    iput p1, p0, Lb/f/b/k/g;->i1:I

    return-void
.end method

.method public J(I)V
    .registers 2

    .line 1
    iput p1, p0, Lb/f/b/k/g;->f1:I

    return-void
.end method

.method public K(I)V
    .registers 2

    .line 1
    iput p1, p0, Lb/f/b/k/g;->d1:I

    return-void
.end method

.method public L(I)V
    .registers 2

    .line 1
    iput p1, p0, Lb/f/b/k/g;->R0:I

    return-void
.end method

.method public M(I)V
    .registers 2

    .line 1
    iput p1, p0, Lb/f/b/k/g;->g1:I

    return-void
.end method

.method public final a(Lb/f/b/k/e;I)I
    .registers 10

    const/4 v0, 0x0

    if-nez p1, :cond_4

    return v0

    .line 24
    :cond_4
    invoke-virtual {p1}, Lb/f/b/k/e;->x()Lb/f/b/k/e$b;

    move-result-object v1

    sget-object v2, Lb/f/b/k/e$b;->MATCH_CONSTRAINT:Lb/f/b/k/e$b;

    if-ne v1, v2, :cond_4a

    .line 25
    iget v1, p1, Lb/f/b/k/e;->k:I

    if-nez v1, :cond_11

    return v0

    :cond_11
    const/4 v0, 0x2

    if-ne v1, v0, :cond_31

    .line 26
    iget v0, p1, Lb/f/b/k/e;->r:F

    int-to-float p2, p2

    mul-float v0, v0, p2

    float-to-int p2, v0

    .line 27
    invoke-virtual {p1}, Lb/f/b/k/e;->k()I

    move-result v0

    if-eq p2, v0, :cond_30

    .line 28
    invoke-virtual {p1}, Lb/f/b/k/e;->n()Lb/f/b/k/e$b;

    move-result-object v3

    invoke-virtual {p1}, Lb/f/b/k/e;->A()I

    move-result v4

    sget-object v5, Lb/f/b/k/e$b;->FIXED:Lb/f/b/k/e$b;

    move-object v1, p0

    move-object v2, p1

    move v6, p2

    invoke-virtual/range {v1 .. v6}, Lb/f/b/k/l;->a(Lb/f/b/k/e;Lb/f/b/k/e$b;ILb/f/b/k/e$b;I)V

    :cond_30
    return p2

    :cond_31
    const/4 p2, 0x1

    if-ne v1, p2, :cond_39

    .line 29
    invoke-virtual {p1}, Lb/f/b/k/e;->k()I

    move-result p1

    return p1

    :cond_39
    const/4 p2, 0x3

    if-ne v1, p2, :cond_4a

    .line 30
    invoke-virtual {p1}, Lb/f/b/k/e;->A()I

    move-result p2

    int-to-float p2, p2

    iget p1, p1, Lb/f/b/k/e;->P:F

    mul-float p2, p2, p1

    const/high16 p1, 0x3f000000    # 0.5f

    add-float/2addr p2, p1

    float-to-int p1, p2

    return p1

    .line 31
    :cond_4a
    invoke-virtual {p1}, Lb/f/b/k/e;->k()I

    move-result p1

    return p1
.end method

.method public a(Lb/f/b/d;)V
    .registers 8

    .line 70
    invoke-super {p0, p1}, Lb/f/b/k/e;->a(Lb/f/b/d;)V

    .line 71
    invoke-virtual {p0}, Lb/f/b/k/e;->t()Lb/f/b/k/e;

    move-result-object p1

    const/4 v0, 0x0

    if-eqz p1, :cond_15

    invoke-virtual {p0}, Lb/f/b/k/e;->t()Lb/f/b/k/e;

    move-result-object p1

    check-cast p1, Lb/f/b/k/f;

    invoke-virtual {p1}, Lb/f/b/k/f;->S()Z

    move-result p1

    goto :goto_16

    :cond_15
    const/4 p1, 0x0

    .line 72
    :goto_16
    iget v1, p0, Lb/f/b/k/g;->g1:I

    const/4 v2, 0x1

    if-eqz v1, :cond_43

    if-eq v1, v2, :cond_25

    const/4 v2, 0x2

    if-eq v1, v2, :cond_21

    goto :goto_56

    .line 73
    :cond_21
    invoke-virtual {p0, p1}, Lb/f/b/k/g;->f(Z)V

    goto :goto_56

    .line 74
    :cond_25
    iget-object v1, p0, Lb/f/b/k/g;->j1:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v3, 0x0

    :goto_2c
    if-ge v3, v1, :cond_56

    .line 75
    iget-object v4, p0, Lb/f/b/k/g;->j1:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lb/f/b/k/g$a;

    add-int/lit8 v5, v1, -0x1

    if-ne v3, v5, :cond_3c

    const/4 v5, 0x1

    goto :goto_3d

    :cond_3c
    const/4 v5, 0x0

    .line 76
    :goto_3d
    invoke-virtual {v4, p1, v3, v5}, Lb/f/b/k/g$a;->a(ZIZ)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_2c

    .line 77
    :cond_43
    iget-object v1, p0, Lb/f/b/k/g;->j1:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_56

    .line 78
    iget-object v1, p0, Lb/f/b/k/g;->j1:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/f/b/k/g$a;

    .line 79
    invoke-virtual {v1, p1, v0, v2}, Lb/f/b/k/g$a;->a(ZIZ)V

    .line 80
    :cond_56
    :goto_56
    invoke-virtual {p0, v0}, Lb/f/b/k/l;->e(Z)V

    return-void
.end method

.method public a(Lb/f/b/k/e;Ljava/util/HashMap;)V
    .registers 3
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

    .line 3
    invoke-super {p0, p1, p2}, Lb/f/b/k/j;->a(Lb/f/b/k/e;Ljava/util/HashMap;)V

    .line 4
    check-cast p1, Lb/f/b/k/g;

    .line 5
    iget p2, p1, Lb/f/b/k/g;->Q0:I

    iput p2, p0, Lb/f/b/k/g;->Q0:I

    .line 6
    iget p2, p1, Lb/f/b/k/g;->R0:I

    iput p2, p0, Lb/f/b/k/g;->R0:I

    .line 7
    iget p2, p1, Lb/f/b/k/g;->S0:I

    iput p2, p0, Lb/f/b/k/g;->S0:I

    .line 8
    iget p2, p1, Lb/f/b/k/g;->T0:I

    iput p2, p0, Lb/f/b/k/g;->T0:I

    .line 9
    iget p2, p1, Lb/f/b/k/g;->U0:I

    iput p2, p0, Lb/f/b/k/g;->U0:I

    .line 10
    iget p2, p1, Lb/f/b/k/g;->V0:I

    iput p2, p0, Lb/f/b/k/g;->V0:I

    .line 11
    iget p2, p1, Lb/f/b/k/g;->W0:F

    iput p2, p0, Lb/f/b/k/g;->W0:F

    .line 12
    iget p2, p1, Lb/f/b/k/g;->X0:F

    iput p2, p0, Lb/f/b/k/g;->X0:F

    .line 13
    iget p2, p1, Lb/f/b/k/g;->Y0:F

    iput p2, p0, Lb/f/b/k/g;->Y0:F

    .line 14
    iget p2, p1, Lb/f/b/k/g;->Z0:F

    iput p2, p0, Lb/f/b/k/g;->Z0:F

    .line 15
    iget p2, p1, Lb/f/b/k/g;->a1:F

    iput p2, p0, Lb/f/b/k/g;->a1:F

    .line 16
    iget p2, p1, Lb/f/b/k/g;->b1:F

    iput p2, p0, Lb/f/b/k/g;->b1:F

    .line 17
    iget p2, p1, Lb/f/b/k/g;->c1:I

    iput p2, p0, Lb/f/b/k/g;->c1:I

    .line 18
    iget p2, p1, Lb/f/b/k/g;->d1:I

    iput p2, p0, Lb/f/b/k/g;->d1:I

    .line 19
    iget p2, p1, Lb/f/b/k/g;->e1:I

    iput p2, p0, Lb/f/b/k/g;->e1:I

    .line 20
    iget p2, p1, Lb/f/b/k/g;->f1:I

    iput p2, p0, Lb/f/b/k/g;->f1:I

    .line 21
    iget p2, p1, Lb/f/b/k/g;->g1:I

    iput p2, p0, Lb/f/b/k/g;->g1:I

    .line 22
    iget p2, p1, Lb/f/b/k/g;->h1:I

    iput p2, p0, Lb/f/b/k/g;->h1:I

    .line 23
    iget p1, p1, Lb/f/b/k/g;->i1:I

    iput p1, p0, Lb/f/b/k/g;->i1:I

    return-void
.end method

.method public final a([Lb/f/b/k/e;III[I)V
    .registers 22

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    move/from16 v3, p3

    move/from16 v4, p4

    const/4 v5, 0x0

    if-nez v3, :cond_30

    .line 32
    iget v6, v0, Lb/f/b/k/g;->h1:I

    if-gtz v6, :cond_2d

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    :goto_14
    if-ge v7, v2, :cond_2d

    if-lez v7, :cond_1b

    .line 33
    iget v9, v0, Lb/f/b/k/g;->c1:I

    add-int/2addr v8, v9

    .line 34
    :cond_1b
    aget-object v9, v1, v7

    if-nez v9, :cond_20

    goto :goto_2a

    .line 35
    :cond_20
    invoke-virtual {v0, v9, v4}, Lb/f/b/k/g;->b(Lb/f/b/k/e;I)I

    move-result v9

    add-int/2addr v8, v9

    if-le v8, v4, :cond_28

    goto :goto_2d

    :cond_28
    add-int/lit8 v6, v6, 0x1

    :goto_2a
    add-int/lit8 v7, v7, 0x1

    goto :goto_14

    :cond_2d
    :goto_2d
    move v7, v6

    const/4 v6, 0x0

    goto :goto_51

    .line 36
    :cond_30
    iget v6, v0, Lb/f/b/k/g;->h1:I

    if-gtz v6, :cond_50

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    :goto_37
    if-ge v7, v2, :cond_50

    if-lez v7, :cond_3e

    .line 37
    iget v9, v0, Lb/f/b/k/g;->d1:I

    add-int/2addr v8, v9

    .line 38
    :cond_3e
    aget-object v9, v1, v7

    if-nez v9, :cond_43

    goto :goto_4d

    .line 39
    :cond_43
    invoke-virtual {v0, v9, v4}, Lb/f/b/k/g;->a(Lb/f/b/k/e;I)I

    move-result v9

    add-int/2addr v8, v9

    if-le v8, v4, :cond_4b

    goto :goto_50

    :cond_4b
    add-int/lit8 v6, v6, 0x1

    :goto_4d
    add-int/lit8 v7, v7, 0x1

    goto :goto_37

    :cond_50
    :goto_50
    const/4 v7, 0x0

    .line 40
    :goto_51
    iget-object v8, v0, Lb/f/b/k/g;->m1:[I

    if-nez v8, :cond_5a

    const/4 v8, 0x2

    new-array v8, v8, [I

    .line 41
    iput-object v8, v0, Lb/f/b/k/g;->m1:[I

    :cond_5a
    const/4 v8, 0x1

    if-nez v6, :cond_5f

    if-eq v3, v8, :cond_63

    :cond_5f
    if-nez v7, :cond_65

    if-nez v3, :cond_65

    :cond_63
    const/4 v9, 0x1

    goto :goto_66

    :cond_65
    const/4 v9, 0x0

    :goto_66
    if-nez v9, :cond_12b

    if-nez v3, :cond_74

    int-to-float v6, v2

    int-to-float v10, v7

    div-float/2addr v6, v10

    float-to-double v10, v6

    .line 42
    invoke-static {v10, v11}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v10

    double-to-int v6, v10

    goto :goto_7d

    :cond_74
    int-to-float v7, v2

    int-to-float v10, v6

    div-float/2addr v7, v10

    float-to-double v10, v7

    .line 43
    invoke-static {v10, v11}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v10

    double-to-int v7, v10

    .line 44
    :goto_7d
    iget-object v10, v0, Lb/f/b/k/g;->l1:[Lb/f/b/k/e;

    const/4 v11, 0x0

    if-eqz v10, :cond_8a

    array-length v12, v10

    if-ge v12, v7, :cond_86

    goto :goto_8a

    .line 45
    :cond_86
    invoke-static {v10, v11}, Ljava/util/Arrays;->fill([Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_8e

    .line 46
    :cond_8a
    :goto_8a
    new-array v10, v7, [Lb/f/b/k/e;

    iput-object v10, v0, Lb/f/b/k/g;->l1:[Lb/f/b/k/e;

    .line 47
    :goto_8e
    iget-object v10, v0, Lb/f/b/k/g;->k1:[Lb/f/b/k/e;

    if-eqz v10, :cond_9a

    array-length v12, v10

    if-ge v12, v6, :cond_96

    goto :goto_9a

    .line 48
    :cond_96
    invoke-static {v10, v11}, Ljava/util/Arrays;->fill([Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_9e

    .line 49
    :cond_9a
    :goto_9a
    new-array v10, v6, [Lb/f/b/k/e;

    iput-object v10, v0, Lb/f/b/k/g;->k1:[Lb/f/b/k/e;

    :goto_9e
    const/4 v10, 0x0

    :goto_9f
    if-ge v10, v7, :cond_e7

    const/4 v11, 0x0

    :goto_a2
    if-ge v11, v6, :cond_e4

    mul-int v12, v11, v7

    add-int/2addr v12, v10

    if-ne v3, v8, :cond_ac

    mul-int v12, v10, v6

    add-int/2addr v12, v11

    .line 50
    :cond_ac
    array-length v13, v1

    if-lt v12, v13, :cond_b0

    goto :goto_e1

    .line 51
    :cond_b0
    aget-object v12, v1, v12

    if-nez v12, :cond_b5

    goto :goto_e1

    .line 52
    :cond_b5
    invoke-virtual {v0, v12, v4}, Lb/f/b/k/g;->b(Lb/f/b/k/e;I)I

    move-result v13

    .line 53
    iget-object v14, v0, Lb/f/b/k/g;->l1:[Lb/f/b/k/e;

    aget-object v15, v14, v10

    if-eqz v15, :cond_c7

    aget-object v14, v14, v10

    .line 54
    invoke-virtual {v14}, Lb/f/b/k/e;->A()I

    move-result v14

    if-ge v14, v13, :cond_cb

    .line 55
    :cond_c7
    iget-object v13, v0, Lb/f/b/k/g;->l1:[Lb/f/b/k/e;

    aput-object v12, v13, v10

    .line 56
    :cond_cb
    invoke-virtual {v0, v12, v4}, Lb/f/b/k/g;->a(Lb/f/b/k/e;I)I

    move-result v13

    .line 57
    iget-object v14, v0, Lb/f/b/k/g;->k1:[Lb/f/b/k/e;

    aget-object v15, v14, v11

    if-eqz v15, :cond_dd

    aget-object v14, v14, v11

    .line 58
    invoke-virtual {v14}, Lb/f/b/k/e;->k()I

    move-result v14

    if-ge v14, v13, :cond_e1

    .line 59
    :cond_dd
    iget-object v13, v0, Lb/f/b/k/g;->k1:[Lb/f/b/k/e;

    aput-object v12, v13, v11

    :cond_e1
    :goto_e1
    add-int/lit8 v11, v11, 0x1

    goto :goto_a2

    :cond_e4
    add-int/lit8 v10, v10, 0x1

    goto :goto_9f

    :cond_e7
    const/4 v10, 0x0

    const/4 v11, 0x0

    :goto_e9
    if-ge v10, v7, :cond_fe

    .line 60
    iget-object v12, v0, Lb/f/b/k/g;->l1:[Lb/f/b/k/e;

    aget-object v12, v12, v10

    if-eqz v12, :cond_fb

    if-lez v10, :cond_f6

    .line 61
    iget v13, v0, Lb/f/b/k/g;->c1:I

    add-int/2addr v11, v13

    .line 62
    :cond_f6
    invoke-virtual {v0, v12, v4}, Lb/f/b/k/g;->b(Lb/f/b/k/e;I)I

    move-result v12

    add-int/2addr v11, v12

    :cond_fb
    add-int/lit8 v10, v10, 0x1

    goto :goto_e9

    :cond_fe
    const/4 v10, 0x0

    const/4 v12, 0x0

    :goto_100
    if-ge v10, v6, :cond_115

    .line 63
    iget-object v13, v0, Lb/f/b/k/g;->k1:[Lb/f/b/k/e;

    aget-object v13, v13, v10

    if-eqz v13, :cond_112

    if-lez v10, :cond_10d

    .line 64
    iget v14, v0, Lb/f/b/k/g;->d1:I

    add-int/2addr v12, v14

    .line 65
    :cond_10d
    invoke-virtual {v0, v13, v4}, Lb/f/b/k/g;->a(Lb/f/b/k/e;I)I

    move-result v13

    add-int/2addr v12, v13

    :cond_112
    add-int/lit8 v10, v10, 0x1

    goto :goto_100

    .line 66
    :cond_115
    aput v11, p5, v5

    .line 67
    aput v12, p5, v8

    if-nez v3, :cond_123

    if-le v11, v4, :cond_63

    if-le v7, v8, :cond_63

    add-int/lit8 v7, v7, -0x1

    goto/16 :goto_66

    :cond_123
    if-le v12, v4, :cond_63

    if-le v6, v8, :cond_63

    add-int/lit8 v6, v6, -0x1

    goto/16 :goto_66

    .line 68
    :cond_12b
    iget-object v1, v0, Lb/f/b/k/g;->m1:[I

    aput v7, v1, v5

    .line 69
    aput v6, v1, v8

    return-void
.end method

.method public final b(Lb/f/b/k/e;I)I
    .registers 10

    const/4 v0, 0x0

    if-nez p1, :cond_4

    return v0

    .line 3
    :cond_4
    invoke-virtual {p1}, Lb/f/b/k/e;->n()Lb/f/b/k/e$b;

    move-result-object v1

    sget-object v2, Lb/f/b/k/e$b;->MATCH_CONSTRAINT:Lb/f/b/k/e$b;

    if-ne v1, v2, :cond_4a

    .line 4
    iget v1, p1, Lb/f/b/k/e;->j:I

    if-nez v1, :cond_11

    return v0

    :cond_11
    const/4 v0, 0x2

    if-ne v1, v0, :cond_31

    .line 5
    iget v0, p1, Lb/f/b/k/e;->o:F

    int-to-float p2, p2

    mul-float v0, v0, p2

    float-to-int p2, v0

    .line 6
    invoke-virtual {p1}, Lb/f/b/k/e;->A()I

    move-result v0

    if-eq p2, v0, :cond_30

    .line 7
    sget-object v3, Lb/f/b/k/e$b;->FIXED:Lb/f/b/k/e$b;

    invoke-virtual {p1}, Lb/f/b/k/e;->x()Lb/f/b/k/e$b;

    move-result-object v5

    invoke-virtual {p1}, Lb/f/b/k/e;->k()I

    move-result v6

    move-object v1, p0

    move-object v2, p1

    move v4, p2

    invoke-virtual/range {v1 .. v6}, Lb/f/b/k/l;->a(Lb/f/b/k/e;Lb/f/b/k/e$b;ILb/f/b/k/e$b;I)V

    :cond_30
    return p2

    :cond_31
    const/4 p2, 0x1

    if-ne v1, p2, :cond_39

    .line 8
    invoke-virtual {p1}, Lb/f/b/k/e;->A()I

    move-result p1

    return p1

    :cond_39
    const/4 p2, 0x3

    if-ne v1, p2, :cond_4a

    .line 9
    invoke-virtual {p1}, Lb/f/b/k/e;->k()I

    move-result p2

    int-to-float p2, p2

    iget p1, p1, Lb/f/b/k/e;->P:F

    mul-float p2, p2, p1

    const/high16 p1, 0x3f000000    # 0.5f

    add-float/2addr p2, p1

    float-to-int p1, p2

    return p1

    .line 10
    :cond_4a
    invoke-virtual {p1}, Lb/f/b/k/e;->A()I

    move-result p1

    return p1
.end method

.method public b(IIII)V
    .registers 23

    move-object/from16 v6, p0

    move/from16 v7, p1

    move/from16 v8, p2

    move/from16 v9, p3

    move/from16 v10, p4

    .line 11
    iget v0, v6, Lb/f/b/k/j;->E0:I

    const/4 v11, 0x0

    if-lez v0, :cond_1c

    invoke-virtual/range {p0 .. p0}, Lb/f/b/k/l;->Q()Z

    move-result v0

    if-nez v0, :cond_1c

    .line 12
    invoke-virtual {v6, v11, v11}, Lb/f/b/k/l;->d(II)V

    .line 13
    invoke-virtual {v6, v11}, Lb/f/b/k/l;->e(Z)V

    return-void

    .line 14
    :cond_1c
    invoke-virtual/range {p0 .. p0}, Lb/f/b/k/l;->N()I

    move-result v12

    .line 15
    invoke-virtual/range {p0 .. p0}, Lb/f/b/k/l;->O()I

    move-result v13

    .line 16
    invoke-virtual/range {p0 .. p0}, Lb/f/b/k/l;->P()I

    move-result v14

    .line 17
    invoke-virtual/range {p0 .. p0}, Lb/f/b/k/l;->M()I

    move-result v15

    const/4 v0, 0x2

    new-array v5, v0, [I

    sub-int v1, v8, v12

    sub-int/2addr v1, v13

    .line 18
    iget v2, v6, Lb/f/b/k/g;->i1:I

    const/4 v4, 0x1

    if-ne v2, v4, :cond_3a

    sub-int v1, v10, v14

    sub-int/2addr v1, v15

    :cond_3a
    move/from16 v16, v1

    .line 19
    iget v1, v6, Lb/f/b/k/g;->i1:I

    const/4 v2, -0x1

    if-nez v1, :cond_4e

    .line 20
    iget v1, v6, Lb/f/b/k/g;->Q0:I

    if-ne v1, v2, :cond_47

    .line 21
    iput v11, v6, Lb/f/b/k/g;->Q0:I

    .line 22
    :cond_47
    iget v1, v6, Lb/f/b/k/g;->R0:I

    if-ne v1, v2, :cond_5a

    .line 23
    iput v11, v6, Lb/f/b/k/g;->R0:I

    goto :goto_5a

    .line 24
    :cond_4e
    iget v1, v6, Lb/f/b/k/g;->Q0:I

    if-ne v1, v2, :cond_54

    .line 25
    iput v11, v6, Lb/f/b/k/g;->Q0:I

    .line 26
    :cond_54
    iget v1, v6, Lb/f/b/k/g;->R0:I

    if-ne v1, v2, :cond_5a

    .line 27
    iput v11, v6, Lb/f/b/k/g;->R0:I

    .line 28
    :cond_5a
    :goto_5a
    iget-object v1, v6, Lb/f/b/k/j;->D0:[Lb/f/b/k/e;

    const/4 v2, 0x0

    const/4 v3, 0x0

    .line 29
    :goto_5e
    iget v11, v6, Lb/f/b/k/j;->E0:I

    const/16 v0, 0x8

    if-ge v2, v11, :cond_74

    .line 30
    iget-object v11, v6, Lb/f/b/k/j;->D0:[Lb/f/b/k/e;

    aget-object v11, v11, v2

    .line 31
    invoke-virtual {v11}, Lb/f/b/k/e;->z()I

    move-result v11

    if-ne v11, v0, :cond_70

    add-int/lit8 v3, v3, 0x1

    :cond_70
    add-int/lit8 v2, v2, 0x1

    const/4 v0, 0x2

    goto :goto_5e

    :cond_74
    if-lez v3, :cond_93

    sub-int/2addr v11, v3

    .line 32
    new-array v1, v11, [Lb/f/b/k/e;

    const/4 v2, 0x0

    const/4 v3, 0x0

    .line 33
    :goto_7b
    iget v11, v6, Lb/f/b/k/j;->E0:I

    if-ge v2, v11, :cond_91

    .line 34
    iget-object v11, v6, Lb/f/b/k/j;->D0:[Lb/f/b/k/e;

    aget-object v11, v11, v2

    .line 35
    invoke-virtual {v11}, Lb/f/b/k/e;->z()I

    move-result v4

    if-eq v4, v0, :cond_8d

    .line 36
    aput-object v11, v1, v3

    add-int/lit8 v3, v3, 0x1

    :cond_8d
    add-int/lit8 v2, v2, 0x1

    const/4 v4, 0x1

    goto :goto_7b

    :cond_91
    move v2, v3

    goto :goto_94

    :cond_93
    move v2, v11

    .line 37
    :goto_94
    iput-object v1, v6, Lb/f/b/k/g;->n1:[Lb/f/b/k/e;

    .line 38
    iput v2, v6, Lb/f/b/k/g;->o1:I

    .line 39
    iget v0, v6, Lb/f/b/k/g;->g1:I

    if-eqz v0, :cond_c1

    const/4 v4, 0x1

    if-eq v0, v4, :cond_b4

    const/4 v3, 0x2

    if-eq v0, v3, :cond_a7

    move-object/from16 v17, v5

    const/4 v0, 0x0

    const/4 v11, 0x1

    goto :goto_ce

    .line 40
    :cond_a7
    iget v3, v6, Lb/f/b/k/g;->i1:I

    move-object/from16 v0, p0

    const/4 v11, 0x1

    move/from16 v4, v16

    move-object/from16 v17, v5

    invoke-virtual/range {v0 .. v5}, Lb/f/b/k/g;->a([Lb/f/b/k/e;III[I)V

    goto :goto_cd

    :cond_b4
    move-object/from16 v17, v5

    const/4 v11, 0x1

    .line 41
    iget v3, v6, Lb/f/b/k/g;->i1:I

    move-object/from16 v0, p0

    move/from16 v4, v16

    invoke-virtual/range {v0 .. v5}, Lb/f/b/k/g;->b([Lb/f/b/k/e;III[I)V

    goto :goto_cd

    :cond_c1
    move-object/from16 v17, v5

    const/4 v11, 0x1

    .line 42
    iget v3, v6, Lb/f/b/k/g;->i1:I

    move-object/from16 v0, p0

    move/from16 v4, v16

    invoke-virtual/range {v0 .. v5}, Lb/f/b/k/g;->c([Lb/f/b/k/e;III[I)V

    :goto_cd
    const/4 v0, 0x0

    .line 43
    :goto_ce
    aget v1, v17, v0

    add-int/2addr v1, v12

    add-int/2addr v1, v13

    .line 44
    aget v2, v17, v11

    add-int/2addr v2, v14

    add-int/2addr v2, v15

    const/high16 v3, -0x80000000

    const/high16 v4, 0x40000000    # 2.0f

    if-ne v7, v4, :cond_de

    move v1, v8

    goto :goto_e9

    :cond_de
    if-ne v7, v3, :cond_e5

    .line 45
    invoke-static {v1, v8}, Ljava/lang/Math;->min(II)I

    move-result v1

    goto :goto_e9

    :cond_e5
    if-nez v7, :cond_e8

    goto :goto_e9

    :cond_e8
    const/4 v1, 0x0

    :goto_e9
    if-ne v9, v4, :cond_ed

    move v2, v10

    goto :goto_f8

    :cond_ed
    if-ne v9, v3, :cond_f4

    .line 46
    invoke-static {v2, v10}, Ljava/lang/Math;->min(II)I

    move-result v2

    goto :goto_f8

    :cond_f4
    if-nez v9, :cond_f7

    goto :goto_f8

    :cond_f7
    const/4 v2, 0x0

    .line 47
    :goto_f8
    invoke-virtual {v6, v1, v2}, Lb/f/b/k/l;->d(II)V

    .line 48
    invoke-virtual {v6, v1}, Lb/f/b/k/e;->q(I)V

    .line 49
    invoke-virtual {v6, v2}, Lb/f/b/k/e;->i(I)V

    .line 50
    iget v1, v6, Lb/f/b/k/j;->E0:I

    if-lez v1, :cond_106

    goto :goto_107

    :cond_106
    const/4 v11, 0x0

    :goto_107
    invoke-virtual {v6, v11}, Lb/f/b/k/l;->e(Z)V

    return-void
.end method

.method public final b([Lb/f/b/k/e;III[I)V
    .registers 34

    move-object/from16 v8, p0

    move/from16 v9, p2

    move/from16 v15, p4

    if-nez v9, :cond_9

    return-void

    .line 51
    :cond_9
    iget-object v0, v8, Lb/f/b/k/g;->j1:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 52
    new-instance v10, Lb/f/b/k/g$a;

    iget-object v3, v8, Lb/f/b/k/e;->A:Lb/f/b/k/d;

    iget-object v4, v8, Lb/f/b/k/e;->B:Lb/f/b/k/d;

    iget-object v5, v8, Lb/f/b/k/e;->C:Lb/f/b/k/d;

    iget-object v6, v8, Lb/f/b/k/e;->D:Lb/f/b/k/d;

    move-object v0, v10

    move-object/from16 v1, p0

    move/from16 v2, p3

    move/from16 v7, p4

    invoke-direct/range {v0 .. v7}, Lb/f/b/k/g$a;-><init>(Lb/f/b/k/g;ILb/f/b/k/d;Lb/f/b/k/d;Lb/f/b/k/d;Lb/f/b/k/d;I)V

    .line 53
    iget-object v0, v8, Lb/f/b/k/g;->j1:Ljava/util/ArrayList;

    invoke-virtual {v0, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/16 v20, 0x1

    const/16 v21, 0x0

    if-nez p3, :cond_8e

    const/4 v0, 0x0

    const/4 v1, 0x0

    const/4 v11, 0x0

    :goto_30
    if-ge v11, v9, :cond_ef

    .line 54
    aget-object v12, p1, v11

    .line 55
    invoke-virtual {v8, v12, v15}, Lb/f/b/k/g;->b(Lb/f/b/k/e;I)I

    move-result v13

    .line 56
    invoke-virtual {v12}, Lb/f/b/k/e;->n()Lb/f/b/k/e$b;

    move-result-object v2

    sget-object v3, Lb/f/b/k/e$b;->MATCH_CONSTRAINT:Lb/f/b/k/e$b;

    if-ne v2, v3, :cond_42

    add-int/lit8 v0, v0, 0x1

    :cond_42
    move v14, v0

    if-eq v1, v15, :cond_4b

    .line 57
    iget v0, v8, Lb/f/b/k/g;->c1:I

    add-int/2addr v0, v1

    add-int/2addr v0, v13

    if-le v0, v15, :cond_53

    :cond_4b
    invoke-static {v10}, Lb/f/b/k/g$a;->a(Lb/f/b/k/g$a;)Lb/f/b/k/e;

    move-result-object v0

    if-eqz v0, :cond_53

    const/4 v0, 0x1

    goto :goto_54

    :cond_53
    const/4 v0, 0x0

    :goto_54
    if-nez v0, :cond_61

    if-lez v11, :cond_61

    .line 58
    iget v2, v8, Lb/f/b/k/g;->h1:I

    if-lez v2, :cond_61

    rem-int v2, v11, v2

    if-nez v2, :cond_61

    const/4 v0, 0x1

    :cond_61
    if-eqz v0, :cond_81

    .line 59
    new-instance v10, Lb/f/b/k/g$a;

    iget-object v3, v8, Lb/f/b/k/e;->A:Lb/f/b/k/d;

    iget-object v4, v8, Lb/f/b/k/e;->B:Lb/f/b/k/d;

    iget-object v5, v8, Lb/f/b/k/e;->C:Lb/f/b/k/d;

    iget-object v6, v8, Lb/f/b/k/e;->D:Lb/f/b/k/d;

    move-object v0, v10

    move-object/from16 v1, p0

    move/from16 v2, p3

    move/from16 v7, p4

    invoke-direct/range {v0 .. v7}, Lb/f/b/k/g$a;-><init>(Lb/f/b/k/g;ILb/f/b/k/d;Lb/f/b/k/d;Lb/f/b/k/d;Lb/f/b/k/d;I)V

    .line 60
    invoke-virtual {v10, v11}, Lb/f/b/k/g$a;->b(I)V

    .line 61
    iget-object v0, v8, Lb/f/b/k/g;->j1:Ljava/util/ArrayList;

    invoke-virtual {v0, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_7f
    move v1, v13

    goto :goto_87

    :cond_81
    if-lez v11, :cond_7f

    .line 62
    iget v0, v8, Lb/f/b/k/g;->c1:I

    add-int/2addr v0, v13

    add-int/2addr v1, v0

    .line 63
    :goto_87
    invoke-virtual {v10, v12}, Lb/f/b/k/g$a;->a(Lb/f/b/k/e;)V

    add-int/lit8 v11, v11, 0x1

    move v0, v14

    goto :goto_30

    :cond_8e
    const/4 v0, 0x0

    const/4 v1, 0x0

    const/4 v11, 0x0

    :goto_91
    if-ge v11, v9, :cond_ef

    .line 64
    aget-object v12, p1, v11

    .line 65
    invoke-virtual {v8, v12, v15}, Lb/f/b/k/g;->a(Lb/f/b/k/e;I)I

    move-result v13

    .line 66
    invoke-virtual {v12}, Lb/f/b/k/e;->x()Lb/f/b/k/e$b;

    move-result-object v2

    sget-object v3, Lb/f/b/k/e$b;->MATCH_CONSTRAINT:Lb/f/b/k/e$b;

    if-ne v2, v3, :cond_a3

    add-int/lit8 v0, v0, 0x1

    :cond_a3
    move v14, v0

    if-eq v1, v15, :cond_ac

    .line 67
    iget v0, v8, Lb/f/b/k/g;->d1:I

    add-int/2addr v0, v1

    add-int/2addr v0, v13

    if-le v0, v15, :cond_b4

    :cond_ac
    invoke-static {v10}, Lb/f/b/k/g$a;->a(Lb/f/b/k/g$a;)Lb/f/b/k/e;

    move-result-object v0

    if-eqz v0, :cond_b4

    const/4 v0, 0x1

    goto :goto_b5

    :cond_b4
    const/4 v0, 0x0

    :goto_b5
    if-nez v0, :cond_c2

    if-lez v11, :cond_c2

    .line 68
    iget v2, v8, Lb/f/b/k/g;->h1:I

    if-lez v2, :cond_c2

    rem-int v2, v11, v2

    if-nez v2, :cond_c2

    const/4 v0, 0x1

    :cond_c2
    if-eqz v0, :cond_e2

    .line 69
    new-instance v10, Lb/f/b/k/g$a;

    iget-object v3, v8, Lb/f/b/k/e;->A:Lb/f/b/k/d;

    iget-object v4, v8, Lb/f/b/k/e;->B:Lb/f/b/k/d;

    iget-object v5, v8, Lb/f/b/k/e;->C:Lb/f/b/k/d;

    iget-object v6, v8, Lb/f/b/k/e;->D:Lb/f/b/k/d;

    move-object v0, v10

    move-object/from16 v1, p0

    move/from16 v2, p3

    move/from16 v7, p4

    invoke-direct/range {v0 .. v7}, Lb/f/b/k/g$a;-><init>(Lb/f/b/k/g;ILb/f/b/k/d;Lb/f/b/k/d;Lb/f/b/k/d;Lb/f/b/k/d;I)V

    .line 70
    invoke-virtual {v10, v11}, Lb/f/b/k/g$a;->b(I)V

    .line 71
    iget-object v0, v8, Lb/f/b/k/g;->j1:Ljava/util/ArrayList;

    invoke-virtual {v0, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_e0
    move v1, v13

    goto :goto_e8

    :cond_e2
    if-lez v11, :cond_e0

    .line 72
    iget v0, v8, Lb/f/b/k/g;->d1:I

    add-int/2addr v0, v13

    add-int/2addr v1, v0

    .line 73
    :goto_e8
    invoke-virtual {v10, v12}, Lb/f/b/k/g$a;->a(Lb/f/b/k/e;)V

    add-int/lit8 v11, v11, 0x1

    move v0, v14

    goto :goto_91

    .line 74
    :cond_ef
    iget-object v1, v8, Lb/f/b/k/g;->j1:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    .line 75
    iget-object v2, v8, Lb/f/b/k/e;->A:Lb/f/b/k/d;

    .line 76
    iget-object v3, v8, Lb/f/b/k/e;->B:Lb/f/b/k/d;

    .line 77
    iget-object v4, v8, Lb/f/b/k/e;->C:Lb/f/b/k/d;

    .line 78
    iget-object v5, v8, Lb/f/b/k/e;->D:Lb/f/b/k/d;

    .line 79
    invoke-virtual/range {p0 .. p0}, Lb/f/b/k/l;->N()I

    move-result v6

    .line 80
    invoke-virtual/range {p0 .. p0}, Lb/f/b/k/l;->P()I

    move-result v7

    .line 81
    invoke-virtual/range {p0 .. p0}, Lb/f/b/k/l;->O()I

    move-result v9

    .line 82
    invoke-virtual/range {p0 .. p0}, Lb/f/b/k/l;->M()I

    move-result v10

    .line 83
    invoke-virtual/range {p0 .. p0}, Lb/f/b/k/e;->n()Lb/f/b/k/e$b;

    move-result-object v11

    sget-object v12, Lb/f/b/k/e$b;->WRAP_CONTENT:Lb/f/b/k/e$b;

    if-eq v11, v12, :cond_120

    .line 84
    invoke-virtual/range {p0 .. p0}, Lb/f/b/k/e;->x()Lb/f/b/k/e$b;

    move-result-object v11

    sget-object v12, Lb/f/b/k/e$b;->WRAP_CONTENT:Lb/f/b/k/e$b;

    if-ne v11, v12, :cond_11e

    goto :goto_120

    :cond_11e
    const/4 v11, 0x0

    goto :goto_121

    :cond_120
    :goto_120
    const/4 v11, 0x1

    :goto_121
    if-lez v0, :cond_148

    if-eqz v11, :cond_148

    const/4 v0, 0x0

    :goto_126
    if-ge v0, v1, :cond_148

    .line 85
    iget-object v11, v8, Lb/f/b/k/g;->j1:Ljava/util/ArrayList;

    invoke-virtual {v11, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lb/f/b/k/g$a;

    if-nez p3, :cond_13c

    .line 86
    invoke-virtual {v11}, Lb/f/b/k/g$a;->c()I

    move-result v12

    sub-int v12, v15, v12

    invoke-virtual {v11, v12}, Lb/f/b/k/g$a;->a(I)V

    goto :goto_145

    .line 87
    :cond_13c
    invoke-virtual {v11}, Lb/f/b/k/g$a;->b()I

    move-result v12

    sub-int v12, v15, v12

    invoke-virtual {v11, v12}, Lb/f/b/k/g$a;->a(I)V

    :goto_145
    add-int/lit8 v0, v0, 0x1

    goto :goto_126

    :cond_148
    move/from16 v22, v7

    move v0, v9

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    move v7, v6

    move-object v6, v3

    move-object v3, v2

    move v2, v10

    :goto_152
    if-ge v14, v1, :cond_229

    .line 88
    iget-object v9, v8, Lb/f/b/k/g;->j1:Ljava/util/ArrayList;

    invoke-virtual {v9, v14}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    move-object/from16 v23, v9

    check-cast v23, Lb/f/b/k/g$a;

    if-nez p3, :cond_1c2

    add-int/lit8 v2, v1, -0x1

    if-ge v14, v2, :cond_176

    .line 89
    iget-object v2, v8, Lb/f/b/k/g;->j1:Ljava/util/ArrayList;

    add-int/lit8 v5, v14, 0x1

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb/f/b/k/g$a;

    .line 90
    invoke-static {v2}, Lb/f/b/k/g$a;->a(Lb/f/b/k/g$a;)Lb/f/b/k/e;

    move-result-object v2

    iget-object v2, v2, Lb/f/b/k/e;->B:Lb/f/b/k/d;

    const/4 v5, 0x0

    goto :goto_17c

    .line 91
    :cond_176
    iget-object v2, v8, Lb/f/b/k/e;->D:Lb/f/b/k/d;

    .line 92
    invoke-virtual/range {p0 .. p0}, Lb/f/b/k/l;->M()I

    move-result v5

    .line 93
    :goto_17c
    invoke-static/range {v23 .. v23}, Lb/f/b/k/g$a;->a(Lb/f/b/k/g$a;)Lb/f/b/k/e;

    move-result-object v9

    iget-object v11, v9, Lb/f/b/k/e;->D:Lb/f/b/k/d;

    move-object/from16 v9, v23

    move/from16 v10, p3

    move-object/from16 v24, v11

    move-object v11, v3

    move-object/from16 p1, v3

    move v3, v12

    move-object v12, v6

    move v6, v13

    move-object v13, v4

    move-object/from16 p2, v4

    move v4, v14

    move-object v14, v2

    move v15, v7

    move/from16 v16, v22

    move/from16 v17, v0

    move/from16 v18, v5

    move/from16 v19, p4

    .line 94
    invoke-virtual/range {v9 .. v19}, Lb/f/b/k/g$a;->a(ILb/f/b/k/d;Lb/f/b/k/d;Lb/f/b/k/d;Lb/f/b/k/d;IIIII)V

    .line 95
    invoke-virtual/range {v23 .. v23}, Lb/f/b/k/g$a;->c()I

    move-result v9

    invoke-static {v6, v9}, Ljava/lang/Math;->max(II)I

    move-result v6

    .line 96
    invoke-virtual/range {v23 .. v23}, Lb/f/b/k/g$a;->b()I

    move-result v9

    add-int v12, v3, v9

    if-lez v4, :cond_1b2

    .line 97
    iget v3, v8, Lb/f/b/k/g;->d1:I

    add-int/2addr v12, v3

    :cond_1b2
    move-object/from16 v3, p1

    move v13, v6

    move-object/from16 v6, v24

    const/16 v22, 0x0

    move-object/from16 v24, p2

    move/from16 v27, v5

    move-object v5, v2

    move/from16 v2, v27

    goto/16 :goto_221

    :cond_1c2
    move-object/from16 p1, v3

    move v3, v12

    move v0, v13

    move v4, v14

    add-int/lit8 v9, v1, -0x1

    if-ge v4, v9, :cond_1e0

    .line 98
    iget-object v9, v8, Lb/f/b/k/g;->j1:Ljava/util/ArrayList;

    add-int/lit8 v14, v4, 0x1

    invoke-virtual {v9, v14}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lb/f/b/k/g$a;

    .line 99
    invoke-static {v9}, Lb/f/b/k/g$a;->a(Lb/f/b/k/g$a;)Lb/f/b/k/e;

    move-result-object v9

    iget-object v9, v9, Lb/f/b/k/e;->A:Lb/f/b/k/d;

    move-object/from16 v24, v9

    const/16 v25, 0x0

    goto :goto_1ea

    .line 100
    :cond_1e0
    iget-object v9, v8, Lb/f/b/k/e;->C:Lb/f/b/k/d;

    .line 101
    invoke-virtual/range {p0 .. p0}, Lb/f/b/k/l;->O()I

    move-result v10

    move-object/from16 v24, v9

    move/from16 v25, v10

    .line 102
    :goto_1ea
    invoke-static/range {v23 .. v23}, Lb/f/b/k/g$a;->a(Lb/f/b/k/g$a;)Lb/f/b/k/e;

    move-result-object v9

    iget-object v15, v9, Lb/f/b/k/e;->C:Lb/f/b/k/d;

    move-object/from16 v9, v23

    move/from16 v10, p3

    move-object/from16 v11, p1

    move-object v12, v6

    move-object/from16 v13, v24

    move-object v14, v5

    move-object/from16 v26, v15

    move v15, v7

    move/from16 v16, v22

    move/from16 v17, v25

    move/from16 v18, v2

    move/from16 v19, p4

    .line 103
    invoke-virtual/range {v9 .. v19}, Lb/f/b/k/g$a;->a(ILb/f/b/k/d;Lb/f/b/k/d;Lb/f/b/k/d;Lb/f/b/k/d;IIIII)V

    .line 104
    invoke-virtual/range {v23 .. v23}, Lb/f/b/k/g$a;->c()I

    move-result v7

    add-int v13, v0, v7

    .line 105
    invoke-virtual/range {v23 .. v23}, Lb/f/b/k/g$a;->b()I

    move-result v0

    invoke-static {v3, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    if-lez v4, :cond_21b

    .line 106
    iget v3, v8, Lb/f/b/k/g;->c1:I

    add-int/2addr v13, v3

    :cond_21b
    move v12, v0

    move/from16 v0, v25

    move-object/from16 v3, v26

    const/4 v7, 0x0

    :goto_221
    add-int/lit8 v14, v4, 0x1

    move/from16 v15, p4

    move-object/from16 v4, v24

    goto/16 :goto_152

    :cond_229
    move v3, v12

    move v0, v13

    .line 107
    aput v0, p5, v21

    .line 108
    aput v3, p5, v20

    return-void
.end method

.method public final c([Lb/f/b/k/e;III[I)V
    .registers 28

    move-object/from16 v8, p0

    move/from16 v9, p2

    if-nez v9, :cond_7

    return-void

    .line 2
    :cond_7
    iget-object v0, v8, Lb/f/b/k/g;->j1:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v10, 0x0

    if-nez v0, :cond_2a

    .line 3
    new-instance v11, Lb/f/b/k/g$a;

    iget-object v3, v8, Lb/f/b/k/e;->A:Lb/f/b/k/d;

    iget-object v4, v8, Lb/f/b/k/e;->B:Lb/f/b/k/d;

    iget-object v5, v8, Lb/f/b/k/e;->C:Lb/f/b/k/d;

    iget-object v6, v8, Lb/f/b/k/e;->D:Lb/f/b/k/d;

    move-object v0, v11

    move-object/from16 v1, p0

    move/from16 v2, p3

    move/from16 v7, p4

    invoke-direct/range {v0 .. v7}, Lb/f/b/k/g$a;-><init>(Lb/f/b/k/g;ILb/f/b/k/d;Lb/f/b/k/d;Lb/f/b/k/d;Lb/f/b/k/d;I)V

    .line 4
    iget-object v0, v8, Lb/f/b/k/g;->j1:Ljava/util/ArrayList;

    invoke-virtual {v0, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_57

    .line 5
    :cond_2a
    iget-object v0, v8, Lb/f/b/k/g;->j1:Ljava/util/ArrayList;

    invoke-virtual {v0, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb/f/b/k/g$a;

    .line 6
    invoke-virtual {v0}, Lb/f/b/k/g$a;->a()V

    .line 7
    iget-object v13, v8, Lb/f/b/k/e;->A:Lb/f/b/k/d;

    iget-object v14, v8, Lb/f/b/k/e;->B:Lb/f/b/k/d;

    iget-object v15, v8, Lb/f/b/k/e;->C:Lb/f/b/k/d;

    iget-object v1, v8, Lb/f/b/k/e;->D:Lb/f/b/k/d;

    .line 8
    invoke-virtual/range {p0 .. p0}, Lb/f/b/k/l;->N()I

    move-result v17

    invoke-virtual/range {p0 .. p0}, Lb/f/b/k/l;->P()I

    move-result v18

    invoke-virtual/range {p0 .. p0}, Lb/f/b/k/l;->O()I

    move-result v19

    invoke-virtual/range {p0 .. p0}, Lb/f/b/k/l;->M()I

    move-result v20

    move-object v11, v0

    move/from16 v12, p3

    move-object/from16 v16, v1

    move/from16 v21, p4

    .line 9
    invoke-virtual/range {v11 .. v21}, Lb/f/b/k/g$a;->a(ILb/f/b/k/d;Lb/f/b/k/d;Lb/f/b/k/d;Lb/f/b/k/d;IIIII)V

    :goto_57
    const/4 v0, 0x0

    :goto_58
    if-ge v0, v9, :cond_62

    .line 10
    aget-object v1, p1, v0

    .line 11
    invoke-virtual {v11, v1}, Lb/f/b/k/g$a;->a(Lb/f/b/k/e;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_58

    .line 12
    :cond_62
    invoke-virtual {v11}, Lb/f/b/k/g$a;->c()I

    move-result v0

    aput v0, p5, v10

    .line 13
    invoke-virtual {v11}, Lb/f/b/k/g$a;->b()I

    move-result v0

    const/4 v1, 0x1

    aput v0, p5, v1

    return-void
.end method

.method public e(F)V
    .registers 2

    .line 2
    iput p1, p0, Lb/f/b/k/g;->Y0:F

    return-void
.end method

.method public f(F)V
    .registers 2

    .line 2
    iput p1, p0, Lb/f/b/k/g;->Z0:F

    return-void
.end method

.method public final f(Z)V
    .registers 13

    .line 3
    iget-object v0, p0, Lb/f/b/k/g;->m1:[I

    if-eqz v0, :cond_116

    iget-object v0, p0, Lb/f/b/k/g;->l1:[Lb/f/b/k/e;

    if-eqz v0, :cond_116

    iget-object v0, p0, Lb/f/b/k/g;->k1:[Lb/f/b/k/e;

    if-nez v0, :cond_e

    goto/16 :goto_116

    :cond_e
    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 4
    :goto_10
    iget v2, p0, Lb/f/b/k/g;->o1:I

    if-ge v1, v2, :cond_1e

    .line 5
    iget-object v2, p0, Lb/f/b/k/g;->n1:[Lb/f/b/k/e;

    aget-object v2, v2, v1

    .line 6
    invoke-virtual {v2}, Lb/f/b/k/e;->I()V

    add-int/lit8 v1, v1, 0x1

    goto :goto_10

    .line 7
    :cond_1e
    iget-object v1, p0, Lb/f/b/k/g;->m1:[I

    aget v2, v1, v0

    const/4 v3, 0x1

    .line 8
    aget v1, v1, v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    :goto_27
    const/16 v6, 0x8

    if-ge v5, v2, :cond_7b

    if-eqz p1, :cond_31

    sub-int v7, v2, v5

    sub-int/2addr v7, v3

    goto :goto_32

    :cond_31
    move v7, v5

    .line 9
    :goto_32
    iget-object v8, p0, Lb/f/b/k/g;->l1:[Lb/f/b/k/e;

    aget-object v7, v8, v7

    if-eqz v7, :cond_78

    .line 10
    invoke-virtual {v7}, Lb/f/b/k/e;->z()I

    move-result v8

    if-ne v8, v6, :cond_3f

    goto :goto_78

    :cond_3f
    if-nez v5, :cond_56

    .line 11
    iget-object v6, v7, Lb/f/b/k/e;->A:Lb/f/b/k/d;

    iget-object v8, p0, Lb/f/b/k/e;->A:Lb/f/b/k/d;

    invoke-virtual {p0}, Lb/f/b/k/l;->N()I

    move-result v9

    invoke-virtual {v7, v6, v8, v9}, Lb/f/b/k/e;->a(Lb/f/b/k/d;Lb/f/b/k/d;I)V

    .line 12
    iget v6, p0, Lb/f/b/k/g;->Q0:I

    invoke-virtual {v7, v6}, Lb/f/b/k/e;->j(I)V

    .line 13
    iget v6, p0, Lb/f/b/k/g;->W0:F

    invoke-virtual {v7, v6}, Lb/f/b/k/e;->a(F)V

    :cond_56
    add-int/lit8 v6, v2, -0x1

    if-ne v5, v6, :cond_65

    .line 14
    iget-object v6, v7, Lb/f/b/k/e;->C:Lb/f/b/k/d;

    iget-object v8, p0, Lb/f/b/k/e;->C:Lb/f/b/k/d;

    invoke-virtual {p0}, Lb/f/b/k/l;->O()I

    move-result v9

    invoke-virtual {v7, v6, v8, v9}, Lb/f/b/k/e;->a(Lb/f/b/k/d;Lb/f/b/k/d;I)V

    :cond_65
    if-lez v5, :cond_77

    .line 15
    iget-object v6, v7, Lb/f/b/k/e;->A:Lb/f/b/k/d;

    iget-object v8, v4, Lb/f/b/k/e;->C:Lb/f/b/k/d;

    iget v9, p0, Lb/f/b/k/g;->c1:I

    invoke-virtual {v7, v6, v8, v9}, Lb/f/b/k/e;->a(Lb/f/b/k/d;Lb/f/b/k/d;I)V

    .line 16
    iget-object v6, v4, Lb/f/b/k/e;->C:Lb/f/b/k/d;

    iget-object v8, v7, Lb/f/b/k/e;->A:Lb/f/b/k/d;

    invoke-virtual {v4, v6, v8, v0}, Lb/f/b/k/e;->a(Lb/f/b/k/d;Lb/f/b/k/d;I)V

    :cond_77
    move-object v4, v7

    :cond_78
    :goto_78
    add-int/lit8 v5, v5, 0x1

    goto :goto_27

    :cond_7b
    const/4 p1, 0x0

    :goto_7c
    if-ge p1, v1, :cond_c7

    .line 17
    iget-object v5, p0, Lb/f/b/k/g;->k1:[Lb/f/b/k/e;

    aget-object v5, v5, p1

    if-eqz v5, :cond_c4

    .line 18
    invoke-virtual {v5}, Lb/f/b/k/e;->z()I

    move-result v7

    if-ne v7, v6, :cond_8b

    goto :goto_c4

    :cond_8b
    if-nez p1, :cond_a2

    .line 19
    iget-object v7, v5, Lb/f/b/k/e;->B:Lb/f/b/k/d;

    iget-object v8, p0, Lb/f/b/k/e;->B:Lb/f/b/k/d;

    invoke-virtual {p0}, Lb/f/b/k/l;->P()I

    move-result v9

    invoke-virtual {v5, v7, v8, v9}, Lb/f/b/k/e;->a(Lb/f/b/k/d;Lb/f/b/k/d;I)V

    .line 20
    iget v7, p0, Lb/f/b/k/g;->R0:I

    invoke-virtual {v5, v7}, Lb/f/b/k/e;->o(I)V

    .line 21
    iget v7, p0, Lb/f/b/k/g;->X0:F

    invoke-virtual {v5, v7}, Lb/f/b/k/e;->c(F)V

    :cond_a2
    add-int/lit8 v7, v1, -0x1

    if-ne p1, v7, :cond_b1

    .line 22
    iget-object v7, v5, Lb/f/b/k/e;->D:Lb/f/b/k/d;

    iget-object v8, p0, Lb/f/b/k/e;->D:Lb/f/b/k/d;

    invoke-virtual {p0}, Lb/f/b/k/l;->M()I

    move-result v9

    invoke-virtual {v5, v7, v8, v9}, Lb/f/b/k/e;->a(Lb/f/b/k/d;Lb/f/b/k/d;I)V

    :cond_b1
    if-lez p1, :cond_c3

    .line 23
    iget-object v7, v5, Lb/f/b/k/e;->B:Lb/f/b/k/d;

    iget-object v8, v4, Lb/f/b/k/e;->D:Lb/f/b/k/d;

    iget v9, p0, Lb/f/b/k/g;->d1:I

    invoke-virtual {v5, v7, v8, v9}, Lb/f/b/k/e;->a(Lb/f/b/k/d;Lb/f/b/k/d;I)V

    .line 24
    iget-object v7, v4, Lb/f/b/k/e;->D:Lb/f/b/k/d;

    iget-object v8, v5, Lb/f/b/k/e;->B:Lb/f/b/k/d;

    invoke-virtual {v4, v7, v8, v0}, Lb/f/b/k/e;->a(Lb/f/b/k/d;Lb/f/b/k/d;I)V

    :cond_c3
    move-object v4, v5

    :cond_c4
    :goto_c4
    add-int/lit8 p1, p1, 0x1

    goto :goto_7c

    :cond_c7
    const/4 p1, 0x0

    :goto_c8
    if-ge p1, v2, :cond_116

    const/4 v4, 0x0

    :goto_cb
    if-ge v4, v1, :cond_113

    mul-int v5, v4, v2

    add-int/2addr v5, p1

    .line 25
    iget v7, p0, Lb/f/b/k/g;->i1:I

    if-ne v7, v3, :cond_d7

    mul-int v5, p1, v1

    add-int/2addr v5, v4

    .line 26
    :cond_d7
    iget-object v7, p0, Lb/f/b/k/g;->n1:[Lb/f/b/k/e;

    array-length v8, v7

    if-lt v5, v8, :cond_dd

    goto :goto_110

    .line 27
    :cond_dd
    aget-object v5, v7, v5

    if-eqz v5, :cond_110

    .line 28
    invoke-virtual {v5}, Lb/f/b/k/e;->z()I

    move-result v7

    if-ne v7, v6, :cond_e8

    goto :goto_110

    .line 29
    :cond_e8
    iget-object v7, p0, Lb/f/b/k/g;->l1:[Lb/f/b/k/e;

    aget-object v7, v7, p1

    .line 30
    iget-object v8, p0, Lb/f/b/k/g;->k1:[Lb/f/b/k/e;

    aget-object v8, v8, v4

    if-eq v5, v7, :cond_100

    .line 31
    iget-object v9, v5, Lb/f/b/k/e;->A:Lb/f/b/k/d;

    iget-object v10, v7, Lb/f/b/k/e;->A:Lb/f/b/k/d;

    invoke-virtual {v5, v9, v10, v0}, Lb/f/b/k/e;->a(Lb/f/b/k/d;Lb/f/b/k/d;I)V

    .line 32
    iget-object v9, v5, Lb/f/b/k/e;->C:Lb/f/b/k/d;

    iget-object v7, v7, Lb/f/b/k/e;->C:Lb/f/b/k/d;

    invoke-virtual {v5, v9, v7, v0}, Lb/f/b/k/e;->a(Lb/f/b/k/d;Lb/f/b/k/d;I)V

    :cond_100
    if-eq v5, v8, :cond_110

    .line 33
    iget-object v7, v5, Lb/f/b/k/e;->B:Lb/f/b/k/d;

    iget-object v9, v8, Lb/f/b/k/e;->B:Lb/f/b/k/d;

    invoke-virtual {v5, v7, v9, v0}, Lb/f/b/k/e;->a(Lb/f/b/k/d;Lb/f/b/k/d;I)V

    .line 34
    iget-object v7, v5, Lb/f/b/k/e;->D:Lb/f/b/k/d;

    iget-object v8, v8, Lb/f/b/k/e;->D:Lb/f/b/k/d;

    invoke-virtual {v5, v7, v8, v0}, Lb/f/b/k/e;->a(Lb/f/b/k/d;Lb/f/b/k/d;I)V

    :cond_110
    :goto_110
    add-int/lit8 v4, v4, 0x1

    goto :goto_cb

    :cond_113
    add-int/lit8 p1, p1, 0x1

    goto :goto_c8

    :cond_116
    :goto_116
    return-void
.end method

.method public g(F)V
    .registers 2

    .line 2
    iput p1, p0, Lb/f/b/k/g;->W0:F

    return-void
.end method

.method public h(F)V
    .registers 2

    .line 2
    iput p1, p0, Lb/f/b/k/g;->a1:F

    return-void
.end method

.method public i(F)V
    .registers 2

    .line 2
    iput p1, p0, Lb/f/b/k/g;->b1:F

    return-void
.end method

.method public j(F)V
    .registers 2

    .line 2
    iput p1, p0, Lb/f/b/k/g;->X0:F

    return-void
.end method
