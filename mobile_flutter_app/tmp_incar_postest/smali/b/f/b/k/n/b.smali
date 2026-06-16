.class public Lb/f/b/k/n/b;
.super Ljava/lang/Object;
.source "BasicMeasure.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lb/f/b/k/n/b$a;,
        Lb/f/b/k/n/b$b;
    }
.end annotation


# instance fields
.field public final a:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lb/f/b/k/e;",
            ">;"
        }
    .end annotation
.end field

.field public b:Lb/f/b/k/n/b$a;

.field public c:Lb/f/b/k/f;


# direct methods
.method public constructor <init>(Lb/f/b/k/f;)V
    .registers 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lb/f/b/k/n/b;->a:Ljava/util/ArrayList;

    .line 3
    new-instance v0, Lb/f/b/k/n/b$a;

    invoke-direct {v0}, Lb/f/b/k/n/b$a;-><init>()V

    iput-object v0, p0, Lb/f/b/k/n/b;->b:Lb/f/b/k/n/b$a;

    .line 4
    iput-object p1, p0, Lb/f/b/k/n/b;->c:Lb/f/b/k/f;

    return-void
.end method


# virtual methods
.method public a(Lb/f/b/k/f;IIIIIIIII)J
    .registers 33

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    move/from16 v3, p5

    move/from16 v4, p7

    .line 22
    invoke-virtual/range {p1 .. p1}, Lb/f/b/k/f;->M()Lb/f/b/k/n/b$b;

    move-result-object v5

    .line 23
    iget-object v6, v1, Lb/f/b/k/m;->D0:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    .line 24
    invoke-virtual/range {p1 .. p1}, Lb/f/b/k/e;->A()I

    move-result v7

    .line 25
    invoke-virtual/range {p1 .. p1}, Lb/f/b/k/e;->k()I

    move-result v8

    const/16 v9, 0x80

    .line 26
    invoke-static {v2, v9}, Lb/f/b/k/k;->a(II)Z

    move-result v9

    const/4 v10, 0x0

    if-nez v9, :cond_30

    const/16 v12, 0x40

    .line 27
    invoke-static {v2, v12}, Lb/f/b/k/k;->a(II)Z

    move-result v2

    if-eqz v2, :cond_2e

    goto :goto_30

    :cond_2e
    const/4 v2, 0x0

    goto :goto_31

    :cond_30
    :goto_30
    const/4 v2, 0x1

    :goto_31
    if-eqz v2, :cond_8c

    const/4 v12, 0x0

    :goto_34
    if-ge v12, v6, :cond_8c

    .line 28
    iget-object v13, v1, Lb/f/b/k/m;->D0:Ljava/util/ArrayList;

    invoke-virtual {v13, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lb/f/b/k/e;

    .line 29
    invoke-virtual {v13}, Lb/f/b/k/e;->n()Lb/f/b/k/e$b;

    move-result-object v14

    sget-object v15, Lb/f/b/k/e$b;->MATCH_CONSTRAINT:Lb/f/b/k/e$b;

    if-ne v14, v15, :cond_48

    const/4 v14, 0x1

    goto :goto_49

    :cond_48
    const/4 v14, 0x0

    .line 30
    :goto_49
    invoke-virtual {v13}, Lb/f/b/k/e;->x()Lb/f/b/k/e$b;

    move-result-object v15

    sget-object v11, Lb/f/b/k/e$b;->MATCH_CONSTRAINT:Lb/f/b/k/e$b;

    if-ne v15, v11, :cond_53

    const/4 v11, 0x1

    goto :goto_54

    :cond_53
    const/4 v11, 0x0

    :goto_54
    if-eqz v14, :cond_63

    if-eqz v11, :cond_63

    .line 31
    invoke-virtual {v13}, Lb/f/b/k/e;->i()F

    move-result v11

    const/4 v14, 0x0

    cmpl-float v11, v11, v14

    if-lez v11, :cond_63

    const/4 v11, 0x1

    goto :goto_64

    :cond_63
    const/4 v11, 0x0

    .line 32
    :goto_64
    invoke-virtual {v13}, Lb/f/b/k/e;->E()Z

    move-result v14

    if-eqz v14, :cond_6e

    if-eqz v11, :cond_6e

    :cond_6c
    :goto_6c
    const/4 v2, 0x0

    goto :goto_8c

    .line 33
    :cond_6e
    invoke-virtual {v13}, Lb/f/b/k/e;->G()Z

    move-result v14

    if-eqz v14, :cond_77

    if-eqz v11, :cond_77

    goto :goto_6c

    .line 34
    :cond_77
    instance-of v11, v13, Lb/f/b/k/l;

    if-eqz v11, :cond_7c

    goto :goto_6c

    .line 35
    :cond_7c
    invoke-virtual {v13}, Lb/f/b/k/e;->E()Z

    move-result v11

    if-nez v11, :cond_6c

    .line 36
    invoke-virtual {v13}, Lb/f/b/k/e;->G()Z

    move-result v11

    if-eqz v11, :cond_89

    goto :goto_6c

    :cond_89
    add-int/lit8 v12, v12, 0x1

    goto :goto_34

    :cond_8c
    :goto_8c
    const-wide/16 v11, 0x1

    if-eqz v2, :cond_99

    .line 37
    sget-object v13, Lb/f/b/d;->r:Lb/f/b/e;

    if-eqz v13, :cond_99

    .line 38
    iget-wide v14, v13, Lb/f/b/e;->c:J

    add-long/2addr v14, v11

    iput-wide v14, v13, Lb/f/b/e;->c:J

    :cond_99
    const/high16 v13, 0x40000000    # 2.0f

    if-ne v3, v13, :cond_9f

    if-eq v4, v13, :cond_a1

    :cond_9f
    if-eqz v9, :cond_a3

    :cond_a1
    const/4 v14, 0x1

    goto :goto_a4

    :cond_a3
    const/4 v14, 0x0

    :goto_a4
    and-int/2addr v2, v14

    const/4 v14, 0x2

    if-eqz v2, :cond_114

    .line 39
    invoke-virtual/range {p1 .. p1}, Lb/f/b/k/e;->q()I

    move-result v2

    move/from16 v15, p6

    invoke-static {v2, v15}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 40
    invoke-virtual/range {p1 .. p1}, Lb/f/b/k/e;->p()I

    move-result v15

    move/from16 v11, p8

    invoke-static {v15, v11}, Ljava/lang/Math;->min(II)I

    move-result v11

    if-ne v3, v13, :cond_ca

    .line 41
    invoke-virtual/range {p1 .. p1}, Lb/f/b/k/e;->A()I

    move-result v12

    if-eq v12, v2, :cond_ca

    .line 42
    invoke-virtual {v1, v2}, Lb/f/b/k/e;->q(I)V

    .line 43
    invoke-virtual/range {p1 .. p1}, Lb/f/b/k/f;->P()V

    :cond_ca
    if-ne v4, v13, :cond_d8

    .line 44
    invoke-virtual/range {p1 .. p1}, Lb/f/b/k/e;->k()I

    move-result v2

    if-eq v2, v11, :cond_d8

    .line 45
    invoke-virtual {v1, v11}, Lb/f/b/k/e;->i(I)V

    .line 46
    invoke-virtual/range {p1 .. p1}, Lb/f/b/k/f;->P()V

    :cond_d8
    if-ne v3, v13, :cond_e2

    if-ne v4, v13, :cond_e2

    .line 47
    invoke-virtual {v1, v9}, Lb/f/b/k/f;->d(Z)Z

    move-result v2

    const/4 v9, 0x2

    goto :goto_104

    .line 48
    :cond_e2
    invoke-virtual {v1, v9}, Lb/f/b/k/f;->e(Z)Z

    move-result v2

    if-ne v3, v13, :cond_f0

    .line 49
    invoke-virtual {v1, v9, v10}, Lb/f/b/k/f;->a(ZI)Z

    move-result v11

    and-int/2addr v2, v11

    move v11, v2

    const/4 v2, 0x1

    goto :goto_f2

    :cond_f0
    move v11, v2

    const/4 v2, 0x0

    :goto_f2
    if-ne v4, v13, :cond_102

    const/4 v12, 0x1

    .line 50
    invoke-virtual {v1, v9, v12}, Lb/f/b/k/f;->a(ZI)Z

    move-result v9

    and-int/2addr v9, v11

    add-int/lit8 v2, v2, 0x1

    move/from16 v21, v9

    move v9, v2

    move/from16 v2, v21

    goto :goto_104

    :cond_102
    move v9, v2

    move v2, v11

    :goto_104
    if-eqz v2, :cond_116

    if-ne v3, v13, :cond_10a

    const/4 v3, 0x1

    goto :goto_10b

    :cond_10a
    const/4 v3, 0x0

    :goto_10b
    if-ne v4, v13, :cond_10f

    const/4 v4, 0x1

    goto :goto_110

    :cond_10f
    const/4 v4, 0x0

    .line 51
    :goto_110
    invoke-virtual {v1, v3, v4}, Lb/f/b/k/f;->a(ZZ)V

    goto :goto_116

    :cond_114
    const/4 v2, 0x0

    const/4 v9, 0x0

    :cond_116
    :goto_116
    if-eqz v2, :cond_11a

    if-eq v9, v14, :cond_31d

    :cond_11a
    if-lez v6, :cond_11f

    .line 52
    invoke-virtual/range {p0 .. p1}, Lb/f/b/k/n/b;->a(Lb/f/b/k/f;)V

    .line 53
    :cond_11f
    invoke-virtual/range {p1 .. p1}, Lb/f/b/k/f;->N()I

    move-result v2

    .line 54
    iget-object v3, v0, Lb/f/b/k/n/b;->a:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lez v6, :cond_130

    const-string v4, "First pass"

    .line 55
    invoke-virtual {v0, v1, v4, v7, v8}, Lb/f/b/k/n/b;->a(Lb/f/b/k/f;Ljava/lang/String;II)V

    :cond_130
    if-lez v3, :cond_31a

    .line 56
    invoke-virtual/range {p1 .. p1}, Lb/f/b/k/e;->n()Lb/f/b/k/e$b;

    move-result-object v4

    sget-object v6, Lb/f/b/k/e$b;->WRAP_CONTENT:Lb/f/b/k/e$b;

    if-ne v4, v6, :cond_13c

    const/4 v12, 0x1

    goto :goto_13d

    :cond_13c
    const/4 v12, 0x0

    .line 57
    :goto_13d
    invoke-virtual/range {p1 .. p1}, Lb/f/b/k/e;->x()Lb/f/b/k/e$b;

    move-result-object v4

    sget-object v6, Lb/f/b/k/e$b;->WRAP_CONTENT:Lb/f/b/k/e$b;

    if-ne v4, v6, :cond_147

    const/4 v4, 0x1

    goto :goto_148

    :cond_147
    const/4 v4, 0x0

    .line 58
    :goto_148
    invoke-virtual/range {p1 .. p1}, Lb/f/b/k/e;->A()I

    move-result v6

    iget-object v9, v0, Lb/f/b/k/n/b;->c:Lb/f/b/k/f;

    invoke-virtual {v9}, Lb/f/b/k/e;->s()I

    move-result v9

    invoke-static {v6, v9}, Ljava/lang/Math;->max(II)I

    move-result v6

    .line 59
    invoke-virtual/range {p1 .. p1}, Lb/f/b/k/e;->k()I

    move-result v9

    iget-object v11, v0, Lb/f/b/k/n/b;->c:Lb/f/b/k/f;

    invoke-virtual {v11}, Lb/f/b/k/e;->r()I

    move-result v11

    invoke-static {v9, v11}, Ljava/lang/Math;->max(II)I

    move-result v9

    const/4 v11, 0x0

    const/4 v13, 0x0

    :goto_166
    if-ge v11, v3, :cond_1fd

    .line 60
    iget-object v15, v0, Lb/f/b/k/n/b;->a:Ljava/util/ArrayList;

    invoke-virtual {v15, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lb/f/b/k/e;

    .line 61
    instance-of v10, v15, Lb/f/b/k/l;

    if-nez v10, :cond_17c

    move/from16 p5, v2

    move/from16 v16, v7

    move/from16 v17, v8

    goto/16 :goto_1f1

    .line 62
    :cond_17c
    invoke-virtual {v15}, Lb/f/b/k/e;->A()I

    move-result v10

    .line 63
    invoke-virtual {v15}, Lb/f/b/k/e;->k()I

    move-result v14

    move/from16 p5, v2

    const/4 v2, 0x1

    .line 64
    invoke-virtual {v0, v5, v15, v2}, Lb/f/b/k/n/b;->a(Lb/f/b/k/n/b$b;Lb/f/b/k/e;Z)Z

    move-result v16

    or-int v2, v13, v16

    .line 65
    iget-object v13, v1, Lb/f/b/k/f;->I0:Lb/f/b/e;

    move/from16 v16, v7

    move/from16 v17, v8

    if-eqz v13, :cond_19d

    .line 66
    iget-wide v7, v13, Lb/f/b/e;->b:J

    const-wide/16 v18, 0x1

    add-long v7, v7, v18

    iput-wide v7, v13, Lb/f/b/e;->b:J

    .line 67
    :cond_19d
    invoke-virtual {v15}, Lb/f/b/k/e;->A()I

    move-result v7

    .line 68
    invoke-virtual {v15}, Lb/f/b/k/e;->k()I

    move-result v8

    if-eq v7, v10, :cond_1c7

    .line 69
    invoke-virtual {v15, v7}, Lb/f/b/k/e;->q(I)V

    if-eqz v12, :cond_1c6

    .line 70
    invoke-virtual {v15}, Lb/f/b/k/e;->u()I

    move-result v2

    if-le v2, v6, :cond_1c6

    .line 71
    invoke-virtual {v15}, Lb/f/b/k/e;->u()I

    move-result v2

    sget-object v7, Lb/f/b/k/d$b;->RIGHT:Lb/f/b/k/d$b;

    .line 72
    invoke-virtual {v15, v7}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object v7

    invoke-virtual {v7}, Lb/f/b/k/d;->a()I

    move-result v7

    add-int/2addr v2, v7

    .line 73
    invoke-static {v6, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    move v6, v2

    :cond_1c6
    const/4 v2, 0x1

    :cond_1c7
    if-eq v8, v14, :cond_1e9

    .line 74
    invoke-virtual {v15, v8}, Lb/f/b/k/e;->i(I)V

    if-eqz v4, :cond_1e8

    .line 75
    invoke-virtual {v15}, Lb/f/b/k/e;->f()I

    move-result v2

    if-le v2, v9, :cond_1e8

    .line 76
    invoke-virtual {v15}, Lb/f/b/k/e;->f()I

    move-result v2

    sget-object v7, Lb/f/b/k/d$b;->BOTTOM:Lb/f/b/k/d$b;

    .line 77
    invoke-virtual {v15, v7}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object v7

    invoke-virtual {v7}, Lb/f/b/k/d;->a()I

    move-result v7

    add-int/2addr v2, v7

    .line 78
    invoke-static {v9, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    move v9, v2

    :cond_1e8
    const/4 v2, 0x1

    .line 79
    :cond_1e9
    check-cast v15, Lb/f/b/k/l;

    .line 80
    invoke-virtual {v15}, Lb/f/b/k/l;->R()Z

    move-result v7

    or-int v13, v2, v7

    :goto_1f1
    add-int/lit8 v11, v11, 0x1

    move/from16 v2, p5

    move/from16 v7, v16

    move/from16 v8, v17

    const/4 v10, 0x0

    const/4 v14, 0x2

    goto/16 :goto_166

    :cond_1fd
    move/from16 p5, v2

    move/from16 v16, v7

    move/from16 v17, v8

    const/4 v2, 0x0

    const/4 v7, 0x2

    :goto_205
    if-ge v2, v7, :cond_2ee

    const/4 v8, 0x0

    :goto_208
    if-ge v8, v3, :cond_2cc

    .line 81
    iget-object v10, v0, Lb/f/b/k/n/b;->a:Ljava/util/ArrayList;

    invoke-virtual {v10, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lb/f/b/k/e;

    .line 82
    instance-of v11, v10, Lb/f/b/k/i;

    if-eqz v11, :cond_21a

    instance-of v11, v10, Lb/f/b/k/l;

    if-eqz v11, :cond_23d

    :cond_21a
    instance-of v11, v10, Lb/f/b/k/h;

    if-eqz v11, :cond_21f

    goto :goto_23d

    .line 83
    :cond_21f
    invoke-virtual {v10}, Lb/f/b/k/e;->z()I

    move-result v11

    const/16 v14, 0x8

    if-ne v11, v14, :cond_228

    goto :goto_23d

    .line 84
    :cond_228
    iget-object v11, v10, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    iget-object v11, v11, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget-boolean v11, v11, Lb/f/b/k/n/f;->j:Z

    if-eqz v11, :cond_239

    iget-object v11, v10, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v11, v11, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget-boolean v11, v11, Lb/f/b/k/n/f;->j:Z

    if-eqz v11, :cond_239

    goto :goto_23d

    .line 85
    :cond_239
    instance-of v11, v10, Lb/f/b/k/l;

    if-eqz v11, :cond_245

    :cond_23d
    :goto_23d
    move/from16 v18, v2

    move/from16 p6, v3

    const-wide/16 v19, 0x1

    goto/16 :goto_2c3

    .line 86
    :cond_245
    invoke-virtual {v10}, Lb/f/b/k/e;->A()I

    move-result v11

    .line 87
    invoke-virtual {v10}, Lb/f/b/k/e;->k()I

    move-result v14

    .line 88
    invoke-virtual {v10}, Lb/f/b/k/e;->e()I

    move-result v15

    const/4 v7, 0x1

    .line 89
    invoke-virtual {v0, v5, v10, v7}, Lb/f/b/k/n/b;->a(Lb/f/b/k/n/b$b;Lb/f/b/k/e;Z)Z

    move-result v18

    or-int v13, v13, v18

    .line 90
    iget-object v7, v1, Lb/f/b/k/f;->I0:Lb/f/b/e;

    move/from16 v18, v2

    move/from16 p6, v3

    if-eqz v7, :cond_269

    .line 91
    iget-wide v2, v7, Lb/f/b/e;->b:J

    const-wide/16 v19, 0x1

    add-long v2, v2, v19

    iput-wide v2, v7, Lb/f/b/e;->b:J

    goto :goto_26b

    :cond_269
    const-wide/16 v19, 0x1

    .line 92
    :goto_26b
    invoke-virtual {v10}, Lb/f/b/k/e;->A()I

    move-result v2

    .line 93
    invoke-virtual {v10}, Lb/f/b/k/e;->k()I

    move-result v3

    if-eq v2, v11, :cond_294

    .line 94
    invoke-virtual {v10, v2}, Lb/f/b/k/e;->q(I)V

    if-eqz v12, :cond_293

    .line 95
    invoke-virtual {v10}, Lb/f/b/k/e;->u()I

    move-result v2

    if-le v2, v6, :cond_293

    .line 96
    invoke-virtual {v10}, Lb/f/b/k/e;->u()I

    move-result v2

    sget-object v7, Lb/f/b/k/d$b;->RIGHT:Lb/f/b/k/d$b;

    .line 97
    invoke-virtual {v10, v7}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object v7

    invoke-virtual {v7}, Lb/f/b/k/d;->a()I

    move-result v7

    add-int/2addr v2, v7

    .line 98
    invoke-static {v6, v2}, Ljava/lang/Math;->max(II)I

    move-result v6

    :cond_293
    const/4 v13, 0x1

    :cond_294
    if-eq v3, v14, :cond_2b6

    .line 99
    invoke-virtual {v10, v3}, Lb/f/b/k/e;->i(I)V

    if-eqz v4, :cond_2b5

    .line 100
    invoke-virtual {v10}, Lb/f/b/k/e;->f()I

    move-result v2

    if-le v2, v9, :cond_2b5

    .line 101
    invoke-virtual {v10}, Lb/f/b/k/e;->f()I

    move-result v2

    sget-object v3, Lb/f/b/k/d$b;->BOTTOM:Lb/f/b/k/d$b;

    .line 102
    invoke-virtual {v10, v3}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object v3

    invoke-virtual {v3}, Lb/f/b/k/d;->a()I

    move-result v3

    add-int/2addr v2, v3

    .line 103
    invoke-static {v9, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    move v9, v2

    :cond_2b5
    const/4 v13, 0x1

    .line 104
    :cond_2b6
    invoke-virtual {v10}, Lb/f/b/k/e;->D()Z

    move-result v2

    if-eqz v2, :cond_2c3

    invoke-virtual {v10}, Lb/f/b/k/e;->e()I

    move-result v2

    if-eq v15, v2, :cond_2c3

    const/4 v13, 0x1

    :cond_2c3
    :goto_2c3
    add-int/lit8 v8, v8, 0x1

    move/from16 v3, p6

    move/from16 v2, v18

    const/4 v7, 0x2

    goto/16 :goto_208

    :cond_2cc
    move/from16 v18, v2

    move/from16 p6, v3

    const-wide/16 v19, 0x1

    if-eqz v13, :cond_2df

    const-string v2, "intermediate pass"

    move/from16 v3, v16

    move/from16 v7, v17

    .line 105
    invoke-virtual {v0, v1, v2, v3, v7}, Lb/f/b/k/n/b;->a(Lb/f/b/k/f;Ljava/lang/String;II)V

    const/4 v13, 0x0

    goto :goto_2e3

    :cond_2df
    move/from16 v3, v16

    move/from16 v7, v17

    :goto_2e3
    add-int/lit8 v2, v18, 0x1

    move/from16 v16, v3

    move/from16 v17, v7

    const/4 v7, 0x2

    move/from16 v3, p6

    goto/16 :goto_205

    :cond_2ee
    move/from16 v3, v16

    move/from16 v7, v17

    if-eqz v13, :cond_318

    const-string v2, "2nd pass"

    .line 106
    invoke-virtual {v0, v1, v2, v3, v7}, Lb/f/b/k/n/b;->a(Lb/f/b/k/f;Ljava/lang/String;II)V

    .line 107
    invoke-virtual/range {p1 .. p1}, Lb/f/b/k/e;->A()I

    move-result v2

    if-ge v2, v6, :cond_304

    .line 108
    invoke-virtual {v1, v6}, Lb/f/b/k/e;->q(I)V

    const/4 v10, 0x1

    goto :goto_305

    :cond_304
    const/4 v10, 0x0

    .line 109
    :goto_305
    invoke-virtual/range {p1 .. p1}, Lb/f/b/k/e;->k()I

    move-result v2

    if-ge v2, v9, :cond_310

    .line 110
    invoke-virtual {v1, v9}, Lb/f/b/k/e;->i(I)V

    const/4 v11, 0x1

    goto :goto_311

    :cond_310
    move v11, v10

    :goto_311
    if-eqz v11, :cond_318

    const-string v2, "3rd pass"

    .line 111
    invoke-virtual {v0, v1, v2, v3, v7}, Lb/f/b/k/n/b;->a(Lb/f/b/k/f;Ljava/lang/String;II)V

    :cond_318
    move/from16 v2, p5

    .line 112
    :cond_31a
    invoke-virtual {v1, v2}, Lb/f/b/k/f;->u(I)V

    :cond_31d
    const-wide/16 v1, 0x0

    return-wide v1
.end method

.method public final a(Lb/f/b/k/f;)V
    .registers 11

    .line 1
    iget-object v0, p1, Lb/f/b/k/m;->D0:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 2
    invoke-virtual {p1}, Lb/f/b/k/f;->M()Lb/f/b/k/n/b$b;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_c
    if-ge v3, v0, :cond_59

    .line 3
    iget-object v4, p1, Lb/f/b/k/m;->D0:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lb/f/b/k/e;

    .line 4
    instance-of v5, v4, Lb/f/b/k/h;

    if-eqz v5, :cond_1b

    goto :goto_56

    .line 5
    :cond_1b
    iget-object v5, v4, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    iget-object v5, v5, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget-boolean v5, v5, Lb/f/b/k/n/f;->j:Z

    if-eqz v5, :cond_2c

    iget-object v5, v4, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v5, v5, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget-boolean v5, v5, Lb/f/b/k/n/f;->j:Z

    if-eqz v5, :cond_2c

    goto :goto_56

    .line 6
    :cond_2c
    invoke-virtual {v4, v2}, Lb/f/b/k/e;->b(I)Lb/f/b/k/e$b;

    move-result-object v5

    const/4 v6, 0x1

    .line 7
    invoke-virtual {v4, v6}, Lb/f/b/k/e;->b(I)Lb/f/b/k/e$b;

    move-result-object v7

    .line 8
    sget-object v8, Lb/f/b/k/e$b;->MATCH_CONSTRAINT:Lb/f/b/k/e$b;

    if-ne v5, v8, :cond_44

    iget v5, v4, Lb/f/b/k/e;->j:I

    if-eq v5, v6, :cond_44

    if-ne v7, v8, :cond_44

    iget v5, v4, Lb/f/b/k/e;->k:I

    if-eq v5, v6, :cond_44

    goto :goto_45

    :cond_44
    const/4 v6, 0x0

    :goto_45
    if-eqz v6, :cond_48

    goto :goto_56

    .line 9
    :cond_48
    invoke-virtual {p0, v1, v4, v2}, Lb/f/b/k/n/b;->a(Lb/f/b/k/n/b$b;Lb/f/b/k/e;Z)Z

    .line 10
    iget-object v4, p1, Lb/f/b/k/f;->I0:Lb/f/b/e;

    if-eqz v4, :cond_56

    .line 11
    iget-wide v5, v4, Lb/f/b/e;->a:J

    const-wide/16 v7, 0x1

    add-long/2addr v5, v7

    iput-wide v5, v4, Lb/f/b/e;->a:J

    :cond_56
    :goto_56
    add-int/lit8 v3, v3, 0x1

    goto :goto_c

    .line 12
    :cond_59
    invoke-interface {v1}, Lb/f/b/k/n/b$b;->a()V

    return-void
.end method

.method public final a(Lb/f/b/k/f;Ljava/lang/String;II)V
    .registers 7

    .line 13
    invoke-virtual {p1}, Lb/f/b/k/e;->s()I

    move-result p2

    .line 14
    invoke-virtual {p1}, Lb/f/b/k/e;->r()I

    move-result v0

    const/4 v1, 0x0

    .line 15
    invoke-virtual {p1, v1}, Lb/f/b/k/e;->n(I)V

    .line 16
    invoke-virtual {p1, v1}, Lb/f/b/k/e;->m(I)V

    .line 17
    invoke-virtual {p1, p3}, Lb/f/b/k/e;->q(I)V

    .line 18
    invoke-virtual {p1, p4}, Lb/f/b/k/e;->i(I)V

    .line 19
    invoke-virtual {p1, p2}, Lb/f/b/k/e;->n(I)V

    .line 20
    invoke-virtual {p1, v0}, Lb/f/b/k/e;->m(I)V

    .line 21
    iget-object p1, p0, Lb/f/b/k/n/b;->c:Lb/f/b/k/f;

    invoke-virtual {p1}, Lb/f/b/k/f;->K()V

    return-void
.end method

.method public final a(Lb/f/b/k/n/b$b;Lb/f/b/k/e;Z)Z
    .registers 9

    .line 113
    iget-object v0, p0, Lb/f/b/k/n/b;->b:Lb/f/b/k/n/b$a;

    invoke-virtual {p2}, Lb/f/b/k/e;->n()Lb/f/b/k/e$b;

    move-result-object v1

    iput-object v1, v0, Lb/f/b/k/n/b$a;->a:Lb/f/b/k/e$b;

    .line 114
    iget-object v0, p0, Lb/f/b/k/n/b;->b:Lb/f/b/k/n/b$a;

    invoke-virtual {p2}, Lb/f/b/k/e;->x()Lb/f/b/k/e$b;

    move-result-object v1

    iput-object v1, v0, Lb/f/b/k/n/b$a;->b:Lb/f/b/k/e$b;

    .line 115
    iget-object v0, p0, Lb/f/b/k/n/b;->b:Lb/f/b/k/n/b$a;

    invoke-virtual {p2}, Lb/f/b/k/e;->A()I

    move-result v1

    iput v1, v0, Lb/f/b/k/n/b$a;->c:I

    .line 116
    iget-object v0, p0, Lb/f/b/k/n/b;->b:Lb/f/b/k/n/b$a;

    invoke-virtual {p2}, Lb/f/b/k/e;->k()I

    move-result v1

    iput v1, v0, Lb/f/b/k/n/b$a;->d:I

    .line 117
    iget-object v0, p0, Lb/f/b/k/n/b;->b:Lb/f/b/k/n/b$a;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lb/f/b/k/n/b$a;->i:Z

    .line 118
    iput-boolean p3, v0, Lb/f/b/k/n/b$a;->j:Z

    .line 119
    iget-object p3, v0, Lb/f/b/k/n/b$a;->a:Lb/f/b/k/e$b;

    sget-object v0, Lb/f/b/k/e$b;->MATCH_CONSTRAINT:Lb/f/b/k/e$b;

    const/4 v2, 0x1

    if-ne p3, v0, :cond_30

    const/4 p3, 0x1

    goto :goto_31

    :cond_30
    const/4 p3, 0x0

    .line 120
    :goto_31
    iget-object v0, p0, Lb/f/b/k/n/b;->b:Lb/f/b/k/n/b$a;

    iget-object v0, v0, Lb/f/b/k/n/b$a;->b:Lb/f/b/k/e$b;

    sget-object v3, Lb/f/b/k/e$b;->MATCH_CONSTRAINT:Lb/f/b/k/e$b;

    if-ne v0, v3, :cond_3b

    const/4 v0, 0x1

    goto :goto_3c

    :cond_3b
    const/4 v0, 0x0

    :goto_3c
    const/4 v3, 0x0

    if-eqz p3, :cond_47

    .line 121
    iget p3, p2, Lb/f/b/k/e;->P:F

    cmpl-float p3, p3, v3

    if-lez p3, :cond_47

    const/4 p3, 0x1

    goto :goto_48

    :cond_47
    const/4 p3, 0x0

    :goto_48
    if-eqz v0, :cond_52

    .line 122
    iget v0, p2, Lb/f/b/k/e;->P:F

    cmpl-float v0, v0, v3

    if-lez v0, :cond_52

    const/4 v0, 0x1

    goto :goto_53

    :cond_52
    const/4 v0, 0x0

    :goto_53
    const/4 v3, 0x4

    if-eqz p3, :cond_62

    .line 123
    iget-object p3, p2, Lb/f/b/k/e;->l:[I

    aget p3, p3, v1

    if-ne p3, v3, :cond_62

    .line 124
    iget-object p3, p0, Lb/f/b/k/n/b;->b:Lb/f/b/k/n/b$a;

    sget-object v4, Lb/f/b/k/e$b;->FIXED:Lb/f/b/k/e$b;

    iput-object v4, p3, Lb/f/b/k/n/b$a;->a:Lb/f/b/k/e$b;

    :cond_62
    if-eqz v0, :cond_70

    .line 125
    iget-object p3, p2, Lb/f/b/k/e;->l:[I

    aget p3, p3, v2

    if-ne p3, v3, :cond_70

    .line 126
    iget-object p3, p0, Lb/f/b/k/n/b;->b:Lb/f/b/k/n/b$a;

    sget-object v0, Lb/f/b/k/e$b;->FIXED:Lb/f/b/k/e$b;

    iput-object v0, p3, Lb/f/b/k/n/b$a;->b:Lb/f/b/k/e$b;

    .line 127
    :cond_70
    iget-object p3, p0, Lb/f/b/k/n/b;->b:Lb/f/b/k/n/b$a;

    invoke-interface {p1, p2, p3}, Lb/f/b/k/n/b$b;->a(Lb/f/b/k/e;Lb/f/b/k/n/b$a;)V

    .line 128
    iget-object p1, p0, Lb/f/b/k/n/b;->b:Lb/f/b/k/n/b$a;

    iget p1, p1, Lb/f/b/k/n/b$a;->e:I

    invoke-virtual {p2, p1}, Lb/f/b/k/e;->q(I)V

    .line 129
    iget-object p1, p0, Lb/f/b/k/n/b;->b:Lb/f/b/k/n/b$a;

    iget p1, p1, Lb/f/b/k/n/b$a;->f:I

    invoke-virtual {p2, p1}, Lb/f/b/k/e;->i(I)V

    .line 130
    iget-object p1, p0, Lb/f/b/k/n/b;->b:Lb/f/b/k/n/b$a;

    iget-boolean p1, p1, Lb/f/b/k/n/b$a;->h:Z

    invoke-virtual {p2, p1}, Lb/f/b/k/e;->a(Z)V

    .line 131
    iget-object p1, p0, Lb/f/b/k/n/b;->b:Lb/f/b/k/n/b$a;

    iget p1, p1, Lb/f/b/k/n/b$a;->g:I

    invoke-virtual {p2, p1}, Lb/f/b/k/e;->h(I)V

    .line 132
    iget-object p1, p0, Lb/f/b/k/n/b;->b:Lb/f/b/k/n/b$a;

    iput-boolean v1, p1, Lb/f/b/k/n/b$a;->j:Z

    .line 133
    iget-boolean p1, p1, Lb/f/b/k/n/b$a;->i:Z

    return p1
.end method

.method public b(Lb/f/b/k/f;)V
    .registers 7

    .line 1
    iget-object v0, p0, Lb/f/b/k/n/b;->a:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 2
    iget-object v0, p1, Lb/f/b/k/m;->D0:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_c
    if-ge v1, v0, :cond_3e

    .line 3
    iget-object v2, p1, Lb/f/b/k/m;->D0:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb/f/b/k/e;

    .line 4
    invoke-virtual {v2}, Lb/f/b/k/e;->n()Lb/f/b/k/e$b;

    move-result-object v3

    sget-object v4, Lb/f/b/k/e$b;->MATCH_CONSTRAINT:Lb/f/b/k/e$b;

    if-eq v3, v4, :cond_36

    .line 5
    invoke-virtual {v2}, Lb/f/b/k/e;->n()Lb/f/b/k/e$b;

    move-result-object v3

    sget-object v4, Lb/f/b/k/e$b;->MATCH_PARENT:Lb/f/b/k/e$b;

    if-eq v3, v4, :cond_36

    .line 6
    invoke-virtual {v2}, Lb/f/b/k/e;->x()Lb/f/b/k/e$b;

    move-result-object v3

    sget-object v4, Lb/f/b/k/e$b;->MATCH_CONSTRAINT:Lb/f/b/k/e$b;

    if-eq v3, v4, :cond_36

    .line 7
    invoke-virtual {v2}, Lb/f/b/k/e;->x()Lb/f/b/k/e$b;

    move-result-object v3

    sget-object v4, Lb/f/b/k/e$b;->MATCH_PARENT:Lb/f/b/k/e$b;

    if-ne v3, v4, :cond_3b

    .line 8
    :cond_36
    iget-object v3, p0, Lb/f/b/k/n/b;->a:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_3b
    add-int/lit8 v1, v1, 0x1

    goto :goto_c

    .line 9
    :cond_3e
    invoke-virtual {p1}, Lb/f/b/k/f;->P()V

    return-void
.end method
