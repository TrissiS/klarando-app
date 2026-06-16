.class public Lb/f/b/k/f;
.super Lb/f/b/k/m;
.source "ConstraintWidgetContainer.java"


# instance fields
.field public E0:Lb/f/b/k/n/b;

.field public F0:Lb/f/b/k/n/e;

.field public G0:Lb/f/b/k/n/b$b;

.field public H0:Z

.field public I0:Lb/f/b/e;

.field public J0:Lb/f/b/d;

.field public K0:I

.field public L0:I

.field public M0:I

.field public N0:I

.field public O0:[Lb/f/b/k/c;

.field public P0:[Lb/f/b/k/c;

.field public Q0:I

.field public R0:Z

.field public S0:Z


# direct methods
.method public constructor <init>()V
    .registers 4

    .line 1
    invoke-direct {p0}, Lb/f/b/k/m;-><init>()V

    .line 2
    new-instance v0, Lb/f/b/k/n/b;

    invoke-direct {v0, p0}, Lb/f/b/k/n/b;-><init>(Lb/f/b/k/f;)V

    iput-object v0, p0, Lb/f/b/k/f;->E0:Lb/f/b/k/n/b;

    .line 3
    new-instance v0, Lb/f/b/k/n/e;

    invoke-direct {v0, p0}, Lb/f/b/k/n/e;-><init>(Lb/f/b/k/f;)V

    iput-object v0, p0, Lb/f/b/k/f;->F0:Lb/f/b/k/n/e;

    const/4 v0, 0x0

    .line 4
    iput-object v0, p0, Lb/f/b/k/f;->G0:Lb/f/b/k/n/b$b;

    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lb/f/b/k/f;->H0:Z

    .line 6
    new-instance v1, Lb/f/b/d;

    invoke-direct {v1}, Lb/f/b/d;-><init>()V

    iput-object v1, p0, Lb/f/b/k/f;->J0:Lb/f/b/d;

    .line 7
    iput v0, p0, Lb/f/b/k/f;->M0:I

    .line 8
    iput v0, p0, Lb/f/b/k/f;->N0:I

    const/4 v1, 0x4

    new-array v2, v1, [Lb/f/b/k/c;

    .line 9
    iput-object v2, p0, Lb/f/b/k/f;->O0:[Lb/f/b/k/c;

    new-array v1, v1, [Lb/f/b/k/c;

    .line 10
    iput-object v1, p0, Lb/f/b/k/f;->P0:[Lb/f/b/k/c;

    const/16 v1, 0x107

    .line 11
    iput v1, p0, Lb/f/b/k/f;->Q0:I

    .line 12
    iput-boolean v0, p0, Lb/f/b/k/f;->R0:Z

    .line 13
    iput-boolean v0, p0, Lb/f/b/k/f;->S0:Z

    return-void
.end method


# virtual methods
.method public H()V
    .registers 2

    .line 1
    iget-object v0, p0, Lb/f/b/k/f;->J0:Lb/f/b/d;

    invoke-virtual {v0}, Lb/f/b/d;->i()V

    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lb/f/b/k/f;->K0:I

    .line 3
    iput v0, p0, Lb/f/b/k/f;->L0:I

    .line 4
    invoke-super {p0}, Lb/f/b/k/m;->H()V

    return-void
.end method

.method public K()V
    .registers 18

    move-object/from16 v1, p0

    const/4 v2, 0x0

    .line 1
    iput v2, v1, Lb/f/b/k/e;->R:I

    .line 2
    iput v2, v1, Lb/f/b/k/e;->S:I

    .line 3
    invoke-virtual/range {p0 .. p0}, Lb/f/b/k/e;->A()I

    move-result v0

    invoke-static {v2, v0}, Ljava/lang/Math;->max(II)I

    move-result v3

    .line 4
    invoke-virtual/range {p0 .. p0}, Lb/f/b/k/e;->k()I

    move-result v0

    invoke-static {v2, v0}, Ljava/lang/Math;->max(II)I

    move-result v4

    .line 5
    iput-boolean v2, v1, Lb/f/b/k/f;->R0:Z

    .line 6
    iput-boolean v2, v1, Lb/f/b/k/f;->S0:Z

    const/16 v0, 0x40

    .line 7
    invoke-virtual {v1, v0}, Lb/f/b/k/f;->t(I)Z

    move-result v0

    const/4 v5, 0x1

    if-nez v0, :cond_2f

    const/16 v0, 0x80

    invoke-virtual {v1, v0}, Lb/f/b/k/f;->t(I)Z

    move-result v0

    if-eqz v0, :cond_2d

    goto :goto_2f

    :cond_2d
    const/4 v0, 0x0

    goto :goto_30

    :cond_2f
    :goto_2f
    const/4 v0, 0x1

    .line 8
    :goto_30
    iget-object v6, v1, Lb/f/b/k/f;->J0:Lb/f/b/d;

    iput-boolean v2, v6, Lb/f/b/d;->g:Z

    .line 9
    iput-boolean v2, v6, Lb/f/b/d;->h:Z

    .line 10
    iget v7, v1, Lb/f/b/k/f;->Q0:I

    if-eqz v7, :cond_3e

    if-eqz v0, :cond_3e

    .line 11
    iput-boolean v5, v6, Lb/f/b/d;->h:Z

    .line 12
    :cond_3e
    iget-object v0, v1, Lb/f/b/k/e;->L:[Lb/f/b/k/e$b;

    aget-object v6, v0, v5

    .line 13
    aget-object v7, v0, v2

    .line 14
    iget-object v8, v1, Lb/f/b/k/m;->D0:Ljava/util/ArrayList;

    .line 15
    invoke-virtual/range {p0 .. p0}, Lb/f/b/k/e;->n()Lb/f/b/k/e$b;

    move-result-object v0

    sget-object v9, Lb/f/b/k/e$b;->WRAP_CONTENT:Lb/f/b/k/e$b;

    if-eq v0, v9, :cond_59

    invoke-virtual/range {p0 .. p0}, Lb/f/b/k/e;->x()Lb/f/b/k/e$b;

    move-result-object v0

    sget-object v9, Lb/f/b/k/e$b;->WRAP_CONTENT:Lb/f/b/k/e$b;

    if-ne v0, v9, :cond_57

    goto :goto_59

    :cond_57
    const/4 v9, 0x0

    goto :goto_5a

    :cond_59
    :goto_59
    const/4 v9, 0x1

    .line 16
    :goto_5a
    invoke-virtual/range {p0 .. p0}, Lb/f/b/k/f;->U()V

    .line 17
    iget-object v0, v1, Lb/f/b/k/m;->D0:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v10

    const/4 v0, 0x0

    :goto_64
    if-ge v0, v10, :cond_7a

    .line 18
    iget-object v11, v1, Lb/f/b/k/m;->D0:Ljava/util/ArrayList;

    invoke-virtual {v11, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lb/f/b/k/e;

    .line 19
    instance-of v12, v11, Lb/f/b/k/m;

    if-eqz v12, :cond_77

    .line 20
    check-cast v11, Lb/f/b/k/m;

    invoke-virtual {v11}, Lb/f/b/k/m;->K()V

    :cond_77
    add-int/lit8 v0, v0, 0x1

    goto :goto_64

    :cond_7a
    const/4 v0, 0x0

    const/4 v11, 0x1

    const/4 v12, 0x0

    :goto_7d
    if-eqz v11, :cond_1d5

    add-int/lit8 v13, v0, 0x1

    .line 21
    :try_start_81
    iget-object v0, v1, Lb/f/b/k/f;->J0:Lb/f/b/d;

    invoke-virtual {v0}, Lb/f/b/d;->i()V

    .line 22
    invoke-virtual/range {p0 .. p0}, Lb/f/b/k/f;->U()V

    .line 23
    iget-object v0, v1, Lb/f/b/k/f;->J0:Lb/f/b/d;

    invoke-virtual {v1, v0}, Lb/f/b/k/e;->b(Lb/f/b/d;)V

    const/4 v0, 0x0

    :goto_8f
    if-ge v0, v10, :cond_a1

    .line 24
    iget-object v14, v1, Lb/f/b/k/m;->D0:Ljava/util/ArrayList;

    invoke-virtual {v14, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lb/f/b/k/e;

    .line 25
    iget-object v15, v1, Lb/f/b/k/f;->J0:Lb/f/b/d;

    invoke-virtual {v14, v15}, Lb/f/b/k/e;->b(Lb/f/b/d;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_8f

    .line 26
    :cond_a1
    iget-object v0, v1, Lb/f/b/k/f;->J0:Lb/f/b/d;

    invoke-virtual {v1, v0}, Lb/f/b/k/f;->d(Lb/f/b/d;)Z

    move-result v11

    if-eqz v11, :cond_c9

    .line 27
    iget-object v0, v1, Lb/f/b/k/f;->J0:Lb/f/b/d;

    invoke-virtual {v0}, Lb/f/b/d;->g()V
    :try_end_ae
    .catch Ljava/lang/Exception; {:try_start_81 .. :try_end_ae} :catch_af

    goto :goto_c9

    :catch_af
    move-exception v0

    .line 28
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 29
    sget-object v14, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "EXCEPTION : "

    invoke-virtual {v15, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v14, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    :cond_c9
    :goto_c9
    if-eqz v11, :cond_d3

    .line 30
    iget-object v0, v1, Lb/f/b/k/f;->J0:Lb/f/b/d;

    sget-object v5, Lb/f/b/k/k;->a:[Z

    invoke-virtual {v1, v0, v5}, Lb/f/b/k/f;->a(Lb/f/b/d;[Z)V

    goto :goto_eb

    .line 31
    :cond_d3
    iget-object v0, v1, Lb/f/b/k/f;->J0:Lb/f/b/d;

    invoke-virtual {v1, v0}, Lb/f/b/k/e;->c(Lb/f/b/d;)V

    const/4 v0, 0x0

    :goto_d9
    if-ge v0, v10, :cond_eb

    .line 32
    iget-object v5, v1, Lb/f/b/k/m;->D0:Ljava/util/ArrayList;

    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lb/f/b/k/e;

    .line 33
    iget-object v11, v1, Lb/f/b/k/f;->J0:Lb/f/b/d;

    invoke-virtual {v5, v11}, Lb/f/b/k/e;->c(Lb/f/b/d;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_d9

    :cond_eb
    :goto_eb
    if-eqz v9, :cond_159

    const/16 v0, 0x8

    if-ge v13, v0, :cond_159

    .line 34
    sget-object v0, Lb/f/b/k/k;->a:[Z

    const/4 v5, 0x2

    aget-boolean v0, v0, v5

    if-eqz v0, :cond_159

    const/4 v0, 0x0

    const/4 v5, 0x0

    const/4 v11, 0x0

    :goto_fb
    if-ge v0, v10, :cond_11f

    .line 35
    iget-object v14, v1, Lb/f/b/k/m;->D0:Ljava/util/ArrayList;

    invoke-virtual {v14, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lb/f/b/k/e;

    .line 36
    iget v15, v14, Lb/f/b/k/e;->R:I

    invoke-virtual {v14}, Lb/f/b/k/e;->A()I

    move-result v16

    add-int v15, v15, v16

    invoke-static {v5, v15}, Ljava/lang/Math;->max(II)I

    move-result v5

    .line 37
    iget v15, v14, Lb/f/b/k/e;->S:I

    invoke-virtual {v14}, Lb/f/b/k/e;->k()I

    move-result v14

    add-int/2addr v15, v14

    invoke-static {v11, v15}, Ljava/lang/Math;->max(II)I

    move-result v11

    add-int/lit8 v0, v0, 0x1

    goto :goto_fb

    .line 38
    :cond_11f
    iget v0, v1, Lb/f/b/k/e;->Y:I

    invoke-static {v0, v5}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 39
    iget v5, v1, Lb/f/b/k/e;->Z:I

    invoke-static {v5, v11}, Ljava/lang/Math;->max(II)I

    move-result v5

    .line 40
    sget-object v11, Lb/f/b/k/e$b;->WRAP_CONTENT:Lb/f/b/k/e$b;

    if-ne v7, v11, :cond_141

    .line 41
    invoke-virtual/range {p0 .. p0}, Lb/f/b/k/e;->A()I

    move-result v11

    if-ge v11, v0, :cond_141

    .line 42
    invoke-virtual {v1, v0}, Lb/f/b/k/e;->q(I)V

    .line 43
    iget-object v0, v1, Lb/f/b/k/e;->L:[Lb/f/b/k/e$b;

    sget-object v11, Lb/f/b/k/e$b;->WRAP_CONTENT:Lb/f/b/k/e$b;

    aput-object v11, v0, v2

    const/4 v0, 0x1

    const/4 v12, 0x1

    goto :goto_142

    :cond_141
    const/4 v0, 0x0

    .line 44
    :goto_142
    sget-object v11, Lb/f/b/k/e$b;->WRAP_CONTENT:Lb/f/b/k/e$b;

    if-ne v6, v11, :cond_15a

    .line 45
    invoke-virtual/range {p0 .. p0}, Lb/f/b/k/e;->k()I

    move-result v11

    if-ge v11, v5, :cond_15a

    .line 46
    invoke-virtual {v1, v5}, Lb/f/b/k/e;->i(I)V

    .line 47
    iget-object v0, v1, Lb/f/b/k/e;->L:[Lb/f/b/k/e$b;

    sget-object v5, Lb/f/b/k/e$b;->WRAP_CONTENT:Lb/f/b/k/e$b;

    const/4 v11, 0x1

    aput-object v5, v0, v11

    const/4 v0, 0x1

    const/4 v12, 0x1

    goto :goto_15a

    :cond_159
    const/4 v0, 0x0

    .line 48
    :cond_15a
    :goto_15a
    iget v5, v1, Lb/f/b/k/e;->Y:I

    invoke-virtual/range {p0 .. p0}, Lb/f/b/k/e;->A()I

    move-result v11

    invoke-static {v5, v11}, Ljava/lang/Math;->max(II)I

    move-result v5

    .line 49
    invoke-virtual/range {p0 .. p0}, Lb/f/b/k/e;->A()I

    move-result v11

    if-le v5, v11, :cond_175

    .line 50
    invoke-virtual {v1, v5}, Lb/f/b/k/e;->q(I)V

    .line 51
    iget-object v0, v1, Lb/f/b/k/e;->L:[Lb/f/b/k/e$b;

    sget-object v5, Lb/f/b/k/e$b;->FIXED:Lb/f/b/k/e$b;

    aput-object v5, v0, v2

    const/4 v0, 0x1

    const/4 v12, 0x1

    .line 52
    :cond_175
    iget v5, v1, Lb/f/b/k/e;->Z:I

    invoke-virtual/range {p0 .. p0}, Lb/f/b/k/e;->k()I

    move-result v11

    invoke-static {v5, v11}, Ljava/lang/Math;->max(II)I

    move-result v5

    .line 53
    invoke-virtual/range {p0 .. p0}, Lb/f/b/k/e;->k()I

    move-result v11

    if-le v5, v11, :cond_192

    .line 54
    invoke-virtual {v1, v5}, Lb/f/b/k/e;->i(I)V

    .line 55
    iget-object v0, v1, Lb/f/b/k/e;->L:[Lb/f/b/k/e$b;

    sget-object v5, Lb/f/b/k/e$b;->FIXED:Lb/f/b/k/e$b;

    const/4 v11, 0x1

    aput-object v5, v0, v11

    const/4 v0, 0x1

    const/4 v12, 0x1

    goto :goto_193

    :cond_192
    const/4 v11, 0x1

    :goto_193
    if-nez v12, :cond_1d0

    .line 56
    iget-object v5, v1, Lb/f/b/k/e;->L:[Lb/f/b/k/e$b;

    aget-object v5, v5, v2

    sget-object v14, Lb/f/b/k/e$b;->WRAP_CONTENT:Lb/f/b/k/e$b;

    if-ne v5, v14, :cond_1b2

    if-lez v3, :cond_1b2

    .line 57
    invoke-virtual/range {p0 .. p0}, Lb/f/b/k/e;->A()I

    move-result v5

    if-le v5, v3, :cond_1b2

    .line 58
    iput-boolean v11, v1, Lb/f/b/k/f;->R0:Z

    .line 59
    iget-object v0, v1, Lb/f/b/k/e;->L:[Lb/f/b/k/e$b;

    sget-object v5, Lb/f/b/k/e$b;->FIXED:Lb/f/b/k/e$b;

    aput-object v5, v0, v2

    .line 60
    invoke-virtual {v1, v3}, Lb/f/b/k/e;->q(I)V

    const/4 v0, 0x1

    const/4 v12, 0x1

    .line 61
    :cond_1b2
    iget-object v5, v1, Lb/f/b/k/e;->L:[Lb/f/b/k/e$b;

    aget-object v5, v5, v11

    sget-object v14, Lb/f/b/k/e$b;->WRAP_CONTENT:Lb/f/b/k/e$b;

    if-ne v5, v14, :cond_1d0

    if-lez v4, :cond_1d0

    .line 62
    invoke-virtual/range {p0 .. p0}, Lb/f/b/k/e;->k()I

    move-result v5

    if-le v5, v4, :cond_1d0

    .line 63
    iput-boolean v11, v1, Lb/f/b/k/f;->S0:Z

    .line 64
    iget-object v0, v1, Lb/f/b/k/e;->L:[Lb/f/b/k/e$b;

    sget-object v5, Lb/f/b/k/e$b;->FIXED:Lb/f/b/k/e$b;

    aput-object v5, v0, v11

    .line 65
    invoke-virtual {v1, v4}, Lb/f/b/k/e;->i(I)V

    const/4 v11, 0x1

    const/4 v12, 0x1

    goto :goto_1d1

    :cond_1d0
    move v11, v0

    :goto_1d1
    move v0, v13

    const/4 v5, 0x1

    goto/16 :goto_7d

    .line 66
    :cond_1d5
    iput-object v8, v1, Lb/f/b/k/m;->D0:Ljava/util/ArrayList;

    if-eqz v12, :cond_1e0

    .line 67
    iget-object v0, v1, Lb/f/b/k/e;->L:[Lb/f/b/k/e$b;

    aput-object v7, v0, v2

    const/4 v2, 0x1

    .line 68
    aput-object v6, v0, v2

    .line 69
    :cond_1e0
    iget-object v0, v1, Lb/f/b/k/f;->J0:Lb/f/b/d;

    invoke-virtual {v0}, Lb/f/b/d;->e()Lb/f/b/c;

    move-result-object v0

    invoke-virtual {v1, v0}, Lb/f/b/k/m;->a(Lb/f/b/c;)V

    return-void
.end method

.method public M()Lb/f/b/k/n/b$b;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/f/b/k/f;->G0:Lb/f/b/k/n/b$b;

    return-object v0
.end method

.method public N()I
    .registers 2

    .line 1
    iget v0, p0, Lb/f/b/k/f;->Q0:I

    return v0
.end method

.method public O()Z
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public P()V
    .registers 2

    .line 1
    iget-object v0, p0, Lb/f/b/k/f;->F0:Lb/f/b/k/n/e;

    invoke-virtual {v0}, Lb/f/b/k/n/e;->b()V

    return-void
.end method

.method public Q()V
    .registers 2

    .line 1
    iget-object v0, p0, Lb/f/b/k/f;->F0:Lb/f/b/k/n/e;

    invoke-virtual {v0}, Lb/f/b/k/n/e;->c()V

    return-void
.end method

.method public R()Z
    .registers 2

    .line 1
    iget-boolean v0, p0, Lb/f/b/k/f;->S0:Z

    return v0
.end method

.method public S()Z
    .registers 2

    .line 1
    iget-boolean v0, p0, Lb/f/b/k/f;->H0:Z

    return v0
.end method

.method public T()Z
    .registers 2

    .line 1
    iget-boolean v0, p0, Lb/f/b/k/f;->R0:Z

    return v0
.end method

.method public final U()V
    .registers 2

    const/4 v0, 0x0

    .line 1
    iput v0, p0, Lb/f/b/k/f;->M0:I

    .line 2
    iput v0, p0, Lb/f/b/k/f;->N0:I

    return-void
.end method

.method public V()V
    .registers 2

    .line 1
    iget-object v0, p0, Lb/f/b/k/f;->E0:Lb/f/b/k/n/b;

    invoke-virtual {v0, p0}, Lb/f/b/k/n/b;->b(Lb/f/b/k/f;)V

    return-void
.end method

.method public a(IIIIIIIII)J
    .registers 22

    move-object v11, p0

    move/from16 v3, p8

    .line 2
    iput v3, v11, Lb/f/b/k/f;->K0:I

    move/from16 v4, p9

    .line 3
    iput v4, v11, Lb/f/b/k/f;->L0:I

    .line 4
    iget-object v0, v11, Lb/f/b/k/f;->E0:Lb/f/b/k/n/b;

    move-object v1, p0

    move v2, p1

    move v5, p2

    move v6, p3

    move/from16 v7, p4

    move/from16 v8, p5

    move/from16 v9, p6

    move/from16 v10, p7

    invoke-virtual/range {v0 .. v10}, Lb/f/b/k/n/b;->a(Lb/f/b/k/f;IIIIIIIII)J

    move-result-wide v0

    return-wide v0
.end method

.method public a(Lb/f/b/d;[Z)V
    .registers 5

    const/4 v0, 0x0

    const/4 v1, 0x2

    .line 7
    aput-boolean v0, p2, v1

    .line 8
    invoke-virtual {p0, p1}, Lb/f/b/k/e;->c(Lb/f/b/d;)V

    .line 9
    iget-object p2, p0, Lb/f/b/k/m;->D0:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p2

    :goto_d
    if-ge v0, p2, :cond_1d

    .line 10
    iget-object v1, p0, Lb/f/b/k/m;->D0:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/f/b/k/e;

    .line 11
    invoke-virtual {v1, p1}, Lb/f/b/k/e;->c(Lb/f/b/d;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_d

    :cond_1d
    return-void
.end method

.method public a(Lb/f/b/k/e;I)V
    .registers 4

    if-nez p2, :cond_6

    .line 16
    invoke-virtual {p0, p1}, Lb/f/b/k/f;->d(Lb/f/b/k/e;)V

    goto :goto_c

    :cond_6
    const/4 v0, 0x1

    if-ne p2, v0, :cond_c

    .line 17
    invoke-virtual {p0, p1}, Lb/f/b/k/f;->e(Lb/f/b/k/e;)V

    :cond_c
    :goto_c
    return-void
.end method

.method public a(Lb/f/b/k/n/b$b;)V
    .registers 3

    .line 5
    iput-object p1, p0, Lb/f/b/k/f;->G0:Lb/f/b/k/n/b$b;

    .line 6
    iget-object v0, p0, Lb/f/b/k/f;->F0:Lb/f/b/k/n/e;

    invoke-virtual {v0, p1}, Lb/f/b/k/n/e;->a(Lb/f/b/k/n/b$b;)V

    return-void
.end method

.method public a(ZZ)V
    .registers 6

    .line 12
    invoke-super {p0, p1, p2}, Lb/f/b/k/e;->a(ZZ)V

    .line 13
    iget-object v0, p0, Lb/f/b/k/m;->D0:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_a
    if-ge v1, v0, :cond_1a

    .line 14
    iget-object v2, p0, Lb/f/b/k/m;->D0:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb/f/b/k/e;

    .line 15
    invoke-virtual {v2, p1, p2}, Lb/f/b/k/e;->a(ZZ)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    :cond_1a
    return-void
.end method

.method public a(ZI)Z
    .registers 4

    .line 1
    iget-object v0, p0, Lb/f/b/k/f;->F0:Lb/f/b/k/n/e;

    invoke-virtual {v0, p1, p2}, Lb/f/b/k/n/e;->a(ZI)Z

    move-result p1

    return p1
.end method

.method public final d(Lb/f/b/k/e;)V
    .registers 7

    .line 34
    iget v0, p0, Lb/f/b/k/f;->M0:I

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lb/f/b/k/f;->P0:[Lb/f/b/k/c;

    array-length v2, v1

    if-lt v0, v2, :cond_14

    .line 35
    array-length v0, v1

    mul-int/lit8 v0, v0, 0x2

    .line 36
    invoke-static {v1, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lb/f/b/k/c;

    iput-object v0, p0, Lb/f/b/k/f;->P0:[Lb/f/b/k/c;

    .line 37
    :cond_14
    iget-object v0, p0, Lb/f/b/k/f;->P0:[Lb/f/b/k/c;

    iget v1, p0, Lb/f/b/k/f;->M0:I

    new-instance v2, Lb/f/b/k/c;

    const/4 v3, 0x0

    invoke-virtual {p0}, Lb/f/b/k/f;->S()Z

    move-result v4

    invoke-direct {v2, p1, v3, v4}, Lb/f/b/k/c;-><init>(Lb/f/b/k/e;IZ)V

    aput-object v2, v0, v1

    .line 38
    iget p1, p0, Lb/f/b/k/f;->M0:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lb/f/b/k/f;->M0:I

    return-void
.end method

.method public d(Lb/f/b/d;)Z
    .registers 10

    .line 2
    invoke-virtual {p0, p1}, Lb/f/b/k/e;->a(Lb/f/b/d;)V

    .line 3
    iget-object v0, p0, Lb/f/b/k/m;->D0:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_c
    const/4 v4, 0x1

    if-ge v2, v0, :cond_25

    .line 4
    iget-object v5, p0, Lb/f/b/k/m;->D0:Ljava/util/ArrayList;

    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lb/f/b/k/e;

    .line 5
    invoke-virtual {v5, v1, v1}, Lb/f/b/k/e;->a(IZ)V

    .line 6
    invoke-virtual {v5, v4, v1}, Lb/f/b/k/e;->a(IZ)V

    .line 7
    instance-of v5, v5, Lb/f/b/k/a;

    if-eqz v5, :cond_22

    const/4 v3, 0x1

    :cond_22
    add-int/lit8 v2, v2, 0x1

    goto :goto_c

    :cond_25
    if-eqz v3, :cond_3e

    const/4 v2, 0x0

    :goto_28
    if-ge v2, v0, :cond_3e

    .line 8
    iget-object v3, p0, Lb/f/b/k/m;->D0:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lb/f/b/k/e;

    .line 9
    instance-of v5, v3, Lb/f/b/k/a;

    if-eqz v5, :cond_3b

    .line 10
    check-cast v3, Lb/f/b/k/a;

    invoke-virtual {v3}, Lb/f/b/k/a;->M()V

    :cond_3b
    add-int/lit8 v2, v2, 0x1

    goto :goto_28

    :cond_3e
    const/4 v2, 0x0

    :goto_3f
    if-ge v2, v0, :cond_55

    .line 11
    iget-object v3, p0, Lb/f/b/k/m;->D0:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lb/f/b/k/e;

    .line 12
    invoke-virtual {v3}, Lb/f/b/k/e;->c()Z

    move-result v5

    if-eqz v5, :cond_52

    .line 13
    invoke-virtual {v3, p1}, Lb/f/b/k/e;->a(Lb/f/b/d;)V

    :cond_52
    add-int/lit8 v2, v2, 0x1

    goto :goto_3f

    :cond_55
    const/4 v2, 0x0

    :goto_56
    if-ge v2, v0, :cond_9d

    .line 14
    iget-object v3, p0, Lb/f/b/k/m;->D0:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lb/f/b/k/e;

    .line 15
    instance-of v5, v3, Lb/f/b/k/f;

    if-eqz v5, :cond_8e

    .line 16
    iget-object v5, v3, Lb/f/b/k/e;->L:[Lb/f/b/k/e$b;

    aget-object v6, v5, v1

    .line 17
    aget-object v5, v5, v4

    .line 18
    sget-object v7, Lb/f/b/k/e$b;->WRAP_CONTENT:Lb/f/b/k/e$b;

    if-ne v6, v7, :cond_73

    .line 19
    sget-object v7, Lb/f/b/k/e$b;->FIXED:Lb/f/b/k/e$b;

    invoke-virtual {v3, v7}, Lb/f/b/k/e;->a(Lb/f/b/k/e$b;)V

    .line 20
    :cond_73
    sget-object v7, Lb/f/b/k/e$b;->WRAP_CONTENT:Lb/f/b/k/e$b;

    if-ne v5, v7, :cond_7c

    .line 21
    sget-object v7, Lb/f/b/k/e$b;->FIXED:Lb/f/b/k/e$b;

    invoke-virtual {v3, v7}, Lb/f/b/k/e;->b(Lb/f/b/k/e$b;)V

    .line 22
    :cond_7c
    invoke-virtual {v3, p1}, Lb/f/b/k/e;->a(Lb/f/b/d;)V

    .line 23
    sget-object v7, Lb/f/b/k/e$b;->WRAP_CONTENT:Lb/f/b/k/e$b;

    if-ne v6, v7, :cond_86

    .line 24
    invoke-virtual {v3, v6}, Lb/f/b/k/e;->a(Lb/f/b/k/e$b;)V

    .line 25
    :cond_86
    sget-object v6, Lb/f/b/k/e$b;->WRAP_CONTENT:Lb/f/b/k/e$b;

    if-ne v5, v6, :cond_9a

    .line 26
    invoke-virtual {v3, v5}, Lb/f/b/k/e;->b(Lb/f/b/k/e$b;)V

    goto :goto_9a

    .line 27
    :cond_8e
    invoke-static {p0, p1, v3}, Lb/f/b/k/k;->a(Lb/f/b/k/f;Lb/f/b/d;Lb/f/b/k/e;)V

    .line 28
    invoke-virtual {v3}, Lb/f/b/k/e;->c()Z

    move-result v5

    if-nez v5, :cond_9a

    .line 29
    invoke-virtual {v3, p1}, Lb/f/b/k/e;->a(Lb/f/b/d;)V

    :cond_9a
    :goto_9a
    add-int/lit8 v2, v2, 0x1

    goto :goto_56

    .line 30
    :cond_9d
    iget v0, p0, Lb/f/b/k/f;->M0:I

    if-lez v0, :cond_a4

    .line 31
    invoke-static {p0, p1, v1}, Lb/f/b/k/b;->a(Lb/f/b/k/f;Lb/f/b/d;I)V

    .line 32
    :cond_a4
    iget v0, p0, Lb/f/b/k/f;->N0:I

    if-lez v0, :cond_ab

    .line 33
    invoke-static {p0, p1, v4}, Lb/f/b/k/b;->a(Lb/f/b/k/f;Lb/f/b/d;I)V

    :cond_ab
    return v4
.end method

.method public d(Z)Z
    .registers 3

    .line 1
    iget-object v0, p0, Lb/f/b/k/f;->F0:Lb/f/b/k/n/e;

    invoke-virtual {v0, p1}, Lb/f/b/k/n/e;->a(Z)Z

    move-result p1

    return p1
.end method

.method public final e(Lb/f/b/k/e;)V
    .registers 7

    .line 2
    iget v0, p0, Lb/f/b/k/f;->N0:I

    const/4 v1, 0x1

    add-int/2addr v0, v1

    iget-object v2, p0, Lb/f/b/k/f;->O0:[Lb/f/b/k/c;

    array-length v3, v2

    if-lt v0, v3, :cond_14

    .line 3
    array-length v0, v2

    mul-int/lit8 v0, v0, 0x2

    .line 4
    invoke-static {v2, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lb/f/b/k/c;

    iput-object v0, p0, Lb/f/b/k/f;->O0:[Lb/f/b/k/c;

    .line 5
    :cond_14
    iget-object v0, p0, Lb/f/b/k/f;->O0:[Lb/f/b/k/c;

    iget v2, p0, Lb/f/b/k/f;->N0:I

    new-instance v3, Lb/f/b/k/c;

    invoke-virtual {p0}, Lb/f/b/k/f;->S()Z

    move-result v4

    invoke-direct {v3, p1, v1, v4}, Lb/f/b/k/c;-><init>(Lb/f/b/k/e;IZ)V

    aput-object v3, v0, v2

    .line 6
    iget p1, p0, Lb/f/b/k/f;->N0:I

    add-int/2addr p1, v1

    iput p1, p0, Lb/f/b/k/f;->N0:I

    return-void
.end method

.method public e(Z)Z
    .registers 3

    .line 1
    iget-object v0, p0, Lb/f/b/k/f;->F0:Lb/f/b/k/n/e;

    invoke-virtual {v0, p1}, Lb/f/b/k/n/e;->b(Z)Z

    move-result p1

    return p1
.end method

.method public f(Z)V
    .registers 2

    .line 1
    iput-boolean p1, p0, Lb/f/b/k/f;->H0:Z

    return-void
.end method

.method public t(I)Z
    .registers 3

    .line 1
    iget v0, p0, Lb/f/b/k/f;->Q0:I

    and-int/2addr v0, p1

    if-ne v0, p1, :cond_7

    const/4 p1, 0x1

    goto :goto_8

    :cond_7
    const/4 p1, 0x0

    :goto_8
    return p1
.end method

.method public u(I)V
    .registers 3

    .line 1
    iput p1, p0, Lb/f/b/k/f;->Q0:I

    const/16 v0, 0x100

    .line 2
    invoke-static {p1, v0}, Lb/f/b/k/k;->a(II)Z

    move-result p1

    sput-boolean p1, Lb/f/b/d;->s:Z

    return-void
.end method
