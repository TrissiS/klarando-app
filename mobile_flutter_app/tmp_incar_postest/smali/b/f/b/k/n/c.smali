.class public Lb/f/b/k/n/c;
.super Lb/f/b/k/n/m;
.source "ChainRun.java"


# instance fields
.field public k:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lb/f/b/k/n/m;",
            ">;"
        }
    .end annotation
.end field

.field public l:I


# direct methods
.method public constructor <init>(Lb/f/b/k/e;I)V
    .registers 3

    .line 1
    invoke-direct {p0, p1}, Lb/f/b/k/n/m;-><init>(Lb/f/b/k/e;)V

    .line 2
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lb/f/b/k/n/c;->k:Ljava/util/ArrayList;

    .line 3
    iput p2, p0, Lb/f/b/k/n/m;->f:I

    .line 4
    invoke-virtual {p0}, Lb/f/b/k/n/c;->g()V

    return-void
.end method


# virtual methods
.method public a()V
    .registers 6

    .line 104
    iget-object v0, p0, Lb/f/b/k/n/c;->k:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_16

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/f/b/k/n/m;

    .line 105
    invoke-virtual {v1}, Lb/f/b/k/n/m;->a()V

    goto :goto_6

    .line 106
    :cond_16
    iget-object v0, p0, Lb/f/b/k/n/c;->k:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x1

    if-ge v0, v1, :cond_20

    return-void

    .line 107
    :cond_20
    iget-object v2, p0, Lb/f/b/k/n/c;->k:Ljava/util/ArrayList;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb/f/b/k/n/m;

    iget-object v2, v2, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    .line 108
    iget-object v4, p0, Lb/f/b/k/n/c;->k:Ljava/util/ArrayList;

    sub-int/2addr v0, v1

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb/f/b/k/n/m;

    iget-object v0, v0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    .line 109
    iget v4, p0, Lb/f/b/k/n/m;->f:I

    if-nez v4, :cond_76

    .line 110
    iget-object v1, v2, Lb/f/b/k/e;->A:Lb/f/b/k/d;

    .line 111
    iget-object v0, v0, Lb/f/b/k/e;->C:Lb/f/b/k/d;

    .line 112
    invoke-virtual {p0, v1, v3}, Lb/f/b/k/n/m;->a(Lb/f/b/k/d;I)Lb/f/b/k/n/f;

    move-result-object v2

    .line 113
    invoke-virtual {v1}, Lb/f/b/k/d;->a()I

    move-result v1

    .line 114
    invoke-virtual {p0}, Lb/f/b/k/n/c;->h()Lb/f/b/k/e;

    move-result-object v4

    if-eqz v4, :cond_52

    .line 115
    iget-object v1, v4, Lb/f/b/k/e;->A:Lb/f/b/k/d;

    invoke-virtual {v1}, Lb/f/b/k/d;->a()I

    move-result v1

    :cond_52
    if-eqz v2, :cond_59

    .line 116
    iget-object v4, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    invoke-virtual {p0, v4, v2, v1}, Lb/f/b/k/n/m;->a(Lb/f/b/k/n/f;Lb/f/b/k/n/f;I)V

    .line 117
    :cond_59
    invoke-virtual {p0, v0, v3}, Lb/f/b/k/n/m;->a(Lb/f/b/k/d;I)Lb/f/b/k/n/f;

    move-result-object v1

    .line 118
    invoke-virtual {v0}, Lb/f/b/k/d;->a()I

    move-result v0

    .line 119
    invoke-virtual {p0}, Lb/f/b/k/n/c;->i()Lb/f/b/k/e;

    move-result-object v2

    if-eqz v2, :cond_6d

    .line 120
    iget-object v0, v2, Lb/f/b/k/e;->C:Lb/f/b/k/d;

    invoke-virtual {v0}, Lb/f/b/k/d;->a()I

    move-result v0

    :cond_6d
    if-eqz v1, :cond_b1

    .line 121
    iget-object v2, p0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    neg-int v0, v0

    invoke-virtual {p0, v2, v1, v0}, Lb/f/b/k/n/m;->a(Lb/f/b/k/n/f;Lb/f/b/k/n/f;I)V

    goto :goto_b1

    .line 122
    :cond_76
    iget-object v2, v2, Lb/f/b/k/e;->B:Lb/f/b/k/d;

    .line 123
    iget-object v0, v0, Lb/f/b/k/e;->D:Lb/f/b/k/d;

    .line 124
    invoke-virtual {p0, v2, v1}, Lb/f/b/k/n/m;->a(Lb/f/b/k/d;I)Lb/f/b/k/n/f;

    move-result-object v3

    .line 125
    invoke-virtual {v2}, Lb/f/b/k/d;->a()I

    move-result v2

    .line 126
    invoke-virtual {p0}, Lb/f/b/k/n/c;->h()Lb/f/b/k/e;

    move-result-object v4

    if-eqz v4, :cond_8e

    .line 127
    iget-object v2, v4, Lb/f/b/k/e;->B:Lb/f/b/k/d;

    invoke-virtual {v2}, Lb/f/b/k/d;->a()I

    move-result v2

    :cond_8e
    if-eqz v3, :cond_95

    .line 128
    iget-object v4, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    invoke-virtual {p0, v4, v3, v2}, Lb/f/b/k/n/m;->a(Lb/f/b/k/n/f;Lb/f/b/k/n/f;I)V

    .line 129
    :cond_95
    invoke-virtual {p0, v0, v1}, Lb/f/b/k/n/m;->a(Lb/f/b/k/d;I)Lb/f/b/k/n/f;

    move-result-object v1

    .line 130
    invoke-virtual {v0}, Lb/f/b/k/d;->a()I

    move-result v0

    .line 131
    invoke-virtual {p0}, Lb/f/b/k/n/c;->i()Lb/f/b/k/e;

    move-result-object v2

    if-eqz v2, :cond_a9

    .line 132
    iget-object v0, v2, Lb/f/b/k/e;->D:Lb/f/b/k/d;

    invoke-virtual {v0}, Lb/f/b/k/d;->a()I

    move-result v0

    :cond_a9
    if-eqz v1, :cond_b1

    .line 133
    iget-object v2, p0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    neg-int v0, v0

    invoke-virtual {p0, v2, v1, v0}, Lb/f/b/k/n/m;->a(Lb/f/b/k/n/f;Lb/f/b/k/n/f;I)V

    .line 134
    :cond_b1
    :goto_b1
    iget-object v0, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iput-object p0, v0, Lb/f/b/k/n/f;->a:Lb/f/b/k/n/d;

    .line 135
    iget-object v0, p0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iput-object p0, v0, Lb/f/b/k/n/f;->a:Lb/f/b/k/n/d;

    return-void
.end method

.method public a(Lb/f/b/k/n/d;)V
    .registers 24

    move-object/from16 v0, p0

    .line 1
    iget-object v1, v0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-boolean v1, v1, Lb/f/b/k/n/f;->j:Z

    if-eqz v1, :cond_42a

    iget-object v1, v0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget-boolean v1, v1, Lb/f/b/k/n/f;->j:Z

    if-nez v1, :cond_10

    goto/16 :goto_42a

    .line 2
    :cond_10
    iget-object v1, v0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    invoke-virtual {v1}, Lb/f/b/k/e;->t()Lb/f/b/k/e;

    move-result-object v1

    if-eqz v1, :cond_23

    .line 3
    instance-of v3, v1, Lb/f/b/k/f;

    if-eqz v3, :cond_23

    .line 4
    check-cast v1, Lb/f/b/k/f;

    invoke-virtual {v1}, Lb/f/b/k/f;->S()Z

    move-result v1

    goto :goto_24

    :cond_23
    const/4 v1, 0x0

    .line 5
    :goto_24
    iget-object v3, v0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget v3, v3, Lb/f/b/k/n/f;->g:I

    iget-object v4, v0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget v4, v4, Lb/f/b/k/n/f;->g:I

    sub-int/2addr v3, v4

    .line 6
    iget-object v4, v0, Lb/f/b/k/n/c;->k:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/4 v5, 0x0

    :goto_34
    const/4 v6, -0x1

    const/16 v7, 0x8

    if-ge v5, v4, :cond_4c

    .line 7
    iget-object v8, v0, Lb/f/b/k/n/c;->k:Ljava/util/ArrayList;

    invoke-virtual {v8, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lb/f/b/k/n/m;

    .line 8
    iget-object v8, v8, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    invoke-virtual {v8}, Lb/f/b/k/e;->z()I

    move-result v8

    if-ne v8, v7, :cond_4d

    add-int/lit8 v5, v5, 0x1

    goto :goto_34

    :cond_4c
    const/4 v5, -0x1

    :cond_4d
    add-int/lit8 v8, v4, -0x1

    move v9, v8

    :goto_50
    if-ltz v9, :cond_66

    .line 9
    iget-object v10, v0, Lb/f/b/k/n/c;->k:Ljava/util/ArrayList;

    invoke-virtual {v10, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lb/f/b/k/n/m;

    .line 10
    iget-object v10, v10, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    invoke-virtual {v10}, Lb/f/b/k/e;->z()I

    move-result v10

    if-ne v10, v7, :cond_65

    add-int/lit8 v9, v9, -0x1

    goto :goto_50

    :cond_65
    move v6, v9

    :cond_66
    const/4 v9, 0x0

    :goto_67
    const/4 v11, 0x2

    const/4 v12, 0x1

    if-ge v9, v11, :cond_106

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    :goto_72
    if-ge v13, v4, :cond_f8

    .line 11
    iget-object v2, v0, Lb/f/b/k/n/c;->k:Ljava/util/ArrayList;

    invoke-virtual {v2, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb/f/b/k/n/m;

    .line 12
    iget-object v11, v2, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    invoke-virtual {v11}, Lb/f/b/k/e;->z()I

    move-result v11

    if-ne v11, v7, :cond_86

    goto/16 :goto_f1

    :cond_86
    add-int/lit8 v16, v16, 0x1

    if-lez v13, :cond_91

    if-lt v13, v5, :cond_91

    .line 13
    iget-object v11, v2, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget v11, v11, Lb/f/b/k/n/f;->f:I

    add-int/2addr v14, v11

    .line 14
    :cond_91
    iget-object v11, v2, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget v11, v11, Lb/f/b/k/n/f;->g:I

    .line 15
    iget-object v7, v2, Lb/f/b/k/n/m;->d:Lb/f/b/k/e$b;

    sget-object v10, Lb/f/b/k/e$b;->MATCH_CONSTRAINT:Lb/f/b/k/e$b;

    if-eq v7, v10, :cond_9d

    const/4 v7, 0x1

    goto :goto_9e

    :cond_9d
    const/4 v7, 0x0

    :goto_9e
    if-eqz v7, :cond_be

    .line 16
    iget v10, v0, Lb/f/b/k/n/m;->f:I

    if-nez v10, :cond_af

    iget-object v10, v2, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v10, v10, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    iget-object v10, v10, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget-boolean v10, v10, Lb/f/b/k/n/f;->j:Z

    if-nez v10, :cond_af

    return-void

    .line 17
    :cond_af
    iget v10, v0, Lb/f/b/k/n/m;->f:I

    if-ne v10, v12, :cond_d2

    iget-object v10, v2, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v10, v10, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v10, v10, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget-boolean v10, v10, Lb/f/b/k/n/f;->j:Z

    if-nez v10, :cond_d2

    return-void

    .line 18
    :cond_be
    iget v10, v2, Lb/f/b/k/n/m;->a:I

    if-ne v10, v12, :cond_cb

    if-nez v9, :cond_cb

    .line 19
    iget-object v7, v2, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget v11, v7, Lb/f/b/k/n/g;->m:I

    add-int/lit8 v15, v15, 0x1

    goto :goto_d1

    .line 20
    :cond_cb
    iget-object v10, v2, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget-boolean v10, v10, Lb/f/b/k/n/f;->j:Z

    if-eqz v10, :cond_d2

    :goto_d1
    const/4 v7, 0x1

    :cond_d2
    if-nez v7, :cond_e6

    add-int/lit8 v15, v15, 0x1

    .line 21
    iget-object v7, v2, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v7, v7, Lb/f/b/k/e;->x0:[F

    iget v10, v0, Lb/f/b/k/n/m;->f:I

    aget v7, v7, v10

    const/4 v10, 0x0

    cmpl-float v11, v7, v10

    if-ltz v11, :cond_e7

    add-float v17, v17, v7

    goto :goto_e7

    :cond_e6
    add-int/2addr v14, v11

    :cond_e7
    :goto_e7
    if-ge v13, v8, :cond_f1

    if-ge v13, v6, :cond_f1

    .line 22
    iget-object v2, v2, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget v2, v2, Lb/f/b/k/n/f;->f:I

    neg-int v2, v2

    add-int/2addr v14, v2

    :cond_f1
    :goto_f1
    add-int/lit8 v13, v13, 0x1

    const/16 v7, 0x8

    const/4 v11, 0x2

    goto/16 :goto_72

    :cond_f8
    if-lt v14, v3, :cond_103

    if-nez v15, :cond_fd

    goto :goto_103

    :cond_fd
    add-int/lit8 v9, v9, 0x1

    const/16 v7, 0x8

    goto/16 :goto_67

    :cond_103
    :goto_103
    move/from16 v2, v16

    goto :goto_10b

    :cond_106
    const/4 v2, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v17, 0x0

    .line 23
    :goto_10b
    iget-object v7, v0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget v7, v7, Lb/f/b/k/n/f;->g:I

    if-eqz v1, :cond_115

    .line 24
    iget-object v7, v0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget v7, v7, Lb/f/b/k/n/f;->g:I

    :cond_115
    const/high16 v9, 0x3f000000    # 0.5f

    if-le v14, v3, :cond_12c

    const/high16 v10, 0x40000000    # 2.0f

    if-eqz v1, :cond_125

    sub-int v11, v14, v3

    int-to-float v11, v11

    div-float/2addr v11, v10

    add-float/2addr v11, v9

    float-to-int v10, v11

    add-int/2addr v7, v10

    goto :goto_12c

    :cond_125
    sub-int v11, v14, v3

    int-to-float v11, v11

    div-float/2addr v11, v10

    add-float/2addr v11, v9

    float-to-int v10, v11

    sub-int/2addr v7, v10

    :cond_12c
    :goto_12c
    if-lez v15, :cond_231

    sub-int v10, v3, v14

    int-to-float v10, v10

    int-to-float v11, v15

    div-float v11, v10, v11

    add-float/2addr v11, v9

    float-to-int v11, v11

    const/4 v13, 0x0

    const/16 v16, 0x0

    :goto_139
    if-ge v13, v4, :cond_1e6

    .line 25
    iget-object v12, v0, Lb/f/b/k/n/c;->k:Ljava/util/ArrayList;

    invoke-virtual {v12, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lb/f/b/k/n/m;

    .line 26
    iget-object v9, v12, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    invoke-virtual {v9}, Lb/f/b/k/e;->z()I

    move-result v9

    move/from16 v18, v11

    const/16 v11, 0x8

    if-ne v9, v11, :cond_151

    goto/16 :goto_1d1

    .line 27
    :cond_151
    iget-object v9, v12, Lb/f/b/k/n/m;->d:Lb/f/b/k/e$b;

    sget-object v11, Lb/f/b/k/e$b;->MATCH_CONSTRAINT:Lb/f/b/k/e$b;

    if-ne v9, v11, :cond_1d1

    iget-object v9, v12, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget-boolean v9, v9, Lb/f/b/k/n/f;->j:Z

    if-nez v9, :cond_1d1

    const/4 v9, 0x0

    cmpl-float v11, v17, v9

    if-lez v11, :cond_173

    .line 28
    iget-object v11, v12, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v11, v11, Lb/f/b/k/e;->x0:[F

    iget v9, v0, Lb/f/b/k/n/m;->f:I

    aget v9, v11, v9

    mul-float v9, v9, v10

    div-float v9, v9, v17

    const/high16 v11, 0x3f000000    # 0.5f

    add-float/2addr v9, v11

    float-to-int v9, v9

    goto :goto_175

    :cond_173
    move/from16 v9, v18

    .line 29
    :goto_175
    iget v11, v0, Lb/f/b/k/n/m;->f:I

    if-nez v11, :cond_1a1

    .line 30
    iget-object v11, v12, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    move/from16 v19, v10

    iget v10, v11, Lb/f/b/k/e;->n:I

    .line 31
    iget v11, v11, Lb/f/b/k/e;->m:I

    move/from16 v20, v14

    .line 32
    iget v14, v12, Lb/f/b/k/n/m;->a:I

    move/from16 v21, v7

    const/4 v7, 0x1

    if-ne v14, v7, :cond_193

    .line 33
    iget-object v7, v12, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget v7, v7, Lb/f/b/k/n/g;->m:I

    invoke-static {v9, v7}, Ljava/lang/Math;->min(II)I

    move-result v7

    goto :goto_194

    :cond_193
    move v7, v9

    .line 34
    :goto_194
    invoke-static {v11, v7}, Ljava/lang/Math;->max(II)I

    move-result v7

    if-lez v10, :cond_19e

    .line 35
    invoke-static {v10, v7}, Ljava/lang/Math;->min(II)I

    move-result v7

    :cond_19e
    if-eq v7, v9, :cond_1cb

    goto :goto_1c8

    :cond_1a1
    move/from16 v21, v7

    move/from16 v19, v10

    move/from16 v20, v14

    .line 36
    iget-object v7, v12, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget v10, v7, Lb/f/b/k/e;->q:I

    .line 37
    iget v7, v7, Lb/f/b/k/e;->p:I

    .line 38
    iget v11, v12, Lb/f/b/k/n/m;->a:I

    const/4 v14, 0x1

    if-ne v11, v14, :cond_1bb

    .line 39
    iget-object v11, v12, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget v11, v11, Lb/f/b/k/n/g;->m:I

    invoke-static {v9, v11}, Ljava/lang/Math;->min(II)I

    move-result v11

    goto :goto_1bc

    :cond_1bb
    move v11, v9

    .line 40
    :goto_1bc
    invoke-static {v7, v11}, Ljava/lang/Math;->max(II)I

    move-result v7

    if-lez v10, :cond_1c6

    .line 41
    invoke-static {v10, v7}, Ljava/lang/Math;->min(II)I

    move-result v7

    :cond_1c6
    if-eq v7, v9, :cond_1cb

    :goto_1c8
    add-int/lit8 v16, v16, 0x1

    move v9, v7

    .line 42
    :cond_1cb
    iget-object v7, v12, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-virtual {v7, v9}, Lb/f/b/k/n/g;->a(I)V

    goto :goto_1d7

    :cond_1d1
    :goto_1d1
    move/from16 v21, v7

    move/from16 v19, v10

    move/from16 v20, v14

    :goto_1d7
    add-int/lit8 v13, v13, 0x1

    move/from16 v11, v18

    move/from16 v10, v19

    move/from16 v14, v20

    move/from16 v7, v21

    const/high16 v9, 0x3f000000    # 0.5f

    const/4 v12, 0x1

    goto/16 :goto_139

    :cond_1e6
    move/from16 v21, v7

    move/from16 v20, v14

    if-lez v16, :cond_222

    sub-int v15, v15, v16

    const/4 v7, 0x0

    const/4 v9, 0x0

    :goto_1f0
    if-ge v7, v4, :cond_220

    .line 43
    iget-object v10, v0, Lb/f/b/k/n/c;->k:Ljava/util/ArrayList;

    invoke-virtual {v10, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lb/f/b/k/n/m;

    .line 44
    iget-object v11, v10, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    invoke-virtual {v11}, Lb/f/b/k/e;->z()I

    move-result v11

    const/16 v12, 0x8

    if-ne v11, v12, :cond_205

    goto :goto_21d

    :cond_205
    if-lez v7, :cond_20e

    if-lt v7, v5, :cond_20e

    .line 45
    iget-object v11, v10, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget v11, v11, Lb/f/b/k/n/f;->f:I

    add-int/2addr v9, v11

    .line 46
    :cond_20e
    iget-object v11, v10, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget v11, v11, Lb/f/b/k/n/f;->g:I

    add-int/2addr v9, v11

    if-ge v7, v8, :cond_21d

    if-ge v7, v6, :cond_21d

    .line 47
    iget-object v10, v10, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget v10, v10, Lb/f/b/k/n/f;->f:I

    neg-int v10, v10

    add-int/2addr v9, v10

    :cond_21d
    :goto_21d
    add-int/lit8 v7, v7, 0x1

    goto :goto_1f0

    :cond_220
    move v14, v9

    goto :goto_224

    :cond_222
    move/from16 v14, v20

    .line 48
    :goto_224
    iget v7, v0, Lb/f/b/k/n/c;->l:I

    const/4 v9, 0x2

    if-ne v7, v9, :cond_22f

    if-nez v16, :cond_22f

    const/4 v7, 0x0

    .line 49
    iput v7, v0, Lb/f/b/k/n/c;->l:I

    goto :goto_237

    :cond_22f
    const/4 v7, 0x0

    goto :goto_237

    :cond_231
    move/from16 v21, v7

    move/from16 v20, v14

    const/4 v7, 0x0

    const/4 v9, 0x2

    :goto_237
    if-le v14, v3, :cond_23b

    .line 50
    iput v9, v0, Lb/f/b/k/n/c;->l:I

    :cond_23b
    if-lez v2, :cond_243

    if-nez v15, :cond_243

    if-ne v5, v6, :cond_243

    .line 51
    iput v9, v0, Lb/f/b/k/n/c;->l:I

    .line 52
    :cond_243
    iget v9, v0, Lb/f/b/k/n/c;->l:I

    const/4 v10, 0x1

    if-ne v9, v10, :cond_2e4

    if-le v2, v10, :cond_24e

    sub-int/2addr v3, v14

    sub-int/2addr v2, v10

    .line 53
    div-int/2addr v3, v2

    goto :goto_255

    :cond_24e
    if-ne v2, v10, :cond_254

    sub-int/2addr v3, v14

    const/4 v2, 0x2

    .line 54
    div-int/2addr v3, v2

    goto :goto_255

    :cond_254
    const/4 v3, 0x0

    :goto_255
    if-lez v15, :cond_258

    const/4 v3, 0x0

    :cond_258
    move/from16 v7, v21

    const/4 v2, 0x0

    :goto_25b
    if-ge v2, v4, :cond_42a

    if-eqz v1, :cond_264

    add-int/lit8 v9, v2, 0x1

    sub-int v9, v4, v9

    goto :goto_265

    :cond_264
    move v9, v2

    .line 55
    :goto_265
    iget-object v10, v0, Lb/f/b/k/n/c;->k:Ljava/util/ArrayList;

    invoke-virtual {v10, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lb/f/b/k/n/m;

    .line 56
    iget-object v10, v9, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    invoke-virtual {v10}, Lb/f/b/k/e;->z()I

    move-result v10

    const/16 v11, 0x8

    if-ne v10, v11, :cond_282

    .line 57
    iget-object v10, v9, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    invoke-virtual {v10, v7}, Lb/f/b/k/n/f;->a(I)V

    .line 58
    iget-object v9, v9, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    invoke-virtual {v9, v7}, Lb/f/b/k/n/f;->a(I)V

    goto :goto_2e0

    :cond_282
    if-lez v2, :cond_289

    if-eqz v1, :cond_288

    sub-int/2addr v7, v3

    goto :goto_289

    :cond_288
    add-int/2addr v7, v3

    :cond_289
    :goto_289
    if-lez v2, :cond_29a

    if-lt v2, v5, :cond_29a

    if-eqz v1, :cond_295

    .line 59
    iget-object v10, v9, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget v10, v10, Lb/f/b/k/n/f;->f:I

    sub-int/2addr v7, v10

    goto :goto_29a

    .line 60
    :cond_295
    iget-object v10, v9, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget v10, v10, Lb/f/b/k/n/f;->f:I

    add-int/2addr v7, v10

    :cond_29a
    :goto_29a
    if-eqz v1, :cond_2a2

    .line 61
    iget-object v10, v9, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    invoke-virtual {v10, v7}, Lb/f/b/k/n/f;->a(I)V

    goto :goto_2a7

    .line 62
    :cond_2a2
    iget-object v10, v9, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    invoke-virtual {v10, v7}, Lb/f/b/k/n/f;->a(I)V

    .line 63
    :goto_2a7
    iget-object v10, v9, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget v11, v10, Lb/f/b/k/n/f;->g:I

    .line 64
    iget-object v12, v9, Lb/f/b/k/n/m;->d:Lb/f/b/k/e$b;

    sget-object v13, Lb/f/b/k/e$b;->MATCH_CONSTRAINT:Lb/f/b/k/e$b;

    if-ne v12, v13, :cond_2b8

    iget v12, v9, Lb/f/b/k/n/m;->a:I

    const/4 v13, 0x1

    if-ne v12, v13, :cond_2b8

    .line 65
    iget v11, v10, Lb/f/b/k/n/g;->m:I

    :cond_2b8
    if-eqz v1, :cond_2bc

    sub-int/2addr v7, v11

    goto :goto_2bd

    :cond_2bc
    add-int/2addr v7, v11

    :goto_2bd
    if-eqz v1, :cond_2c5

    .line 66
    iget-object v10, v9, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    invoke-virtual {v10, v7}, Lb/f/b/k/n/f;->a(I)V

    goto :goto_2ca

    .line 67
    :cond_2c5
    iget-object v10, v9, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    invoke-virtual {v10, v7}, Lb/f/b/k/n/f;->a(I)V

    :goto_2ca
    const/4 v10, 0x1

    .line 68
    iput-boolean v10, v9, Lb/f/b/k/n/m;->g:Z

    if-ge v2, v8, :cond_2e0

    if-ge v2, v6, :cond_2e0

    if-eqz v1, :cond_2da

    .line 69
    iget-object v9, v9, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget v9, v9, Lb/f/b/k/n/f;->f:I

    neg-int v9, v9

    sub-int/2addr v7, v9

    goto :goto_2e0

    .line 70
    :cond_2da
    iget-object v9, v9, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget v9, v9, Lb/f/b/k/n/f;->f:I

    neg-int v9, v9

    add-int/2addr v7, v9

    :cond_2e0
    :goto_2e0
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_25b

    :cond_2e4
    if-nez v9, :cond_378

    sub-int/2addr v3, v14

    const/4 v9, 0x1

    add-int/2addr v2, v9

    .line 71
    div-int/2addr v3, v2

    if-lez v15, :cond_2ed

    const/4 v3, 0x0

    :cond_2ed
    move/from16 v7, v21

    const/4 v2, 0x0

    :goto_2f0
    if-ge v2, v4, :cond_42a

    if-eqz v1, :cond_2f9

    add-int/lit8 v9, v2, 0x1

    sub-int v9, v4, v9

    goto :goto_2fa

    :cond_2f9
    move v9, v2

    .line 72
    :goto_2fa
    iget-object v10, v0, Lb/f/b/k/n/c;->k:Ljava/util/ArrayList;

    invoke-virtual {v10, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lb/f/b/k/n/m;

    .line 73
    iget-object v10, v9, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    invoke-virtual {v10}, Lb/f/b/k/e;->z()I

    move-result v10

    const/16 v11, 0x8

    if-ne v10, v11, :cond_317

    .line 74
    iget-object v10, v9, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    invoke-virtual {v10, v7}, Lb/f/b/k/n/f;->a(I)V

    .line 75
    iget-object v9, v9, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    invoke-virtual {v9, v7}, Lb/f/b/k/n/f;->a(I)V

    goto :goto_374

    :cond_317
    if-eqz v1, :cond_31b

    sub-int/2addr v7, v3

    goto :goto_31c

    :cond_31b
    add-int/2addr v7, v3

    :goto_31c
    if-lez v2, :cond_32d

    if-lt v2, v5, :cond_32d

    if-eqz v1, :cond_328

    .line 76
    iget-object v10, v9, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget v10, v10, Lb/f/b/k/n/f;->f:I

    sub-int/2addr v7, v10

    goto :goto_32d

    .line 77
    :cond_328
    iget-object v10, v9, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget v10, v10, Lb/f/b/k/n/f;->f:I

    add-int/2addr v7, v10

    :cond_32d
    :goto_32d
    if-eqz v1, :cond_335

    .line 78
    iget-object v10, v9, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    invoke-virtual {v10, v7}, Lb/f/b/k/n/f;->a(I)V

    goto :goto_33a

    .line 79
    :cond_335
    iget-object v10, v9, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    invoke-virtual {v10, v7}, Lb/f/b/k/n/f;->a(I)V

    .line 80
    :goto_33a
    iget-object v10, v9, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget v11, v10, Lb/f/b/k/n/f;->g:I

    .line 81
    iget-object v12, v9, Lb/f/b/k/n/m;->d:Lb/f/b/k/e$b;

    sget-object v13, Lb/f/b/k/e$b;->MATCH_CONSTRAINT:Lb/f/b/k/e$b;

    if-ne v12, v13, :cond_34f

    iget v12, v9, Lb/f/b/k/n/m;->a:I

    const/4 v13, 0x1

    if-ne v12, v13, :cond_34f

    .line 82
    iget v10, v10, Lb/f/b/k/n/g;->m:I

    invoke-static {v11, v10}, Ljava/lang/Math;->min(II)I

    move-result v11

    :cond_34f
    if-eqz v1, :cond_353

    sub-int/2addr v7, v11

    goto :goto_354

    :cond_353
    add-int/2addr v7, v11

    :goto_354
    if-eqz v1, :cond_35c

    .line 83
    iget-object v10, v9, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    invoke-virtual {v10, v7}, Lb/f/b/k/n/f;->a(I)V

    goto :goto_361

    .line 84
    :cond_35c
    iget-object v10, v9, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    invoke-virtual {v10, v7}, Lb/f/b/k/n/f;->a(I)V

    :goto_361
    if-ge v2, v8, :cond_374

    if-ge v2, v6, :cond_374

    if-eqz v1, :cond_36e

    .line 85
    iget-object v9, v9, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget v9, v9, Lb/f/b/k/n/f;->f:I

    neg-int v9, v9

    sub-int/2addr v7, v9

    goto :goto_374

    .line 86
    :cond_36e
    iget-object v9, v9, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget v9, v9, Lb/f/b/k/n/f;->f:I

    neg-int v9, v9

    add-int/2addr v7, v9

    :cond_374
    :goto_374
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_2f0

    :cond_378
    const/4 v2, 0x2

    if-ne v9, v2, :cond_42a

    .line 87
    iget v2, v0, Lb/f/b/k/n/m;->f:I

    if-nez v2, :cond_386

    iget-object v2, v0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    invoke-virtual {v2}, Lb/f/b/k/e;->l()F

    move-result v2

    goto :goto_38c

    :cond_386
    iget-object v2, v0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    .line 88
    invoke-virtual {v2}, Lb/f/b/k/e;->v()F

    move-result v2

    :goto_38c
    if-eqz v1, :cond_392

    const/high16 v9, 0x3f800000    # 1.0f

    sub-float v2, v9, v2

    :cond_392
    sub-int/2addr v3, v14

    int-to-float v3, v3

    mul-float v3, v3, v2

    const/high16 v2, 0x3f000000    # 0.5f

    add-float/2addr v3, v2

    float-to-int v2, v3

    if-ltz v2, :cond_39e

    if-lez v15, :cond_39f

    :cond_39e
    const/4 v2, 0x0

    :cond_39f
    if-eqz v1, :cond_3a4

    sub-int v2, v21, v2

    goto :goto_3a6

    :cond_3a4
    add-int v2, v21, v2

    :goto_3a6
    move v3, v2

    const/4 v2, 0x0

    :goto_3a8
    if-ge v2, v4, :cond_42a

    if-eqz v1, :cond_3b1

    add-int/lit8 v7, v2, 0x1

    sub-int v7, v4, v7

    goto :goto_3b2

    :cond_3b1
    move v7, v2

    .line 89
    :goto_3b2
    iget-object v9, v0, Lb/f/b/k/n/c;->k:Ljava/util/ArrayList;

    invoke-virtual {v9, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lb/f/b/k/n/m;

    .line 90
    iget-object v9, v7, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    invoke-virtual {v9}, Lb/f/b/k/e;->z()I

    move-result v9

    const/16 v10, 0x8

    if-ne v9, v10, :cond_3d0

    .line 91
    iget-object v9, v7, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    invoke-virtual {v9, v3}, Lb/f/b/k/n/f;->a(I)V

    .line 92
    iget-object v7, v7, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    invoke-virtual {v7, v3}, Lb/f/b/k/n/f;->a(I)V

    const/4 v13, 0x1

    goto :goto_426

    :cond_3d0
    if-lez v2, :cond_3e1

    if-lt v2, v5, :cond_3e1

    if-eqz v1, :cond_3dc

    .line 93
    iget-object v9, v7, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget v9, v9, Lb/f/b/k/n/f;->f:I

    sub-int/2addr v3, v9

    goto :goto_3e1

    .line 94
    :cond_3dc
    iget-object v9, v7, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget v9, v9, Lb/f/b/k/n/f;->f:I

    add-int/2addr v3, v9

    :cond_3e1
    :goto_3e1
    if-eqz v1, :cond_3e9

    .line 95
    iget-object v9, v7, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    invoke-virtual {v9, v3}, Lb/f/b/k/n/f;->a(I)V

    goto :goto_3ee

    .line 96
    :cond_3e9
    iget-object v9, v7, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    invoke-virtual {v9, v3}, Lb/f/b/k/n/f;->a(I)V

    .line 97
    :goto_3ee
    iget-object v9, v7, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget v11, v9, Lb/f/b/k/n/f;->g:I

    .line 98
    iget-object v12, v7, Lb/f/b/k/n/m;->d:Lb/f/b/k/e$b;

    sget-object v13, Lb/f/b/k/e$b;->MATCH_CONSTRAINT:Lb/f/b/k/e$b;

    if-ne v12, v13, :cond_400

    iget v12, v7, Lb/f/b/k/n/m;->a:I

    const/4 v13, 0x1

    if-ne v12, v13, :cond_401

    .line 99
    iget v11, v9, Lb/f/b/k/n/g;->m:I

    goto :goto_401

    :cond_400
    const/4 v13, 0x1

    :cond_401
    :goto_401
    if-eqz v1, :cond_405

    sub-int/2addr v3, v11

    goto :goto_406

    :cond_405
    add-int/2addr v3, v11

    :goto_406
    if-eqz v1, :cond_40e

    .line 100
    iget-object v9, v7, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    invoke-virtual {v9, v3}, Lb/f/b/k/n/f;->a(I)V

    goto :goto_413

    .line 101
    :cond_40e
    iget-object v9, v7, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    invoke-virtual {v9, v3}, Lb/f/b/k/n/f;->a(I)V

    :goto_413
    if-ge v2, v8, :cond_426

    if-ge v2, v6, :cond_426

    if-eqz v1, :cond_420

    .line 102
    iget-object v7, v7, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget v7, v7, Lb/f/b/k/n/f;->f:I

    neg-int v7, v7

    sub-int/2addr v3, v7

    goto :goto_426

    .line 103
    :cond_420
    iget-object v7, v7, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget v7, v7, Lb/f/b/k/n/f;->f:I

    neg-int v7, v7

    add-int/2addr v3, v7

    :cond_426
    :goto_426
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_3a8

    :cond_42a
    :goto_42a
    return-void
.end method

.method public b()V
    .registers 3

    const/4 v0, 0x0

    .line 1
    :goto_1
    iget-object v1, p0, Lb/f/b/k/n/c;->k:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_17

    .line 2
    iget-object v1, p0, Lb/f/b/k/n/c;->k:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/f/b/k/n/m;

    .line 3
    invoke-virtual {v1}, Lb/f/b/k/n/m;->b()V

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_17
    return-void
.end method

.method public c()V
    .registers 3

    const/4 v0, 0x0

    .line 1
    iput-object v0, p0, Lb/f/b/k/n/m;->c:Lb/f/b/k/n/k;

    .line 2
    iget-object v0, p0, Lb/f/b/k/n/c;->k:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_9
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_19

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/f/b/k/n/m;

    .line 3
    invoke-virtual {v1}, Lb/f/b/k/n/m;->c()V

    goto :goto_9

    :cond_19
    return-void
.end method

.method public d()J
    .registers 8

    .line 1
    iget-object v0, p0, Lb/f/b/k/n/c;->k:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const-wide/16 v1, 0x0

    const/4 v3, 0x0

    :goto_9
    if-ge v3, v0, :cond_27

    .line 2
    iget-object v4, p0, Lb/f/b/k/n/c;->k:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lb/f/b/k/n/m;

    .line 3
    iget-object v5, v4, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget v5, v5, Lb/f/b/k/n/f;->f:I

    int-to-long v5, v5

    add-long/2addr v1, v5

    .line 4
    invoke-virtual {v4}, Lb/f/b/k/n/m;->d()J

    move-result-wide v5

    add-long/2addr v1, v5

    .line 5
    iget-object v4, v4, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget v4, v4, Lb/f/b/k/n/f;->f:I

    int-to-long v4, v4

    add-long/2addr v1, v4

    add-int/lit8 v3, v3, 0x1

    goto :goto_9

    :cond_27
    return-wide v1
.end method

.method public f()Z
    .registers 5

    .line 1
    iget-object v0, p0, Lb/f/b/k/n/c;->k:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_8
    if-ge v2, v0, :cond_1c

    .line 2
    iget-object v3, p0, Lb/f/b/k/n/c;->k:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lb/f/b/k/n/m;

    .line 3
    invoke-virtual {v3}, Lb/f/b/k/n/m;->f()Z

    move-result v3

    if-nez v3, :cond_19

    return v1

    :cond_19
    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    :cond_1c
    const/4 v0, 0x1

    return v0
.end method

.method public final g()V
    .registers 6

    .line 1
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    .line 2
    iget v1, p0, Lb/f/b/k/n/m;->f:I

    invoke-virtual {v0, v1}, Lb/f/b/k/e;->e(I)Lb/f/b/k/e;

    move-result-object v1

    :goto_8
    move-object v4, v1

    move-object v1, v0

    move-object v0, v4

    if-eqz v0, :cond_14

    .line 3
    iget v1, p0, Lb/f/b/k/n/m;->f:I

    invoke-virtual {v0, v1}, Lb/f/b/k/e;->e(I)Lb/f/b/k/e;

    move-result-object v1

    goto :goto_8

    .line 4
    :cond_14
    iput-object v1, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    .line 5
    iget-object v0, p0, Lb/f/b/k/n/c;->k:Ljava/util/ArrayList;

    iget v2, p0, Lb/f/b/k/n/m;->f:I

    invoke-virtual {v1, v2}, Lb/f/b/k/e;->f(I)Lb/f/b/k/n/m;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 6
    iget v0, p0, Lb/f/b/k/n/m;->f:I

    invoke-virtual {v1, v0}, Lb/f/b/k/e;->d(I)Lb/f/b/k/e;

    move-result-object v0

    :goto_27
    if-eqz v0, :cond_3b

    .line 7
    iget-object v1, p0, Lb/f/b/k/n/c;->k:Ljava/util/ArrayList;

    iget v2, p0, Lb/f/b/k/n/m;->f:I

    invoke-virtual {v0, v2}, Lb/f/b/k/e;->f(I)Lb/f/b/k/n/m;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 8
    iget v1, p0, Lb/f/b/k/n/m;->f:I

    invoke-virtual {v0, v1}, Lb/f/b/k/e;->d(I)Lb/f/b/k/e;

    move-result-object v0

    goto :goto_27

    .line 9
    :cond_3b
    iget-object v0, p0, Lb/f/b/k/n/c;->k:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_41
    :goto_41
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_5e

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/f/b/k/n/m;

    .line 10
    iget v3, p0, Lb/f/b/k/n/m;->f:I

    if-nez v3, :cond_57

    .line 11
    iget-object v1, v1, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iput-object p0, v1, Lb/f/b/k/e;->b:Lb/f/b/k/n/c;

    goto :goto_41

    :cond_57
    if-ne v3, v2, :cond_41

    .line 12
    iget-object v1, v1, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iput-object p0, v1, Lb/f/b/k/e;->c:Lb/f/b/k/n/c;

    goto :goto_41

    .line 13
    :cond_5e
    iget v0, p0, Lb/f/b/k/n/m;->f:I

    if-nez v0, :cond_72

    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    invoke-virtual {v0}, Lb/f/b/k/e;->t()Lb/f/b/k/e;

    move-result-object v0

    check-cast v0, Lb/f/b/k/f;

    invoke-virtual {v0}, Lb/f/b/k/f;->S()Z

    move-result v0

    if-eqz v0, :cond_72

    const/4 v0, 0x1

    goto :goto_73

    :cond_72
    const/4 v0, 0x0

    :goto_73
    if-eqz v0, :cond_8e

    .line 14
    iget-object v0, p0, Lb/f/b/k/n/c;->k:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-le v0, v2, :cond_8e

    .line 15
    iget-object v0, p0, Lb/f/b/k/n/c;->k:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    sub-int/2addr v1, v2

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb/f/b/k/n/m;

    iget-object v0, v0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iput-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    .line 16
    :cond_8e
    iget v0, p0, Lb/f/b/k/n/m;->f:I

    if-nez v0, :cond_99

    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    invoke-virtual {v0}, Lb/f/b/k/e;->m()I

    move-result v0

    goto :goto_9f

    :cond_99
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    invoke-virtual {v0}, Lb/f/b/k/e;->w()I

    move-result v0

    :goto_9f
    iput v0, p0, Lb/f/b/k/n/c;->l:I

    return-void
.end method

.method public final h()Lb/f/b/k/e;
    .registers 5

    const/4 v0, 0x0

    .line 1
    :goto_1
    iget-object v1, p0, Lb/f/b/k/n/c;->k:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_21

    .line 2
    iget-object v1, p0, Lb/f/b/k/n/c;->k:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/f/b/k/n/m;

    .line 3
    iget-object v2, v1, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    invoke-virtual {v2}, Lb/f/b/k/e;->z()I

    move-result v2

    const/16 v3, 0x8

    if-eq v2, v3, :cond_1e

    .line 4
    iget-object v0, v1, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    return-object v0

    :cond_1e
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_21
    const/4 v0, 0x0

    return-object v0
.end method

.method public final i()Lb/f/b/k/e;
    .registers 5

    .line 1
    iget-object v0, p0, Lb/f/b/k/n/c;->k:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_8
    if-ltz v0, :cond_22

    .line 2
    iget-object v1, p0, Lb/f/b/k/n/c;->k:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/f/b/k/n/m;

    .line 3
    iget-object v2, v1, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    invoke-virtual {v2}, Lb/f/b/k/e;->z()I

    move-result v2

    const/16 v3, 0x8

    if-eq v2, v3, :cond_1f

    .line 4
    iget-object v0, v1, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    return-object v0

    :cond_1f
    add-int/lit8 v0, v0, -0x1

    goto :goto_8

    :cond_22
    const/4 v0, 0x0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "ChainRun "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lb/f/b/k/n/m;->f:I

    if-nez v1, :cond_11

    const-string v1, "horizontal : "

    goto :goto_13

    :cond_11
    const-string v1, "vertical : "

    :goto_13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 2
    iget-object v1, p0, Lb/f/b/k/n/c;->k:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_20
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5e

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb/f/b/k/n/m;

    .line 3
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "<"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 4
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 5
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "> "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_20

    :cond_5e
    return-object v0
.end method
