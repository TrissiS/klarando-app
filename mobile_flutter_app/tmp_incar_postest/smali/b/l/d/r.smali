.class public Lb/l/d/r;
.super Ljava/lang/Object;
.source "FragmentTransition.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lb/l/d/r$h;,
        Lb/l/d/r$g;
    }
.end annotation


# static fields
.field public static final a:[I

.field public static final b:Lb/l/d/t;

.field public static final c:Lb/l/d/t;


# direct methods
.method public static constructor <clinit>()V
    .registers 2

    const/16 v0, 0xb

    new-array v0, v0, [I

    .line 1
    fill-array-data v0, :array_20

    sput-object v0, Lb/l/d/r;->a:[I

    .line 2
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_15

    .line 3
    new-instance v0, Lb/l/d/s;

    invoke-direct {v0}, Lb/l/d/s;-><init>()V

    goto :goto_16

    :cond_15
    const/4 v0, 0x0

    .line 4
    :goto_16
    sput-object v0, Lb/l/d/r;->b:Lb/l/d/t;

    .line 5
    invoke-static {}, Lb/l/d/r;->a()Lb/l/d/t;

    move-result-object v0

    sput-object v0, Lb/l/d/r;->c:Lb/l/d/t;

    return-void

    nop

    :array_20
    .array-data 4
        0x0
        0x3
        0x0
        0x1
        0x5
        0x4
        0x7
        0x6
        0x9
        0x8
        0xa
    .end array-data
.end method

.method public static a(Lb/e/a;Lb/l/d/r$h;Ljava/lang/Object;Z)Landroid/view/View;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lb/e/a<",
            "Ljava/lang/String;",
            "Landroid/view/View;",
            ">;",
            "Lb/l/d/r$h;",
            "Ljava/lang/Object;",
            "Z)",
            "Landroid/view/View;"
        }
    .end annotation

    .line 140
    iget-object p1, p1, Lb/l/d/r$h;->c:Lb/l/d/a;

    if-eqz p2, :cond_2b

    if-eqz p0, :cond_2b

    .line 141
    iget-object p2, p1, Lb/l/d/q;->m:Ljava/util/ArrayList;

    if-eqz p2, :cond_2b

    .line 142
    invoke-virtual {p2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p2

    if-nez p2, :cond_2b

    const/4 p2, 0x0

    if-eqz p3, :cond_1c

    .line 143
    iget-object p1, p1, Lb/l/d/q;->m:Ljava/util/ArrayList;

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    goto :goto_24

    .line 144
    :cond_1c
    iget-object p1, p1, Lb/l/d/q;->n:Ljava/util/ArrayList;

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    .line 145
    :goto_24
    invoke-virtual {p0, p1}, Lb/e/g;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    return-object p0

    :cond_2b
    const/4 p0, 0x0

    return-object p0
.end method

.method public static a(ILjava/util/ArrayList;Ljava/util/ArrayList;II)Lb/e/a;
    .registers 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/ArrayList<",
            "Lb/l/d/a;",
            ">;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Boolean;",
            ">;II)",
            "Lb/e/a<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 18
    new-instance v0, Lb/e/a;

    invoke-direct {v0}, Lb/e/a;-><init>()V

    add-int/lit8 p4, p4, -0x1

    :goto_7
    if-lt p4, p3, :cond_5a

    .line 19
    invoke-virtual {p1, p4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/l/d/a;

    .line 20
    invoke-virtual {v1, p0}, Lb/l/d/a;->b(I)Z

    move-result v2

    if-nez v2, :cond_16

    goto :goto_57

    .line 21
    :cond_16
    invoke-virtual {p2, p4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    .line 22
    iget-object v3, v1, Lb/l/d/q;->m:Ljava/util/ArrayList;

    if-eqz v3, :cond_57

    .line 23
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-eqz v2, :cond_2f

    .line 24
    iget-object v2, v1, Lb/l/d/q;->m:Ljava/util/ArrayList;

    .line 25
    iget-object v1, v1, Lb/l/d/q;->n:Ljava/util/ArrayList;

    goto :goto_36

    .line 26
    :cond_2f
    iget-object v2, v1, Lb/l/d/q;->m:Ljava/util/ArrayList;

    .line 27
    iget-object v1, v1, Lb/l/d/q;->n:Ljava/util/ArrayList;

    move-object v8, v2

    move-object v2, v1

    move-object v1, v8

    :goto_36
    const/4 v4, 0x0

    :goto_37
    if-ge v4, v3, :cond_57

    .line 28
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 29
    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 30
    invoke-virtual {v0, v6}, Lb/e/g;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    if-eqz v7, :cond_51

    .line 31
    invoke-virtual {v0, v5, v7}, Lb/e/g;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_54

    .line 32
    :cond_51
    invoke-virtual {v0, v5, v6}, Lb/e/g;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_54
    add-int/lit8 v4, v4, 0x1

    goto :goto_37

    :cond_57
    :goto_57
    add-int/lit8 p4, p4, -0x1

    goto :goto_7

    :cond_5a
    return-object v0
.end method

.method public static a(Lb/l/d/t;Lb/e/a;Ljava/lang/Object;Lb/l/d/r$h;)Lb/e/a;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lb/l/d/t;",
            "Lb/e/a<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/Object;",
            "Lb/l/d/r$h;",
            ")",
            "Lb/e/a<",
            "Ljava/lang/String;",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation

    .line 113
    iget-object v0, p3, Lb/l/d/r$h;->a:Landroidx/fragment/app/Fragment;

    .line 114
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->M()Landroid/view/View;

    move-result-object v1

    .line 115
    invoke-virtual {p1}, Lb/e/g;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_7b

    if-eqz p2, :cond_7b

    if-nez v1, :cond_11

    goto :goto_7b

    .line 116
    :cond_11
    new-instance p2, Lb/e/a;

    invoke-direct {p2}, Lb/e/a;-><init>()V

    .line 117
    invoke-virtual {p0, p2, v1}, Lb/l/d/t;->a(Ljava/util/Map;Landroid/view/View;)V

    .line 118
    iget-object p0, p3, Lb/l/d/r$h;->c:Lb/l/d/a;

    .line 119
    iget-boolean p3, p3, Lb/l/d/r$h;->b:Z

    if-eqz p3, :cond_26

    .line 120
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->u()Lb/h/d/e;

    move-result-object p3

    .line 121
    iget-object p0, p0, Lb/l/d/q;->m:Ljava/util/ArrayList;

    goto :goto_2c

    .line 122
    :cond_26
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->r()Lb/h/d/e;

    move-result-object p3

    .line 123
    iget-object p0, p0, Lb/l/d/q;->n:Ljava/util/ArrayList;

    :goto_2c
    if-eqz p0, :cond_38

    .line 124
    invoke-virtual {p2, p0}, Lb/e/a;->a(Ljava/util/Collection;)Z

    .line 125
    invoke-virtual {p1}, Lb/e/a;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-virtual {p2, v0}, Lb/e/a;->a(Ljava/util/Collection;)Z

    :cond_38
    if-eqz p3, :cond_77

    .line 126
    invoke-virtual {p3, p0, p2}, Lb/h/d/e;->a(Ljava/util/List;Ljava/util/Map;)V

    .line 127
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p3

    add-int/lit8 p3, p3, -0x1

    :goto_43
    if-ltz p3, :cond_7a

    .line 128
    invoke-virtual {p0, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 129
    invoke-virtual {p2, v0}, Lb/e/g;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    if-nez v1, :cond_5d

    .line 130
    invoke-static {p1, v0}, Lb/l/d/r;->a(Lb/e/a;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_74

    .line 131
    invoke-virtual {p1, v0}, Lb/e/g;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_74

    .line 132
    :cond_5d
    invoke-static {v1}, Lb/h/m/y;->B(Landroid/view/View;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_74

    .line 133
    invoke-static {p1, v0}, Lb/l/d/r;->a(Lb/e/a;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_74

    .line 134
    invoke-static {v1}, Lb/h/m/y;->B(Landroid/view/View;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lb/e/g;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_74
    :goto_74
    add-int/lit8 p3, p3, -0x1

    goto :goto_43

    .line 135
    :cond_77
    invoke-static {p1, p2}, Lb/l/d/r;->a(Lb/e/a;Lb/e/a;)V

    :cond_7a
    return-object p2

    .line 136
    :cond_7b
    :goto_7b
    invoke-virtual {p1}, Lb/e/g;->clear()V

    const/4 p0, 0x0

    return-object p0
.end method

.method public static a(Lb/l/d/r$h;Landroid/util/SparseArray;I)Lb/l/d/r$h;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lb/l/d/r$h;",
            "Landroid/util/SparseArray<",
            "Lb/l/d/r$h;",
            ">;I)",
            "Lb/l/d/r$h;"
        }
    .end annotation

    if-nez p0, :cond_a

    .line 214
    new-instance p0, Lb/l/d/r$h;

    invoke-direct {p0}, Lb/l/d/r$h;-><init>()V

    .line 215
    invoke-virtual {p1, p2, p0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    :cond_a
    return-object p0
.end method

.method public static a()Lb/l/d/t;
    .registers 3

    :try_start_0
    const-string v0, "b.s.e"

    .line 1
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const/4 v1, 0x0

    new-array v2, v1, [Ljava/lang/Class;

    .line 2
    invoke-virtual {v0, v2}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb/l/d/t;
    :try_end_15
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_15} :catch_16

    return-object v0

    :catch_16
    const/4 v0, 0x0

    return-object v0
.end method

.method public static a(Landroidx/fragment/app/Fragment;Landroidx/fragment/app/Fragment;)Lb/l/d/t;
    .registers 4

    .line 64
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    if-eqz p0, :cond_22

    .line 65
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->t()Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_10

    .line 66
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 67
    :cond_10
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->G()Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_19

    .line 68
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 69
    :cond_19
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->I()Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_22

    .line 70
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_22
    if-eqz p1, :cond_3f

    .line 71
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->q()Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_2d

    .line 72
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 73
    :cond_2d
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->F()Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_36

    .line 74
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 75
    :cond_36
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->H()Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_3f

    .line 76
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 77
    :cond_3f
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p0

    const/4 p1, 0x0

    if-eqz p0, :cond_47

    return-object p1

    .line 78
    :cond_47
    sget-object p0, Lb/l/d/r;->b:Lb/l/d/t;

    if-eqz p0, :cond_54

    invoke-static {p0, v0}, Lb/l/d/r;->a(Lb/l/d/t;Ljava/util/List;)Z

    move-result p0

    if-eqz p0, :cond_54

    .line 79
    sget-object p0, Lb/l/d/r;->b:Lb/l/d/t;

    return-object p0

    .line 80
    :cond_54
    sget-object p0, Lb/l/d/r;->c:Lb/l/d/t;

    if-eqz p0, :cond_61

    invoke-static {p0, v0}, Lb/l/d/r;->a(Lb/l/d/t;Ljava/util/List;)Z

    move-result p0

    if-eqz p0, :cond_61

    .line 81
    sget-object p0, Lb/l/d/r;->c:Lb/l/d/t;

    return-object p0

    .line 82
    :cond_61
    sget-object p0, Lb/l/d/r;->b:Lb/l/d/t;

    if-nez p0, :cond_6a

    sget-object p0, Lb/l/d/r;->c:Lb/l/d/t;

    if-nez p0, :cond_6a

    return-object p1

    .line 83
    :cond_6a
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Invalid Transition types"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static a(Lb/l/d/t;Landroid/view/ViewGroup;Landroid/view/View;Lb/e/a;Lb/l/d/r$h;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 26
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lb/l/d/t;",
            "Landroid/view/ViewGroup;",
            "Landroid/view/View;",
            "Lb/e/a<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lb/l/d/r$h;",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    move-object/from16 v6, p0

    move-object/from16 v7, p4

    move-object/from16 v10, p5

    move-object/from16 v11, p7

    .line 97
    iget-object v8, v7, Lb/l/d/r$h;->a:Landroidx/fragment/app/Fragment;

    .line 98
    iget-object v9, v7, Lb/l/d/r$h;->d:Landroidx/fragment/app/Fragment;

    const/4 v0, 0x0

    if-eqz v8, :cond_87

    if-nez v9, :cond_13

    goto/16 :goto_87

    .line 99
    :cond_13
    iget-boolean v12, v7, Lb/l/d/r$h;->b:Z

    .line 100
    invoke-virtual/range {p3 .. p3}, Lb/e/g;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1f

    move-object/from16 v13, p3

    move-object v1, v0

    goto :goto_25

    .line 101
    :cond_1f
    invoke-static {v6, v8, v9, v12}, Lb/l/d/r;->a(Lb/l/d/t;Landroidx/fragment/app/Fragment;Landroidx/fragment/app/Fragment;Z)Ljava/lang/Object;

    move-result-object v1

    move-object/from16 v13, p3

    .line 102
    :goto_25
    invoke-static {v6, v13, v1, v7}, Lb/l/d/r;->b(Lb/l/d/t;Lb/e/a;Ljava/lang/Object;Lb/l/d/r$h;)Lb/e/a;

    move-result-object v3

    .line 103
    invoke-virtual/range {p3 .. p3}, Lb/e/g;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_31

    move-object v14, v0

    goto :goto_39

    .line 104
    :cond_31
    invoke-virtual {v3}, Lb/e/a;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-virtual {v10, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    move-object v14, v1

    :goto_39
    if-nez v11, :cond_40

    if-nez p8, :cond_40

    if-nez v14, :cond_40

    return-object v0

    :cond_40
    const/4 v1, 0x1

    .line 105
    invoke-static {v8, v9, v12, v3, v1}, Lb/l/d/r;->a(Landroidx/fragment/app/Fragment;Landroidx/fragment/app/Fragment;ZLb/e/a;Z)V

    if-eqz v14, :cond_66

    .line 106
    new-instance v15, Landroid/graphics/Rect;

    invoke-direct {v15}, Landroid/graphics/Rect;-><init>()V

    move-object/from16 v5, p2

    .line 107
    invoke-virtual {v6, v14, v5, v10}, Lb/l/d/t;->b(Ljava/lang/Object;Landroid/view/View;Ljava/util/ArrayList;)V

    .line 108
    iget-boolean v4, v7, Lb/l/d/r$h;->e:Z

    .line 109
    iget-object v2, v7, Lb/l/d/r$h;->f:Lb/l/d/a;

    move-object/from16 v0, p0

    move-object v1, v14

    move-object/from16 v16, v2

    move-object/from16 v2, p8

    move-object/from16 v5, v16

    .line 110
    invoke-static/range {v0 .. v5}, Lb/l/d/r;->a(Lb/l/d/t;Ljava/lang/Object;Ljava/lang/Object;Lb/e/a;ZLb/l/d/a;)V

    if-eqz v11, :cond_67

    .line 111
    invoke-virtual {v6, v11, v15}, Lb/l/d/t;->a(Ljava/lang/Object;Landroid/graphics/Rect;)V

    goto :goto_67

    :cond_66
    move-object v15, v0

    .line 112
    :cond_67
    :goto_67
    new-instance v5, Lb/l/d/r$f;

    move-object v0, v5

    move-object/from16 v1, p0

    move-object/from16 v2, p3

    move-object v3, v14

    move-object/from16 v4, p4

    move-object v13, v5

    move-object/from16 v5, p6

    move-object/from16 v6, p2

    move-object v7, v8

    move-object v8, v9

    move v9, v12

    move-object/from16 v10, p5

    move-object/from16 v11, p7

    move-object v12, v15

    invoke-direct/range {v0 .. v12}, Lb/l/d/r$f;-><init>(Lb/l/d/t;Lb/e/a;Ljava/lang/Object;Lb/l/d/r$h;Ljava/util/ArrayList;Landroid/view/View;Landroidx/fragment/app/Fragment;Landroidx/fragment/app/Fragment;ZLjava/util/ArrayList;Ljava/lang/Object;Landroid/graphics/Rect;)V

    move-object/from16 v0, p1

    invoke-static {v0, v13}, Lb/h/m/v;->a(Landroid/view/View;Ljava/lang/Runnable;)Lb/h/m/v;

    return-object v14

    :cond_87
    :goto_87
    return-object v0
.end method

.method public static a(Lb/l/d/t;Landroidx/fragment/app/Fragment;Landroidx/fragment/app/Fragment;Z)Ljava/lang/Object;
    .registers 4

    if-eqz p1, :cond_19

    if-nez p2, :cond_5

    goto :goto_19

    :cond_5
    if-eqz p3, :cond_c

    .line 86
    invoke-virtual {p2}, Landroidx/fragment/app/Fragment;->I()Ljava/lang/Object;

    move-result-object p1

    goto :goto_10

    .line 87
    :cond_c
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->H()Ljava/lang/Object;

    move-result-object p1

    .line 88
    :goto_10
    invoke-virtual {p0, p1}, Lb/l/d/t;->b(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    .line 89
    invoke-virtual {p0, p1}, Lb/l/d/t;->c(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :cond_19
    :goto_19
    const/4 p0, 0x0

    return-object p0
.end method

.method public static a(Lb/l/d/t;Landroidx/fragment/app/Fragment;Z)Ljava/lang/Object;
    .registers 3

    if-nez p1, :cond_4

    const/4 p0, 0x0

    return-object p0

    :cond_4
    if-eqz p2, :cond_b

    .line 90
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->F()Ljava/lang/Object;

    move-result-object p1

    goto :goto_f

    .line 91
    :cond_b
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->q()Ljava/lang/Object;

    move-result-object p1

    .line 92
    :goto_f
    invoke-virtual {p0, p1}, Lb/l/d/t;->b(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static a(Lb/l/d/t;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Landroidx/fragment/app/Fragment;Z)Ljava/lang/Object;
    .registers 6

    if-eqz p1, :cond_12

    if-eqz p2, :cond_12

    if-eqz p4, :cond_12

    if-eqz p5, :cond_d

    .line 176
    invoke-virtual {p4}, Landroidx/fragment/app/Fragment;->k()Z

    move-result p4

    goto :goto_13

    .line 177
    :cond_d
    invoke-virtual {p4}, Landroidx/fragment/app/Fragment;->j()Z

    move-result p4

    goto :goto_13

    :cond_12
    const/4 p4, 0x1

    :goto_13
    if-eqz p4, :cond_1a

    .line 178
    invoke-virtual {p0, p2, p1, p3}, Lb/l/d/t;->b(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    goto :goto_1e

    .line 179
    :cond_1a
    invoke-virtual {p0, p2, p1, p3}, Lb/l/d/t;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    :goto_1e
    return-object p0
.end method

.method public static a(Lb/e/a;Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lb/e/a<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 137
    invoke-virtual {p0}, Lb/e/g;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_5
    if-ge v1, v0, :cond_1b

    .line 138
    invoke-virtual {p0, v1}, Lb/e/g;->e(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_18

    .line 139
    invoke-virtual {p0, v1}, Lb/e/g;->c(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0

    :cond_18
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    :cond_1b
    const/4 p0, 0x0

    return-object p0
.end method

.method public static a(Lb/l/d/t;Ljava/lang/Object;Landroidx/fragment/app/Fragment;Ljava/util/ArrayList;Landroid/view/View;)Ljava/util/ArrayList;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lb/l/d/t;",
            "Ljava/lang/Object;",
            "Landroidx/fragment/app/Fragment;",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;",
            "Landroid/view/View;",
            ")",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation

    if-eqz p1, :cond_22

    .line 166
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 167
    invoke-virtual {p2}, Landroidx/fragment/app/Fragment;->M()Landroid/view/View;

    move-result-object p2

    if-eqz p2, :cond_10

    .line 168
    invoke-virtual {p0, v0, p2}, Lb/l/d/t;->a(Ljava/util/ArrayList;Landroid/view/View;)V

    :cond_10
    if-eqz p3, :cond_15

    .line 169
    invoke-virtual {v0, p3}, Ljava/util/ArrayList;->removeAll(Ljava/util/Collection;)Z

    .line 170
    :cond_15
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p2

    if-nez p2, :cond_23

    .line 171
    invoke-virtual {v0, p4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 172
    invoke-virtual {p0, p1, v0}, Lb/l/d/t;->a(Ljava/lang/Object;Ljava/util/ArrayList;)V

    goto :goto_23

    :cond_22
    const/4 v0, 0x0

    :cond_23
    :goto_23
    return-object v0
.end method

.method public static a(Landroid/content/Context;Lb/l/d/e;Ljava/util/ArrayList;Ljava/util/ArrayList;IIZLb/l/d/r$g;)V
    .registers 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lb/l/d/e;",
            "Ljava/util/ArrayList<",
            "Lb/l/d/a;",
            ">;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Boolean;",
            ">;IIZ",
            "Lb/l/d/r$g;",
            ")V"
        }
    .end annotation

    .line 3
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    move v1, p4

    :goto_6
    if-ge v1, p5, :cond_24

    .line 4
    invoke-virtual {p2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb/l/d/a;

    .line 5
    invoke-virtual {p3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_1e

    .line 6
    invoke-static {v2, v0, p6}, Lb/l/d/r;->b(Lb/l/d/a;Landroid/util/SparseArray;Z)V

    goto :goto_21

    .line 7
    :cond_1e
    invoke-static {v2, v0, p6}, Lb/l/d/r;->a(Lb/l/d/a;Landroid/util/SparseArray;Z)V

    :goto_21
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    .line 8
    :cond_24
    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    move-result v1

    if-eqz v1, :cond_5f

    .line 9
    new-instance v1, Landroid/view/View;

    invoke-direct {v1, p0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 10
    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    move-result p0

    const/4 v2, 0x0

    :goto_34
    if-ge v2, p0, :cond_5f

    .line 11
    invoke-virtual {v0, v2}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v3

    .line 12
    invoke-static {v3, p2, p3, p4, p5}, Lb/l/d/r;->a(ILjava/util/ArrayList;Ljava/util/ArrayList;II)Lb/e/a;

    move-result-object v4

    .line 13
    invoke-virtual {v0, v2}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lb/l/d/r$h;

    .line 14
    invoke-virtual {p1}, Lb/l/d/e;->e()Z

    move-result v6

    if-eqz v6, :cond_5c

    .line 15
    invoke-virtual {p1, v3}, Lb/l/d/e;->a(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/view/ViewGroup;

    if-nez v3, :cond_53

    goto :goto_5c

    :cond_53
    if-eqz p6, :cond_59

    .line 16
    invoke-static {v3, v5, v1, v4, p7}, Lb/l/d/r;->b(Landroid/view/ViewGroup;Lb/l/d/r$h;Landroid/view/View;Lb/e/a;Lb/l/d/r$g;)V

    goto :goto_5c

    .line 17
    :cond_59
    invoke-static {v3, v5, v1, v4, p7}, Lb/l/d/r;->a(Landroid/view/ViewGroup;Lb/l/d/r$h;Landroid/view/View;Lb/e/a;Lb/l/d/r$g;)V

    :cond_5c
    :goto_5c
    add-int/lit8 v2, v2, 0x1

    goto :goto_34

    :cond_5f
    return-void
.end method

.method public static a(Landroid/view/ViewGroup;Lb/l/d/r$h;Landroid/view/View;Lb/e/a;Lb/l/d/r$g;)V
    .registers 25
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/ViewGroup;",
            "Lb/l/d/r$h;",
            "Landroid/view/View;",
            "Lb/e/a<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lb/l/d/r$g;",
            ")V"
        }
    .end annotation

    move-object/from16 v9, p0

    move-object/from16 v10, p1

    move-object/from16 v11, p2

    move-object/from16 v12, p3

    move-object/from16 v13, p4

    .line 39
    iget-object v14, v10, Lb/l/d/r$h;->a:Landroidx/fragment/app/Fragment;

    .line 40
    iget-object v15, v10, Lb/l/d/r$h;->d:Landroidx/fragment/app/Fragment;

    .line 41
    invoke-static {v15, v14}, Lb/l/d/r;->a(Landroidx/fragment/app/Fragment;Landroidx/fragment/app/Fragment;)Lb/l/d/t;

    move-result-object v8

    if-nez v8, :cond_15

    return-void

    .line 42
    :cond_15
    iget-boolean v0, v10, Lb/l/d/r$h;->b:Z

    .line 43
    iget-boolean v1, v10, Lb/l/d/r$h;->e:Z

    .line 44
    invoke-static {v8, v14, v0}, Lb/l/d/r;->a(Lb/l/d/t;Landroidx/fragment/app/Fragment;Z)Ljava/lang/Object;

    move-result-object v7

    .line 45
    invoke-static {v8, v15, v1}, Lb/l/d/r;->b(Lb/l/d/t;Landroidx/fragment/app/Fragment;Z)Ljava/lang/Object;

    move-result-object v6

    .line 46
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 47
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    move-object v0, v8

    move-object/from16 v1, p0

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    move-object/from16 v16, v4

    move-object/from16 v4, p1

    move-object/from16 v17, v5

    move-object/from16 v18, v6

    move-object/from16 v6, v16

    move-object/from16 v19, v7

    move-object v9, v8

    move-object/from16 v8, v18

    .line 48
    invoke-static/range {v0 .. v8}, Lb/l/d/r;->a(Lb/l/d/t;Landroid/view/ViewGroup;Landroid/view/View;Lb/e/a;Lb/l/d/r$h;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    move-object/from16 v8, v19

    if-nez v8, :cond_50

    if-nez v6, :cond_50

    move-object/from16 v0, v18

    if-nez v0, :cond_52

    return-void

    :cond_50
    move-object/from16 v0, v18

    :cond_52
    move-object/from16 v7, v17

    .line 49
    invoke-static {v9, v0, v15, v7, v11}, Lb/l/d/r;->a(Lb/l/d/t;Ljava/lang/Object;Landroidx/fragment/app/Fragment;Ljava/util/ArrayList;Landroid/view/View;)Ljava/util/ArrayList;

    move-result-object v17

    if-eqz v17, :cond_60

    .line 50
    invoke-virtual/range {v17 .. v17}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_61

    :cond_60
    const/4 v0, 0x0

    :cond_61
    move-object/from16 v18, v0

    .line 51
    invoke-virtual {v9, v8, v11}, Lb/l/d/t;->a(Ljava/lang/Object;Landroid/view/View;)V

    .line 52
    iget-boolean v5, v10, Lb/l/d/r$h;->b:Z

    move-object v0, v9

    move-object v1, v8

    move-object/from16 v2, v18

    move-object v3, v6

    move-object v4, v14

    invoke-static/range {v0 .. v5}, Lb/l/d/r;->a(Lb/l/d/t;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Landroidx/fragment/app/Fragment;Z)Ljava/lang/Object;

    move-result-object v10

    if-eqz v15, :cond_92

    if-eqz v17, :cond_92

    .line 53
    invoke-virtual/range {v17 .. v17}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-gtz v0, :cond_82

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_92

    .line 54
    :cond_82
    new-instance v0, Lb/h/i/b;

    invoke-direct {v0}, Lb/h/i/b;-><init>()V

    .line 55
    invoke-interface {v13, v15, v0}, Lb/l/d/r$g;->b(Landroidx/fragment/app/Fragment;Lb/h/i/b;)V

    .line 56
    new-instance v1, Lb/l/d/r$c;

    invoke-direct {v1, v13, v15, v0}, Lb/l/d/r$c;-><init>(Lb/l/d/r$g;Landroidx/fragment/app/Fragment;Lb/h/i/b;)V

    invoke-virtual {v9, v15, v10, v0, v1}, Lb/l/d/t;->a(Landroidx/fragment/app/Fragment;Ljava/lang/Object;Lb/h/i/b;Ljava/lang/Runnable;)V

    :cond_92
    if-eqz v10, :cond_c4

    .line 57
    new-instance v13, Ljava/util/ArrayList;

    invoke-direct {v13}, Ljava/util/ArrayList;-><init>()V

    move-object v0, v9

    move-object v1, v10

    move-object v2, v8

    move-object v3, v13

    move-object/from16 v4, v18

    move-object/from16 v5, v17

    move-object/from16 v7, v16

    .line 58
    invoke-virtual/range {v0 .. v7}, Lb/l/d/t;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/util/ArrayList;)V

    move-object/from16 v1, p0

    move-object v2, v14

    move-object/from16 v3, p2

    move-object/from16 v4, v16

    move-object v5, v8

    move-object v6, v13

    move-object/from16 v7, v18

    move-object/from16 v8, v17

    .line 59
    invoke-static/range {v0 .. v8}, Lb/l/d/r;->a(Lb/l/d/t;Landroid/view/ViewGroup;Landroidx/fragment/app/Fragment;Landroid/view/View;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/util/ArrayList;)V

    move-object/from16 v0, p0

    move-object v1, v9

    move-object/from16 v2, v16

    .line 60
    invoke-virtual {v1, v0, v2, v12}, Lb/l/d/t;->a(Landroid/view/View;Ljava/util/ArrayList;Ljava/util/Map;)V

    .line 61
    invoke-virtual {v1, v0, v10}, Lb/l/d/t;->a(Landroid/view/ViewGroup;Ljava/lang/Object;)V

    .line 62
    invoke-virtual {v1, v0, v2, v12}, Lb/l/d/t;->a(Landroid/view/ViewGroup;Ljava/util/ArrayList;Ljava/util/Map;)V

    :cond_c4
    return-void
.end method

.method public static a(Landroidx/fragment/app/Fragment;Landroidx/fragment/app/Fragment;ZLb/e/a;Z)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/fragment/app/Fragment;",
            "Landroidx/fragment/app/Fragment;",
            "Z",
            "Lb/e/a<",
            "Ljava/lang/String;",
            "Landroid/view/View;",
            ">;Z)V"
        }
    .end annotation

    if-eqz p2, :cond_7

    .line 157
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->r()Lb/h/d/e;

    move-result-object p0

    goto :goto_b

    .line 158
    :cond_7
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->r()Lb/h/d/e;

    move-result-object p0

    :goto_b
    if-eqz p0, :cond_3d

    .line 159
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 160
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    const/4 v0, 0x0

    if-nez p3, :cond_1c

    const/4 v1, 0x0

    goto :goto_20

    .line 161
    :cond_1c
    invoke-virtual {p3}, Lb/e/g;->size()I

    move-result v1

    :goto_20
    if-ge v0, v1, :cond_33

    .line 162
    invoke-virtual {p3, v0}, Lb/e/g;->c(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p2, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 163
    invoke-virtual {p3, v0}, Lb/e/g;->e(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_20

    :cond_33
    const/4 p3, 0x0

    if-eqz p4, :cond_3a

    .line 164
    invoke-virtual {p0, p2, p1, p3}, Lb/h/d/e;->b(Ljava/util/List;Ljava/util/List;Ljava/util/List;)V

    goto :goto_3d

    .line 165
    :cond_3a
    invoke-virtual {p0, p2, p1, p3}, Lb/h/d/e;->a(Ljava/util/List;Ljava/util/List;Ljava/util/List;)V

    :cond_3d
    :goto_3d
    return-void
.end method

.method public static a(Lb/e/a;Lb/e/a;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lb/e/a<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lb/e/a<",
            "Ljava/lang/String;",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    .line 153
    invoke-virtual {p0}, Lb/e/g;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_6
    if-ltz v0, :cond_1a

    .line 154
    invoke-virtual {p0, v0}, Lb/e/g;->e(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 155
    invoke-virtual {p1, v1}, Lb/e/g;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_17

    .line 156
    invoke-virtual {p0, v0}, Lb/e/g;->d(I)Ljava/lang/Object;

    :cond_17
    add-int/lit8 v0, v0, -0x1

    goto :goto_6

    :cond_1a
    return-void
.end method

.method public static a(Lb/l/d/a;Landroid/util/SparseArray;Z)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lb/l/d/a;",
            "Landroid/util/SparseArray<",
            "Lb/l/d/r$h;",
            ">;Z)V"
        }
    .end annotation

    .line 180
    iget-object v0, p0, Lb/l/d/q;->a:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_8
    if-ge v2, v0, :cond_18

    .line 181
    iget-object v3, p0, Lb/l/d/q;->a:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lb/l/d/q$a;

    .line 182
    invoke-static {p0, v3, p1, v1, p2}, Lb/l/d/r;->a(Lb/l/d/a;Lb/l/d/q$a;Landroid/util/SparseArray;ZZ)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    :cond_18
    return-void
.end method

.method public static a(Lb/l/d/a;Lb/l/d/q$a;Landroid/util/SparseArray;ZZ)V
    .registers 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lb/l/d/a;",
            "Lb/l/d/q$a;",
            "Landroid/util/SparseArray<",
            "Lb/l/d/r$h;",
            ">;ZZ)V"
        }
    .end annotation

    .line 183
    iget-object v0, p1, Lb/l/d/q$a;->b:Landroidx/fragment/app/Fragment;

    if-nez v0, :cond_5

    return-void

    .line 184
    :cond_5
    iget v1, v0, Landroidx/fragment/app/Fragment;->E:I

    if-nez v1, :cond_a

    return-void

    :cond_a
    if-eqz p3, :cond_13

    .line 185
    sget-object v2, Lb/l/d/r;->a:[I

    iget p1, p1, Lb/l/d/q$a;->a:I

    aget p1, v2, p1

    goto :goto_15

    :cond_13
    iget p1, p1, Lb/l/d/q$a;->a:I

    :goto_15
    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eq p1, v3, :cond_7f

    const/4 v4, 0x3

    if-eq p1, v4, :cond_57

    const/4 v4, 0x4

    if-eq p1, v4, :cond_3f

    const/4 v4, 0x5

    if-eq p1, v4, :cond_2d

    const/4 v4, 0x6

    if-eq p1, v4, :cond_57

    const/4 v4, 0x7

    if-eq p1, v4, :cond_7f

    const/4 p1, 0x0

    const/4 v3, 0x0

    :goto_2a
    const/4 v4, 0x0

    goto/16 :goto_92

    :cond_2d
    if-eqz p4, :cond_3c

    .line 186
    iget-boolean p1, v0, Landroidx/fragment/app/Fragment;->T:Z

    if-eqz p1, :cond_8e

    iget-boolean p1, v0, Landroidx/fragment/app/Fragment;->G:Z

    if-nez p1, :cond_8e

    iget-boolean p1, v0, Landroidx/fragment/app/Fragment;->s:Z

    if-eqz p1, :cond_8e

    goto :goto_8c

    .line 187
    :cond_3c
    iget-boolean p1, v0, Landroidx/fragment/app/Fragment;->G:Z

    goto :goto_8f

    :cond_3f
    if-eqz p4, :cond_4e

    .line 188
    iget-boolean p1, v0, Landroidx/fragment/app/Fragment;->T:Z

    if-eqz p1, :cond_70

    iget-boolean p1, v0, Landroidx/fragment/app/Fragment;->s:Z

    if-eqz p1, :cond_70

    iget-boolean p1, v0, Landroidx/fragment/app/Fragment;->G:Z

    if-eqz p1, :cond_70

    :goto_4d
    goto :goto_6e

    .line 189
    :cond_4e
    iget-boolean p1, v0, Landroidx/fragment/app/Fragment;->s:Z

    if-eqz p1, :cond_70

    iget-boolean p1, v0, Landroidx/fragment/app/Fragment;->G:Z

    if-nez p1, :cond_70

    goto :goto_4d

    :cond_57
    if-eqz p4, :cond_72

    .line 190
    iget-boolean p1, v0, Landroidx/fragment/app/Fragment;->s:Z

    if-nez p1, :cond_70

    iget-object p1, v0, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    if-eqz p1, :cond_70

    .line 191
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result p1

    if-nez p1, :cond_70

    iget p1, v0, Landroidx/fragment/app/Fragment;->U:F

    const/4 v4, 0x0

    cmpl-float p1, p1, v4

    if-ltz p1, :cond_70

    :goto_6e
    const/4 p1, 0x1

    goto :goto_7b

    :cond_70
    const/4 p1, 0x0

    goto :goto_7b

    .line 192
    :cond_72
    iget-boolean p1, v0, Landroidx/fragment/app/Fragment;->s:Z

    if-eqz p1, :cond_70

    iget-boolean p1, v0, Landroidx/fragment/app/Fragment;->G:Z

    if-nez p1, :cond_70

    goto :goto_6e

    :goto_7b
    move v4, p1

    const/4 p1, 0x1

    const/4 v3, 0x0

    goto :goto_92

    :cond_7f
    if-eqz p4, :cond_84

    .line 193
    iget-boolean p1, v0, Landroidx/fragment/app/Fragment;->S:Z

    goto :goto_8f

    .line 194
    :cond_84
    iget-boolean p1, v0, Landroidx/fragment/app/Fragment;->s:Z

    if-nez p1, :cond_8e

    iget-boolean p1, v0, Landroidx/fragment/app/Fragment;->G:Z

    if-nez p1, :cond_8e

    :goto_8c
    const/4 p1, 0x1

    goto :goto_8f

    :cond_8e
    const/4 p1, 0x0

    :goto_8f
    move v2, p1

    const/4 p1, 0x0

    goto :goto_2a

    .line 195
    :goto_92
    invoke-virtual {p2, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lb/l/d/r$h;

    if-eqz v2, :cond_a4

    .line 196
    invoke-static {v5, p2, v1}, Lb/l/d/r;->a(Lb/l/d/r$h;Landroid/util/SparseArray;I)Lb/l/d/r$h;

    move-result-object v5

    .line 197
    iput-object v0, v5, Lb/l/d/r$h;->a:Landroidx/fragment/app/Fragment;

    .line 198
    iput-boolean p3, v5, Lb/l/d/r$h;->b:Z

    .line 199
    iput-object p0, v5, Lb/l/d/r$h;->c:Lb/l/d/a;

    :cond_a4
    const/4 v2, 0x0

    if-nez p4, :cond_c5

    if-eqz v3, :cond_c5

    if-eqz v5, :cond_b1

    .line 200
    iget-object v3, v5, Lb/l/d/r$h;->d:Landroidx/fragment/app/Fragment;

    if-ne v3, v0, :cond_b1

    .line 201
    iput-object v2, v5, Lb/l/d/r$h;->d:Landroidx/fragment/app/Fragment;

    .line 202
    :cond_b1
    iget-boolean v3, p0, Lb/l/d/q;->o:Z

    if-nez v3, :cond_c5

    .line 203
    iget-object v3, p0, Lb/l/d/a;->q:Landroidx/fragment/app/FragmentManager;

    .line 204
    invoke-virtual {v3, v0}, Landroidx/fragment/app/FragmentManager;->e(Landroidx/fragment/app/Fragment;)Lb/l/d/o;

    move-result-object v6

    .line 205
    invoke-virtual {v3}, Landroidx/fragment/app/FragmentManager;->z()Lb/l/d/p;

    move-result-object v7

    invoke-virtual {v7, v6}, Lb/l/d/p;->a(Lb/l/d/o;)V

    .line 206
    invoke-virtual {v3, v0}, Landroidx/fragment/app/FragmentManager;->s(Landroidx/fragment/app/Fragment;)V

    :cond_c5
    if-eqz v4, :cond_d7

    if-eqz v5, :cond_cd

    .line 207
    iget-object v3, v5, Lb/l/d/r$h;->d:Landroidx/fragment/app/Fragment;

    if-nez v3, :cond_d7

    .line 208
    :cond_cd
    invoke-static {v5, p2, v1}, Lb/l/d/r;->a(Lb/l/d/r$h;Landroid/util/SparseArray;I)Lb/l/d/r$h;

    move-result-object v5

    .line 209
    iput-object v0, v5, Lb/l/d/r$h;->d:Landroidx/fragment/app/Fragment;

    .line 210
    iput-boolean p3, v5, Lb/l/d/r$h;->e:Z

    .line 211
    iput-object p0, v5, Lb/l/d/r$h;->f:Lb/l/d/a;

    :cond_d7
    if-nez p4, :cond_e3

    if-eqz p1, :cond_e3

    if-eqz v5, :cond_e3

    .line 212
    iget-object p0, v5, Lb/l/d/r$h;->a:Landroidx/fragment/app/Fragment;

    if-ne p0, v0, :cond_e3

    .line 213
    iput-object v2, v5, Lb/l/d/r$h;->a:Landroidx/fragment/app/Fragment;

    :cond_e3
    return-void
.end method

.method public static a(Lb/l/d/t;Landroid/view/ViewGroup;Landroidx/fragment/app/Fragment;Landroid/view/View;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/util/ArrayList;)V
    .registers 19
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lb/l/d/t;",
            "Landroid/view/ViewGroup;",
            "Landroidx/fragment/app/Fragment;",
            "Landroid/view/View;",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;",
            "Ljava/lang/Object;",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;",
            "Ljava/lang/Object;",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    .line 63
    new-instance v9, Lb/l/d/r$d;

    move-object v0, v9

    move-object v1, p5

    move-object v2, p0

    move-object v3, p3

    move-object v4, p2

    move-object v5, p4

    move-object/from16 v6, p6

    move-object/from16 v7, p8

    move-object/from16 v8, p7

    invoke-direct/range {v0 .. v8}, Lb/l/d/r$d;-><init>(Ljava/lang/Object;Lb/l/d/t;Landroid/view/View;Landroidx/fragment/app/Fragment;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/Object;)V

    move-object v0, p1

    invoke-static {p1, v9}, Lb/h/m/v;->a(Landroid/view/View;Ljava/lang/Runnable;)Lb/h/m/v;

    return-void
.end method

.method public static a(Lb/l/d/t;Ljava/lang/Object;Landroidx/fragment/app/Fragment;Ljava/util/ArrayList;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lb/l/d/t;",
            "Ljava/lang/Object;",
            "Landroidx/fragment/app/Fragment;",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    if-eqz p2, :cond_25

    if-eqz p1, :cond_25

    .line 33
    iget-boolean v0, p2, Landroidx/fragment/app/Fragment;->s:Z

    if-eqz v0, :cond_25

    iget-boolean v0, p2, Landroidx/fragment/app/Fragment;->G:Z

    if-eqz v0, :cond_25

    iget-boolean v0, p2, Landroidx/fragment/app/Fragment;->T:Z

    if-eqz v0, :cond_25

    const/4 v0, 0x1

    .line 34
    invoke-virtual {p2, v0}, Landroidx/fragment/app/Fragment;->h(Z)V

    .line 35
    invoke-virtual {p2}, Landroidx/fragment/app/Fragment;->M()Landroid/view/View;

    move-result-object v0

    .line 36
    invoke-virtual {p0, p1, v0, p3}, Lb/l/d/t;->a(Ljava/lang/Object;Landroid/view/View;Ljava/util/ArrayList;)V

    .line 37
    iget-object p0, p2, Landroidx/fragment/app/Fragment;->N:Landroid/view/ViewGroup;

    .line 38
    new-instance p1, Lb/l/d/r$b;

    invoke-direct {p1, p3}, Lb/l/d/r$b;-><init>(Ljava/util/ArrayList;)V

    invoke-static {p0, p1}, Lb/h/m/v;->a(Landroid/view/View;Ljava/lang/Runnable;)Lb/h/m/v;

    :cond_25
    return-void
.end method

.method public static a(Lb/l/d/t;Ljava/lang/Object;Ljava/lang/Object;Lb/e/a;ZLb/l/d/a;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lb/l/d/t;",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            "Lb/e/a<",
            "Ljava/lang/String;",
            "Landroid/view/View;",
            ">;Z",
            "Lb/l/d/a;",
            ")V"
        }
    .end annotation

    .line 146
    iget-object v0, p5, Lb/l/d/q;->m:Ljava/util/ArrayList;

    if-eqz v0, :cond_2c

    .line 147
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2c

    const/4 v0, 0x0

    if-eqz p4, :cond_16

    .line 148
    iget-object p4, p5, Lb/l/d/q;->n:Ljava/util/ArrayList;

    invoke-virtual {p4, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Ljava/lang/String;

    goto :goto_1e

    .line 149
    :cond_16
    iget-object p4, p5, Lb/l/d/q;->m:Ljava/util/ArrayList;

    invoke-virtual {p4, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Ljava/lang/String;

    .line 150
    :goto_1e
    invoke-virtual {p3, p4}, Lb/e/g;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Landroid/view/View;

    .line 151
    invoke-virtual {p0, p1, p3}, Lb/l/d/t;->c(Ljava/lang/Object;Landroid/view/View;)V

    if-eqz p2, :cond_2c

    .line 152
    invoke-virtual {p0, p2, p3}, Lb/l/d/t;->c(Ljava/lang/Object;Landroid/view/View;)V

    :cond_2c
    return-void
.end method

.method public static a(Ljava/util/ArrayList;I)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;I)V"
        }
    .end annotation

    if-nez p0, :cond_3

    return-void

    .line 173
    :cond_3
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_9
    if-ltz v0, :cond_17

    .line 174
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    .line 175
    invoke-virtual {v1, p1}, Landroid/view/View;->setVisibility(I)V

    add-int/lit8 v0, v0, -0x1

    goto :goto_9

    :cond_17
    return-void
.end method

.method public static a(Ljava/util/ArrayList;Lb/e/a;Ljava/util/Collection;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;",
            "Lb/e/a<",
            "Ljava/lang/String;",
            "Landroid/view/View;",
            ">;",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 93
    invoke-virtual {p1}, Lb/e/g;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_6
    if-ltz v0, :cond_1e

    .line 94
    invoke-virtual {p1, v0}, Lb/e/g;->e(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    .line 95
    invoke-static {v1}, Lb/h/m/y;->B(Landroid/view/View;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {p2, v2}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1b

    .line 96
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_1b
    add-int/lit8 v0, v0, -0x1

    goto :goto_6

    :cond_1e
    return-void
.end method

.method public static a(Lb/l/d/t;Ljava/util/List;)Z
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lb/l/d/t;",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;)Z"
        }
    .end annotation

    .line 84
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_6
    if-ge v2, v0, :cond_16

    .line 85
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p0, v3}, Lb/l/d/t;->a(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_13

    return v1

    :cond_13
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    :cond_16
    const/4 p0, 0x1

    return p0
.end method

.method public static b(Lb/l/d/t;Lb/e/a;Ljava/lang/Object;Lb/l/d/r$h;)Lb/e/a;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lb/l/d/t;",
            "Lb/e/a<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/Object;",
            "Lb/l/d/r$h;",
            ")",
            "Lb/e/a<",
            "Ljava/lang/String;",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation

    .line 54
    invoke-virtual {p1}, Lb/e/g;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_70

    if-nez p2, :cond_9

    goto :goto_70

    .line 55
    :cond_9
    iget-object p2, p3, Lb/l/d/r$h;->d:Landroidx/fragment/app/Fragment;

    .line 56
    new-instance v0, Lb/e/a;

    invoke-direct {v0}, Lb/e/a;-><init>()V

    .line 57
    invoke-virtual {p2}, Landroidx/fragment/app/Fragment;->u0()Landroid/view/View;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lb/l/d/t;->a(Ljava/util/Map;Landroid/view/View;)V

    .line 58
    iget-object p0, p3, Lb/l/d/r$h;->f:Lb/l/d/a;

    .line 59
    iget-boolean p3, p3, Lb/l/d/r$h;->e:Z

    if-eqz p3, :cond_24

    .line 60
    invoke-virtual {p2}, Landroidx/fragment/app/Fragment;->r()Lb/h/d/e;

    move-result-object p2

    .line 61
    iget-object p0, p0, Lb/l/d/q;->n:Ljava/util/ArrayList;

    goto :goto_2a

    .line 62
    :cond_24
    invoke-virtual {p2}, Landroidx/fragment/app/Fragment;->u()Lb/h/d/e;

    move-result-object p2

    .line 63
    iget-object p0, p0, Lb/l/d/q;->m:Ljava/util/ArrayList;

    :goto_2a
    if-eqz p0, :cond_2f

    .line 64
    invoke-virtual {v0, p0}, Lb/e/a;->a(Ljava/util/Collection;)Z

    :cond_2f
    if-eqz p2, :cond_68

    .line 65
    invoke-virtual {p2, p0, v0}, Lb/h/d/e;->a(Ljava/util/List;Ljava/util/Map;)V

    .line 66
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p2

    add-int/lit8 p2, p2, -0x1

    :goto_3a
    if-ltz p2, :cond_6f

    .line 67
    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/String;

    .line 68
    invoke-virtual {v0, p3}, Lb/e/g;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    if-nez v1, :cond_4e

    .line 69
    invoke-virtual {p1, p3}, Lb/e/g;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_65

    .line 70
    :cond_4e
    invoke-static {v1}, Lb/h/m/y;->B(Landroid/view/View;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_65

    .line 71
    invoke-virtual {p1, p3}, Lb/e/g;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/String;

    .line 72
    invoke-static {v1}, Lb/h/m/y;->B(Landroid/view/View;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1, p3}, Lb/e/g;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_65
    :goto_65
    add-int/lit8 p2, p2, -0x1

    goto :goto_3a

    .line 73
    :cond_68
    invoke-virtual {v0}, Lb/e/a;->keySet()Ljava/util/Set;

    move-result-object p0

    invoke-virtual {p1, p0}, Lb/e/a;->a(Ljava/util/Collection;)Z

    :cond_6f
    return-object v0

    .line 74
    :cond_70
    :goto_70
    invoke-virtual {p1}, Lb/e/g;->clear()V

    const/4 p0, 0x0

    return-object p0
.end method

.method public static b(Lb/l/d/t;Landroid/view/ViewGroup;Landroid/view/View;Lb/e/a;Lb/l/d/r$h;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 24
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lb/l/d/t;",
            "Landroid/view/ViewGroup;",
            "Landroid/view/View;",
            "Lb/e/a<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lb/l/d/r$h;",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    move-object v6, p0

    move-object/from16 v0, p2

    move-object/from16 v1, p3

    move-object/from16 v7, p4

    move-object/from16 v2, p5

    move-object/from16 v3, p6

    move-object/from16 v8, p7

    .line 29
    iget-object v9, v7, Lb/l/d/r$h;->a:Landroidx/fragment/app/Fragment;

    .line 30
    iget-object v10, v7, Lb/l/d/r$h;->d:Landroidx/fragment/app/Fragment;

    if-eqz v9, :cond_1b

    .line 31
    invoke-virtual {v9}, Landroidx/fragment/app/Fragment;->u0()Landroid/view/View;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroid/view/View;->setVisibility(I)V

    :cond_1b
    const/4 v4, 0x0

    if-eqz v9, :cond_9c

    if-nez v10, :cond_22

    goto/16 :goto_9c

    .line 32
    :cond_22
    iget-boolean v11, v7, Lb/l/d/r$h;->b:Z

    .line 33
    invoke-virtual/range {p3 .. p3}, Lb/e/g;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_2c

    move-object v5, v4

    goto :goto_30

    .line 34
    :cond_2c
    invoke-static {p0, v9, v10, v11}, Lb/l/d/r;->a(Lb/l/d/t;Landroidx/fragment/app/Fragment;Landroidx/fragment/app/Fragment;Z)Ljava/lang/Object;

    move-result-object v5

    .line 35
    :goto_30
    invoke-static {p0, v1, v5, v7}, Lb/l/d/r;->b(Lb/l/d/t;Lb/e/a;Ljava/lang/Object;Lb/l/d/r$h;)Lb/e/a;

    move-result-object v12

    .line 36
    invoke-static {p0, v1, v5, v7}, Lb/l/d/r;->a(Lb/l/d/t;Lb/e/a;Ljava/lang/Object;Lb/l/d/r$h;)Lb/e/a;

    move-result-object v13

    .line 37
    invoke-virtual/range {p3 .. p3}, Lb/e/g;->isEmpty()Z

    move-result v14

    if-eqz v14, :cond_4a

    if-eqz v12, :cond_43

    .line 38
    invoke-virtual {v12}, Lb/e/g;->clear()V

    :cond_43
    if-eqz v13, :cond_48

    .line 39
    invoke-virtual {v13}, Lb/e/g;->clear()V

    :cond_48
    move-object v14, v4

    goto :goto_59

    .line 40
    :cond_4a
    invoke-virtual/range {p3 .. p3}, Lb/e/a;->keySet()Ljava/util/Set;

    move-result-object v14

    .line 41
    invoke-static {v2, v12, v14}, Lb/l/d/r;->a(Ljava/util/ArrayList;Lb/e/a;Ljava/util/Collection;)V

    .line 42
    invoke-virtual/range {p3 .. p3}, Lb/e/a;->values()Ljava/util/Collection;

    move-result-object v1

    .line 43
    invoke-static {v3, v13, v1}, Lb/l/d/r;->a(Ljava/util/ArrayList;Lb/e/a;Ljava/util/Collection;)V

    move-object v14, v5

    :goto_59
    if-nez v8, :cond_60

    if-nez p8, :cond_60

    if-nez v14, :cond_60

    return-object v4

    :cond_60
    const/4 v1, 0x1

    .line 44
    invoke-static {v9, v10, v11, v12, v1}, Lb/l/d/r;->a(Landroidx/fragment/app/Fragment;Landroidx/fragment/app/Fragment;ZLb/e/a;Z)V

    if-eqz v14, :cond_89

    .line 45
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 46
    invoke-virtual {p0, v14, v0, v2}, Lb/l/d/t;->b(Ljava/lang/Object;Landroid/view/View;Ljava/util/ArrayList;)V

    .line 47
    iget-boolean v4, v7, Lb/l/d/r$h;->e:Z

    .line 48
    iget-object v5, v7, Lb/l/d/r$h;->f:Lb/l/d/a;

    move-object v0, p0

    move-object v1, v14

    move-object/from16 v2, p8

    move-object v3, v12

    .line 49
    invoke-static/range {v0 .. v5}, Lb/l/d/r;->a(Lb/l/d/t;Ljava/lang/Object;Ljava/lang/Object;Lb/e/a;ZLb/l/d/a;)V

    .line 50
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 51
    invoke-static {v13, v7, v8, v11}, Lb/l/d/r;->a(Lb/e/a;Lb/l/d/r$h;Ljava/lang/Object;Z)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_86

    .line 52
    invoke-virtual {p0, v8, v0}, Lb/l/d/t;->a(Ljava/lang/Object;Landroid/graphics/Rect;)V

    :cond_86
    move-object v7, v0

    move-object v5, v1

    goto :goto_8b

    :cond_89
    move-object v5, v4

    move-object v7, v5

    .line 53
    :goto_8b
    new-instance v8, Lb/l/d/r$e;

    move-object v0, v8

    move-object v1, v9

    move-object v2, v10

    move v3, v11

    move-object v4, v13

    move-object v6, p0

    invoke-direct/range {v0 .. v7}, Lb/l/d/r$e;-><init>(Landroidx/fragment/app/Fragment;Landroidx/fragment/app/Fragment;ZLb/e/a;Landroid/view/View;Lb/l/d/t;Landroid/graphics/Rect;)V

    move-object/from16 v0, p1

    invoke-static {v0, v8}, Lb/h/m/v;->a(Landroid/view/View;Ljava/lang/Runnable;)Lb/h/m/v;

    return-object v14

    :cond_9c
    :goto_9c
    return-object v4
.end method

.method public static b(Lb/l/d/t;Landroidx/fragment/app/Fragment;Z)Ljava/lang/Object;
    .registers 3

    if-nez p1, :cond_4

    const/4 p0, 0x0

    return-object p0

    :cond_4
    if-eqz p2, :cond_b

    .line 26
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->G()Ljava/lang/Object;

    move-result-object p1

    goto :goto_f

    .line 27
    :cond_b
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->t()Ljava/lang/Object;

    move-result-object p1

    .line 28
    :goto_f
    invoke-virtual {p0, p1}, Lb/l/d/t;->b(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static b(Landroid/view/ViewGroup;Lb/l/d/r$h;Landroid/view/View;Lb/e/a;Lb/l/d/r$g;)V
    .registers 22
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/ViewGroup;",
            "Lb/l/d/r$h;",
            "Landroid/view/View;",
            "Lb/e/a<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lb/l/d/r$g;",
            ")V"
        }
    .end annotation

    move-object/from16 v4, p1

    move-object/from16 v9, p2

    move-object/from16 v10, p4

    .line 1
    iget-object v11, v4, Lb/l/d/r$h;->a:Landroidx/fragment/app/Fragment;

    .line 2
    iget-object v12, v4, Lb/l/d/r$h;->d:Landroidx/fragment/app/Fragment;

    .line 3
    invoke-static {v12, v11}, Lb/l/d/r;->a(Landroidx/fragment/app/Fragment;Landroidx/fragment/app/Fragment;)Lb/l/d/t;

    move-result-object v13

    if-nez v13, :cond_11

    return-void

    .line 4
    :cond_11
    iget-boolean v14, v4, Lb/l/d/r$h;->b:Z

    .line 5
    iget-boolean v0, v4, Lb/l/d/r$h;->e:Z

    .line 6
    new-instance v15, Ljava/util/ArrayList;

    invoke-direct {v15}, Ljava/util/ArrayList;-><init>()V

    .line 7
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 8
    invoke-static {v13, v11, v14}, Lb/l/d/r;->a(Lb/l/d/t;Landroidx/fragment/app/Fragment;Z)Ljava/lang/Object;

    move-result-object v7

    .line 9
    invoke-static {v13, v12, v0}, Lb/l/d/r;->b(Lb/l/d/t;Landroidx/fragment/app/Fragment;Z)Ljava/lang/Object;

    move-result-object v6

    move-object v0, v13

    move-object/from16 v1, p0

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    move-object/from16 v4, p1

    move-object v5, v8

    move-object/from16 p1, v6

    move-object v6, v15

    move-object/from16 v16, v7

    move-object v10, v8

    move-object/from16 v8, p1

    .line 10
    invoke-static/range {v0 .. v8}, Lb/l/d/r;->b(Lb/l/d/t;Landroid/view/ViewGroup;Landroid/view/View;Lb/e/a;Lb/l/d/r$h;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    move-object/from16 v6, v16

    if-nez v6, :cond_48

    if-nez v8, :cond_48

    move-object/from16 v7, p1

    if-nez v7, :cond_4a

    return-void

    :cond_48
    move-object/from16 v7, p1

    .line 11
    :cond_4a
    invoke-static {v13, v7, v12, v10, v9}, Lb/l/d/r;->a(Lb/l/d/t;Ljava/lang/Object;Landroidx/fragment/app/Fragment;Ljava/util/ArrayList;Landroid/view/View;)Ljava/util/ArrayList;

    move-result-object v5

    .line 12
    invoke-static {v13, v6, v11, v15, v9}, Lb/l/d/r;->a(Lb/l/d/t;Ljava/lang/Object;Landroidx/fragment/app/Fragment;Ljava/util/ArrayList;Landroid/view/View;)Ljava/util/ArrayList;

    move-result-object v9

    const/4 v0, 0x4

    .line 13
    invoke-static {v9, v0}, Lb/l/d/r;->a(Ljava/util/ArrayList;I)V

    move-object v0, v13

    move-object v1, v6

    move-object v2, v7

    move-object v3, v8

    move-object v4, v11

    move-object v11, v5

    move v5, v14

    .line 14
    invoke-static/range {v0 .. v5}, Lb/l/d/r;->a(Lb/l/d/t;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Landroidx/fragment/app/Fragment;Z)Ljava/lang/Object;

    move-result-object v14

    if-eqz v12, :cond_83

    if-eqz v11, :cond_83

    .line 15
    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-gtz v0, :cond_71

    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_83

    .line 16
    :cond_71
    new-instance v0, Lb/h/i/b;

    invoke-direct {v0}, Lb/h/i/b;-><init>()V

    move-object/from16 v1, p4

    .line 17
    invoke-interface {v1, v12, v0}, Lb/l/d/r$g;->b(Landroidx/fragment/app/Fragment;Lb/h/i/b;)V

    .line 18
    new-instance v2, Lb/l/d/r$a;

    invoke-direct {v2, v1, v12, v0}, Lb/l/d/r$a;-><init>(Lb/l/d/r$g;Landroidx/fragment/app/Fragment;Lb/h/i/b;)V

    invoke-virtual {v13, v12, v14, v0, v2}, Lb/l/d/t;->a(Landroidx/fragment/app/Fragment;Ljava/lang/Object;Lb/h/i/b;Ljava/lang/Runnable;)V

    :cond_83
    if-eqz v14, :cond_ab

    .line 19
    invoke-static {v13, v7, v12, v11}, Lb/l/d/r;->a(Lb/l/d/t;Ljava/lang/Object;Landroidx/fragment/app/Fragment;Ljava/util/ArrayList;)V

    .line 20
    invoke-virtual {v13, v15}, Lb/l/d/t;->a(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v12

    move-object v0, v13

    move-object v1, v14

    move-object v2, v6

    move-object v3, v9

    move-object v4, v7

    move-object v5, v11

    move-object v6, v8

    move-object v7, v15

    .line 21
    invoke-virtual/range {v0 .. v7}, Lb/l/d/t;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/util/ArrayList;)V

    move-object/from16 v1, p0

    .line 22
    invoke-virtual {v13, v1, v14}, Lb/l/d/t;->a(Landroid/view/ViewGroup;Ljava/lang/Object;)V

    move-object v2, v10

    move-object v3, v15

    move-object v4, v12

    move-object/from16 v5, p3

    .line 23
    invoke-virtual/range {v0 .. v5}, Lb/l/d/t;->a(Landroid/view/View;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/Map;)V

    const/4 v0, 0x0

    .line 24
    invoke-static {v9, v0}, Lb/l/d/r;->a(Ljava/util/ArrayList;I)V

    .line 25
    invoke-virtual {v13, v8, v10, v15}, Lb/l/d/t;->b(Ljava/lang/Object;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    :cond_ab
    return-void
.end method

.method public static b(Lb/l/d/a;Landroid/util/SparseArray;Z)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lb/l/d/a;",
            "Landroid/util/SparseArray<",
            "Lb/l/d/r$h;",
            ">;Z)V"
        }
    .end annotation

    .line 75
    iget-object v0, p0, Lb/l/d/a;->q:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->x()Lb/l/d/e;

    move-result-object v0

    invoke-virtual {v0}, Lb/l/d/e;->e()Z

    move-result v0

    if-nez v0, :cond_d

    return-void

    .line 76
    :cond_d
    iget-object v0, p0, Lb/l/d/q;->a:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    :goto_15
    if-ltz v0, :cond_25

    .line 77
    iget-object v2, p0, Lb/l/d/q;->a:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb/l/d/q$a;

    .line 78
    invoke-static {p0, v2, p1, v1, p2}, Lb/l/d/r;->a(Lb/l/d/a;Lb/l/d/q$a;Landroid/util/SparseArray;ZZ)V

    add-int/lit8 v0, v0, -0x1

    goto :goto_15

    :cond_25
    return-void
.end method
