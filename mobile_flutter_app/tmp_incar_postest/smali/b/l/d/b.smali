.class public Lb/l/d/b;
.super Lb/l/d/w;
.source "DefaultSpecialEffectsController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lb/l/d/b$m;,
        Lb/l/d/b$k;,
        Lb/l/d/b$l;
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;)V
    .registers 2

    .line 1
    invoke-direct {p0, p1}, Lb/l/d/w;-><init>(Landroid/view/ViewGroup;)V

    return-void
.end method


# virtual methods
.method public final a(Ljava/util/List;Ljava/util/List;ZLb/l/d/w$e;Lb/l/d/w$e;)Ljava/util/Map;
    .registers 37
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lb/l/d/b$m;",
            ">;",
            "Ljava/util/List<",
            "Lb/l/d/w$e;",
            ">;Z",
            "Lb/l/d/w$e;",
            "Lb/l/d/w$e;",
            ")",
            "Ljava/util/Map<",
            "Lb/l/d/w$e;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    move-object/from16 v6, p0

    move/from16 v7, p3

    move-object/from16 v8, p4

    move-object/from16 v9, p5

    .line 72
    new-instance v10, Ljava/util/HashMap;

    invoke-direct {v10}, Ljava/util/HashMap;-><init>()V

    .line 73
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v15, 0x0

    :cond_12
    :goto_12
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_62

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/l/d/b$m;

    .line 74
    invoke-virtual {v1}, Lb/l/d/b$l;->d()Z

    move-result v2

    if-eqz v2, :cond_25

    goto :goto_12

    .line 75
    :cond_25
    invoke-virtual {v1}, Lb/l/d/b$m;->e()Lb/l/d/t;

    move-result-object v2

    if-nez v15, :cond_2d

    move-object v15, v2

    goto :goto_12

    :cond_2d
    if-eqz v2, :cond_12

    if-ne v15, v2, :cond_32

    goto :goto_12

    .line 76
    :cond_32
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Mixing framework transitions and AndroidX transitions is not allowed. Fragment "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    invoke-virtual {v1}, Lb/l/d/b$l;->b()Lb/l/d/w$e;

    move-result-object v3

    invoke-virtual {v3}, Lb/l/d/w$e;->d()Landroidx/fragment/app/Fragment;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, " returned Transition "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    invoke-virtual {v1}, Lb/l/d/b$m;->g()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " which uses a different Transition  type than other Fragments."

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_62
    const/4 v14, 0x0

    if-nez v15, :cond_85

    .line 79
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_69
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_84

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/l/d/b$m;

    .line 80
    invoke-virtual {v1}, Lb/l/d/b$l;->b()Lb/l/d/w$e;

    move-result-object v2

    invoke-static {v14}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-interface {v10, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 81
    invoke-virtual {v1}, Lb/l/d/b$l;->a()V

    goto :goto_69

    :cond_84
    return-object v10

    .line 82
    :cond_85
    new-instance v13, Landroid/view/View;

    invoke-virtual/range {p0 .. p0}, Lb/l/d/w;->d()Landroid/view/ViewGroup;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {v13, v0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 83
    new-instance v12, Landroid/graphics/Rect;

    invoke-direct {v12}, Landroid/graphics/Rect;-><init>()V

    .line 84
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 85
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 86
    new-instance v3, Lb/e/a;

    invoke-direct {v3}, Lb/e/a;-><init>()V

    .line 87
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v20

    const/4 v0, 0x0

    const/4 v2, 0x0

    const/16 v21, 0x0

    :goto_ae
    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_31b

    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/l/d/b$m;

    .line 88
    invoke-virtual {v1}, Lb/l/d/b$m;->h()Z

    move-result v16

    if-eqz v16, :cond_2f5

    if-eqz v8, :cond_2f5

    if-eqz v9, :cond_2f5

    .line 89
    invoke-virtual {v1}, Lb/l/d/b$m;->f()Ljava/lang/Object;

    move-result-object v0

    .line 90
    invoke-virtual {v15, v0}, Lb/l/d/t;->b(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 91
    invoke-virtual {v15, v0}, Lb/l/d/t;->c(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 92
    invoke-virtual/range {p5 .. p5}, Lb/l/d/w$e;->d()Landroidx/fragment/app/Fragment;

    move-result-object v0

    .line 93
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->J()Ljava/util/ArrayList;

    move-result-object v0

    .line 94
    invoke-virtual/range {p4 .. p4}, Lb/l/d/w$e;->d()Landroidx/fragment/app/Fragment;

    move-result-object v16

    .line 95
    invoke-virtual/range {v16 .. v16}, Landroidx/fragment/app/Fragment;->J()Ljava/util/ArrayList;

    move-result-object v14

    .line 96
    invoke-virtual/range {p4 .. p4}, Lb/l/d/w$e;->d()Landroidx/fragment/app/Fragment;

    move-result-object v16

    .line 97
    invoke-virtual/range {v16 .. v16}, Landroidx/fragment/app/Fragment;->K()Ljava/util/ArrayList;

    move-result-object v11

    move-object/from16 v16, v1

    move-object/from16 v18, v2

    const/4 v1, 0x0

    .line 98
    :goto_ed
    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_10c

    .line 99
    invoke-virtual {v11, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v2

    move-object/from16 v19, v11

    const/4 v11, -0x1

    if-eq v2, v11, :cond_107

    .line 100
    invoke-virtual {v14, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    invoke-virtual {v0, v2, v11}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    :cond_107
    add-int/lit8 v1, v1, 0x1

    move-object/from16 v11, v19

    goto :goto_ed

    .line 101
    :cond_10c
    invoke-virtual/range {p5 .. p5}, Lb/l/d/w$e;->d()Landroidx/fragment/app/Fragment;

    move-result-object v1

    .line 102
    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->K()Ljava/util/ArrayList;

    move-result-object v11

    if-nez v7, :cond_127

    .line 103
    invoke-virtual/range {p4 .. p4}, Lb/l/d/w$e;->d()Landroidx/fragment/app/Fragment;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->u()Lb/h/d/e;

    move-result-object v1

    .line 104
    invoke-virtual/range {p5 .. p5}, Lb/l/d/w$e;->d()Landroidx/fragment/app/Fragment;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/fragment/app/Fragment;->r()Lb/h/d/e;

    move-result-object v2

    goto :goto_137

    .line 105
    :cond_127
    invoke-virtual/range {p4 .. p4}, Lb/l/d/w$e;->d()Landroidx/fragment/app/Fragment;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->r()Lb/h/d/e;

    move-result-object v1

    .line 106
    invoke-virtual/range {p5 .. p5}, Lb/l/d/w$e;->d()Landroidx/fragment/app/Fragment;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/fragment/app/Fragment;->u()Lb/h/d/e;

    move-result-object v2

    .line 107
    :goto_137
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v14

    const/4 v9, 0x0

    :goto_13c
    if-ge v9, v14, :cond_15a

    .line 108
    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v19

    move/from16 v22, v14

    move-object/from16 v14, v19

    check-cast v14, Ljava/lang/String;

    .line 109
    invoke-virtual {v11, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v19

    move-object/from16 v8, v19

    check-cast v8, Ljava/lang/String;

    .line 110
    invoke-virtual {v3, v14, v8}, Lb/e/g;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v9, v9, 0x1

    move-object/from16 v8, p4

    move/from16 v14, v22

    goto :goto_13c

    .line 111
    :cond_15a
    new-instance v8, Lb/e/a;

    invoke-direct {v8}, Lb/e/a;-><init>()V

    .line 112
    invoke-virtual/range {p4 .. p4}, Lb/l/d/w$e;->d()Landroidx/fragment/app/Fragment;

    move-result-object v9

    iget-object v9, v9, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    invoke-virtual {v6, v8, v9}, Lb/l/d/b;->a(Ljava/util/Map;Landroid/view/View;)V

    .line 113
    invoke-virtual {v8, v0}, Lb/e/a;->a(Ljava/util/Collection;)Z

    if-eqz v1, :cond_1ad

    .line 114
    invoke-virtual {v1, v0, v8}, Lb/h/d/e;->a(Ljava/util/List;Ljava/util/Map;)V

    .line 115
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v9, 0x1

    sub-int/2addr v1, v9

    :goto_176
    if-ltz v1, :cond_1aa

    .line 116
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    .line 117
    invoke-virtual {v8, v9}, Lb/e/g;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Landroid/view/View;

    if-nez v14, :cond_18c

    .line 118
    invoke-virtual {v3, v9}, Lb/e/g;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-object/from16 v19, v0

    goto :goto_1a5

    :cond_18c
    move-object/from16 v19, v0

    .line 119
    invoke-static {v14}, Lb/h/m/y;->B(Landroid/view/View;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1a5

    .line 120
    invoke-virtual {v3, v9}, Lb/e/g;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 121
    invoke-static {v14}, Lb/h/m/y;->B(Landroid/view/View;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v3, v9, v0}, Lb/e/g;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1a5
    :goto_1a5
    add-int/lit8 v1, v1, -0x1

    move-object/from16 v0, v19

    goto :goto_176

    :cond_1aa
    move-object/from16 v19, v0

    goto :goto_1b6

    :cond_1ad
    move-object/from16 v19, v0

    .line 122
    invoke-virtual {v8}, Lb/e/a;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-virtual {v3, v0}, Lb/e/a;->a(Ljava/util/Collection;)Z

    .line 123
    :goto_1b6
    new-instance v9, Lb/e/a;

    invoke-direct {v9}, Lb/e/a;-><init>()V

    .line 124
    invoke-virtual/range {p5 .. p5}, Lb/l/d/w$e;->d()Landroidx/fragment/app/Fragment;

    move-result-object v0

    iget-object v0, v0, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    invoke-virtual {v6, v9, v0}, Lb/l/d/b;->a(Ljava/util/Map;Landroid/view/View;)V

    .line 125
    invoke-virtual {v9, v11}, Lb/e/a;->a(Ljava/util/Collection;)Z

    .line 126
    invoke-virtual {v3}, Lb/e/a;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-virtual {v9, v0}, Lb/e/a;->a(Ljava/util/Collection;)Z

    if-eqz v2, :cond_20d

    .line 127
    invoke-virtual {v2, v11, v9}, Lb/h/d/e;->a(Ljava/util/List;Ljava/util/Map;)V

    .line 128
    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    :goto_1d9
    if-ltz v0, :cond_210

    .line 129
    invoke-virtual {v11, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 130
    invoke-virtual {v9, v1}, Lb/e/g;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    if-nez v2, :cond_1f3

    .line 131
    invoke-static {v3, v1}, Lb/l/d/r;->a(Lb/e/a;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_20a

    .line 132
    invoke-virtual {v3, v1}, Lb/e/g;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_20a

    .line 133
    :cond_1f3
    invoke-static {v2}, Lb/h/m/y;->B(Landroid/view/View;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v1, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-nez v14, :cond_20a

    .line 134
    invoke-static {v3, v1}, Lb/l/d/r;->a(Lb/e/a;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_20a

    .line 135
    invoke-static {v2}, Lb/h/m/y;->B(Landroid/view/View;)Ljava/lang/String;

    move-result-object v2

    .line 136
    invoke-virtual {v3, v1, v2}, Lb/e/g;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_20a
    :goto_20a
    add-int/lit8 v0, v0, -0x1

    goto :goto_1d9

    .line 137
    :cond_20d
    invoke-static {v3, v9}, Lb/l/d/r;->a(Lb/e/a;Lb/e/a;)V

    .line 138
    :cond_210
    invoke-virtual {v3}, Lb/e/a;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-virtual {v6, v8, v0}, Lb/l/d/b;->a(Lb/e/a;Ljava/util/Collection;)V

    .line 139
    invoke-virtual {v3}, Lb/e/a;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-virtual {v6, v9, v0}, Lb/l/d/b;->a(Lb/e/a;Ljava/util/Collection;)V

    .line 140
    invoke-virtual {v3}, Lb/e/g;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_240

    .line 141
    invoke-virtual {v5}, Ljava/util/ArrayList;->clear()V

    .line 142
    invoke-virtual {v4}, Ljava/util/ArrayList;->clear()V

    move-object/from16 v24, v3

    move-object v9, v4

    move-object v4, v12

    move-object v8, v13

    move-object v11, v15

    move-object/from16 v2, v18

    const/4 v0, 0x0

    const/4 v1, 0x0

    move-object/from16 v3, p5

    move-object v15, v10

    move-object/from16 v10, p4

    move-object/from16 v30, v6

    move-object v6, v5

    move-object/from16 v5, v30

    goto/16 :goto_308

    .line 143
    :cond_240
    invoke-virtual/range {p5 .. p5}, Lb/l/d/w$e;->d()Landroidx/fragment/app/Fragment;

    move-result-object v0

    invoke-virtual/range {p4 .. p4}, Lb/l/d/w$e;->d()Landroidx/fragment/app/Fragment;

    move-result-object v1

    const/4 v2, 0x1

    .line 144
    invoke-static {v0, v1, v7, v8, v2}, Lb/l/d/r;->a(Landroidx/fragment/app/Fragment;Landroidx/fragment/app/Fragment;ZLb/e/a;Z)V

    .line 145
    invoke-virtual/range {p0 .. p0}, Lb/l/d/w;->d()Landroid/view/ViewGroup;

    move-result-object v14

    new-instance v2, Lb/l/d/b$g;

    move-object/from16 v1, v19

    move-object v0, v2

    move-object/from16 v7, v16

    move-object/from16 v1, p0

    move-object/from16 v22, v10

    move-object/from16 v23, v18

    move-object v10, v2

    move-object/from16 v2, p5

    move-object/from16 v24, v3

    move-object/from16 v3, p4

    move-object/from16 v16, v13

    move-object v13, v4

    move/from16 v4, p3

    move-object v6, v5

    move-object v5, v9

    invoke-direct/range {v0 .. v5}, Lb/l/d/b$g;-><init>(Lb/l/d/b;Lb/l/d/w$e;Lb/l/d/w$e;ZLb/e/a;)V

    invoke-static {v14, v10}, Lb/h/m/v;->a(Landroid/view/View;Ljava/lang/Runnable;)Lb/h/m/v;

    .line 146
    invoke-virtual {v8}, Lb/e/a;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 147
    invoke-virtual/range {v19 .. v19}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_292

    move-object/from16 v0, v19

    const/4 v1, 0x0

    .line 148
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 149
    invoke-virtual {v8, v0}, Lb/e/g;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 150
    invoke-virtual {v15, v7, v0}, Lb/l/d/t;->c(Ljava/lang/Object;Landroid/view/View;)V

    move-object v2, v0

    goto :goto_295

    :cond_292
    const/4 v1, 0x0

    move-object/from16 v2, v23

    .line 151
    :goto_295
    invoke-virtual {v9}, Lb/e/a;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-virtual {v13, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 152
    invoke-virtual {v11}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2c3

    .line 153
    invoke-virtual {v11, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 154
    invoke-virtual {v9, v0}, Lb/e/g;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    if-eqz v0, :cond_2c3

    .line 155
    invoke-virtual/range {p0 .. p0}, Lb/l/d/w;->d()Landroid/view/ViewGroup;

    move-result-object v3

    new-instance v4, Lb/l/d/b$h;

    move-object/from16 v5, p0

    invoke-direct {v4, v5, v15, v0, v12}, Lb/l/d/b$h;-><init>(Lb/l/d/b;Lb/l/d/t;Landroid/view/View;Landroid/graphics/Rect;)V

    invoke-static {v3, v4}, Lb/h/m/v;->a(Landroid/view/View;Ljava/lang/Runnable;)Lb/h/m/v;

    move-object/from16 v0, v16

    const/16 v21, 0x1

    goto :goto_2c7

    :cond_2c3
    move-object/from16 v5, p0

    move-object/from16 v0, v16

    .line 156
    :goto_2c7
    invoke-virtual {v15, v7, v0, v6}, Lb/l/d/t;->b(Ljava/lang/Object;Landroid/view/View;Ljava/util/ArrayList;)V

    const/4 v14, 0x0

    const/4 v3, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    move-object v4, v12

    move-object v12, v15

    move-object v8, v0

    move-object v9, v13

    move-object v13, v7

    move-object v11, v15

    move-object v15, v3

    move-object/from16 v18, v7

    move-object/from16 v19, v9

    .line 157
    invoke-virtual/range {v12 .. v19}, Lb/l/d/t;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/util/ArrayList;)V

    const/4 v0, 0x1

    .line 158
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    move-object/from16 v10, p4

    move-object/from16 v15, v22

    invoke-interface {v15, v10, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 159
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    move-object/from16 v3, p5

    invoke-interface {v15, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v0, v7

    goto :goto_308

    :cond_2f5
    move-object/from16 v23, v2

    move-object/from16 v24, v3

    move-object v3, v9

    move-object v11, v15

    const/4 v1, 0x0

    move-object v9, v4

    move-object v15, v10

    move-object v4, v12

    move-object v10, v8

    move-object v8, v13

    move-object/from16 v30, v6

    move-object v6, v5

    move-object/from16 v5, v30

    move-object/from16 v2, v23

    :goto_308
    move/from16 v7, p3

    move-object v12, v4

    move-object v13, v8

    move-object v4, v9

    move-object v8, v10

    move-object v10, v15

    const/4 v14, 0x0

    move-object v9, v3

    move-object v15, v11

    move-object/from16 v3, v24

    move-object/from16 v30, v6

    move-object v6, v5

    move-object/from16 v5, v30

    goto/16 :goto_ae

    :cond_31b
    move-object/from16 v23, v2

    move-object/from16 v24, v3

    move-object v3, v9

    move-object v11, v15

    const/4 v1, 0x0

    move-object v9, v4

    move-object v15, v10

    move-object v4, v12

    move-object v10, v8

    move-object v8, v13

    move-object/from16 v30, v6

    move-object v6, v5

    move-object/from16 v5, v30

    .line 160
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 161
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    const/4 v13, 0x0

    const/4 v14, 0x0

    :goto_337
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_464

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    move-object/from16 v20, v12

    check-cast v20, Lb/l/d/b$m;

    .line 162
    invoke-virtual/range {v20 .. v20}, Lb/l/d/b$l;->d()Z

    move-result v12

    if-eqz v12, :cond_35e

    .line 163
    invoke-virtual/range {v20 .. v20}, Lb/l/d/b$l;->b()Lb/l/d/w$e;

    move-result-object v12

    move-object/from16 p3, v7

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    invoke-interface {v15, v12, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 164
    invoke-virtual/range {v20 .. v20}, Lb/l/d/b$l;->a()V

    :goto_35b
    move-object/from16 v7, p3

    goto :goto_337

    :cond_35e
    move-object/from16 p3, v7

    .line 165
    invoke-virtual/range {v20 .. v20}, Lb/l/d/b$m;->g()Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v11, v7}, Lb/l/d/t;->b(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    .line 166
    invoke-virtual/range {v20 .. v20}, Lb/l/d/b$l;->b()Lb/l/d/w$e;

    move-result-object v12

    if-eqz v0, :cond_375

    if-eq v12, v10, :cond_372

    if-ne v12, v3, :cond_375

    :cond_372
    const/16 v16, 0x1

    goto :goto_377

    :cond_375
    const/16 v16, 0x0

    :goto_377
    if-nez v7, :cond_396

    if-nez v16, :cond_385

    .line 167
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    invoke-interface {v15, v12, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 168
    invoke-virtual/range {v20 .. v20}, Lb/l/d/b$l;->a()V

    :cond_385
    move-object/from16 v12, p2

    move-object/from16 v28, v6

    move-object/from16 v26, v8

    move-object/from16 v29, v9

    move-object v7, v13

    move-object v6, v14

    move-object v9, v15

    move-object/from16 v1, v23

    const/4 v13, 0x0

    const/4 v14, 0x1

    goto/16 :goto_456

    .line 169
    :cond_396
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v17, v13

    .line 170
    invoke-virtual {v12}, Lb/l/d/w$e;->d()Landroidx/fragment/app/Fragment;

    move-result-object v13

    iget-object v13, v13, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    .line 171
    invoke-virtual {v5, v1, v13}, Lb/l/d/b;->a(Ljava/util/ArrayList;Landroid/view/View;)V

    if-eqz v16, :cond_3b1

    if-ne v12, v10, :cond_3ae

    .line 172
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->removeAll(Ljava/util/Collection;)Z

    goto :goto_3b1

    .line 173
    :cond_3ae
    invoke-virtual {v1, v9}, Ljava/util/ArrayList;->removeAll(Ljava/util/Collection;)Z

    .line 174
    :cond_3b1
    :goto_3b1
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v13

    if-eqz v13, :cond_3c8

    .line 175
    invoke-virtual {v11, v7, v8}, Lb/l/d/t;->a(Ljava/lang/Object;Landroid/view/View;)V

    move-object/from16 v28, v6

    move-object/from16 v26, v8

    move-object/from16 v29, v9

    move-object v13, v12

    move-object v6, v14

    move-object v9, v15

    move-object/from16 v8, v17

    move-object/from16 v12, p2

    goto :goto_424

    .line 176
    :cond_3c8
    invoke-virtual {v11, v7, v1}, Lb/l/d/t;->a(Ljava/lang/Object;Ljava/util/ArrayList;)V

    const/16 v16, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v25, 0x0

    move-object v13, v12

    move-object v12, v11

    move-object/from16 v26, v8

    move-object/from16 v27, v13

    move-object/from16 v8, v17

    move-object v13, v7

    move-object/from16 v28, v6

    move-object v6, v14

    move-object v14, v7

    move-object/from16 v29, v9

    move-object v9, v15

    move-object v15, v1

    move-object/from16 v17, v18

    move-object/from16 v18, v19

    move-object/from16 v19, v25

    .line 177
    invoke-virtual/range {v12 .. v19}, Lb/l/d/t;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/util/ArrayList;)V

    .line 178
    invoke-virtual/range {v27 .. v27}, Lb/l/d/w$e;->c()Lb/l/d/w$e$c;

    move-result-object v12

    sget-object v13, Lb/l/d/w$e$c;->GONE:Lb/l/d/w$e$c;

    if-ne v12, v13, :cond_420

    move-object/from16 v12, p2

    move-object/from16 v13, v27

    .line 179
    invoke-interface {v12, v13}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 180
    new-instance v14, Ljava/util/ArrayList;

    invoke-direct {v14, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 181
    invoke-virtual {v13}, Lb/l/d/w$e;->d()Landroidx/fragment/app/Fragment;

    move-result-object v15

    iget-object v15, v15, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    invoke-virtual {v14, v15}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 182
    invoke-virtual {v13}, Lb/l/d/w$e;->d()Landroidx/fragment/app/Fragment;

    move-result-object v15

    iget-object v15, v15, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    .line 183
    invoke-virtual {v11, v7, v15, v14}, Lb/l/d/t;->a(Ljava/lang/Object;Landroid/view/View;Ljava/util/ArrayList;)V

    .line 184
    invoke-virtual/range {p0 .. p0}, Lb/l/d/w;->d()Landroid/view/ViewGroup;

    move-result-object v14

    new-instance v15, Lb/l/d/b$i;

    invoke-direct {v15, v5, v1}, Lb/l/d/b$i;-><init>(Lb/l/d/b;Ljava/util/ArrayList;)V

    invoke-static {v14, v15}, Lb/h/m/v;->a(Landroid/view/View;Ljava/lang/Runnable;)Lb/h/m/v;

    goto :goto_424

    :cond_420
    move-object/from16 v12, p2

    move-object/from16 v13, v27

    .line 185
    :goto_424
    invoke-virtual {v13}, Lb/l/d/w$e;->c()Lb/l/d/w$e$c;

    move-result-object v14

    sget-object v15, Lb/l/d/w$e$c;->VISIBLE:Lb/l/d/w$e$c;

    if-ne v14, v15, :cond_437

    .line 186
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    if-eqz v21, :cond_434

    .line 187
    invoke-virtual {v11, v7, v4}, Lb/l/d/t;->a(Ljava/lang/Object;Landroid/graphics/Rect;)V

    :cond_434
    move-object/from16 v1, v23

    goto :goto_43c

    :cond_437
    move-object/from16 v1, v23

    .line 188
    invoke-virtual {v11, v7, v1}, Lb/l/d/t;->c(Ljava/lang/Object;Landroid/view/View;)V

    :goto_43c
    const/4 v14, 0x1

    .line 189
    invoke-static {v14}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v15

    invoke-interface {v9, v13, v15}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 190
    invoke-virtual/range {v20 .. v20}, Lb/l/d/b$m;->i()Z

    move-result v13

    if-eqz v13, :cond_451

    const/4 v13, 0x0

    .line 191
    invoke-virtual {v11, v6, v7, v13}, Lb/l/d/t;->b(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    move-object v7, v8

    goto :goto_456

    :cond_451
    const/4 v13, 0x0

    .line 192
    invoke-virtual {v11, v8, v7, v13}, Lb/l/d/t;->b(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    :goto_456
    move-object/from16 v23, v1

    move-object v14, v6

    move-object v13, v7

    move-object v15, v9

    move-object/from16 v8, v26

    move-object/from16 v6, v28

    move-object/from16 v9, v29

    const/4 v1, 0x0

    goto/16 :goto_35b

    :cond_464
    move-object/from16 v28, v6

    move-object/from16 v29, v9

    move-object v8, v13

    move-object v6, v14

    move-object v9, v15

    const/4 v14, 0x1

    .line 193
    invoke-virtual {v11, v6, v8, v0}, Lb/l/d/t;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 194
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_474
    :goto_474
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_4e8

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lb/l/d/b$m;

    .line 195
    invoke-virtual {v6}, Lb/l/d/b$l;->d()Z

    move-result v7

    if-eqz v7, :cond_487

    goto :goto_474

    .line 196
    :cond_487
    invoke-virtual {v6}, Lb/l/d/b$m;->g()Ljava/lang/Object;

    move-result-object v7

    .line 197
    invoke-virtual {v6}, Lb/l/d/b$l;->b()Lb/l/d/w$e;

    move-result-object v8

    if-eqz v0, :cond_497

    if-eq v8, v10, :cond_495

    if-ne v8, v3, :cond_497

    :cond_495
    const/4 v12, 0x1

    goto :goto_498

    :cond_497
    const/4 v12, 0x0

    :goto_498
    if-nez v7, :cond_49c

    if-eqz v12, :cond_474

    .line 198
    :cond_49c
    invoke-virtual/range {p0 .. p0}, Lb/l/d/w;->d()Landroid/view/ViewGroup;

    move-result-object v7

    invoke-static {v7}, Lb/h/m/y;->K(Landroid/view/View;)Z

    move-result v7

    if-nez v7, :cond_4d3

    const/4 v7, 0x2

    .line 199
    invoke-static {v7}, Landroidx/fragment/app/FragmentManager;->d(I)Z

    move-result v7

    if-eqz v7, :cond_4cf

    .line 200
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "SpecialEffectsController: Container "

    invoke-virtual {v7, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 201
    invoke-virtual/range {p0 .. p0}, Lb/l/d/w;->d()Landroid/view/ViewGroup;

    move-result-object v12

    invoke-virtual {v7, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v12, " has not been laid out. Completing operation "

    invoke-virtual {v7, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    const-string v8, "FragmentManager"

    .line 202
    invoke-static {v8, v7}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 203
    :cond_4cf
    invoke-virtual {v6}, Lb/l/d/b$l;->a()V

    goto :goto_474

    .line 204
    :cond_4d3
    invoke-virtual {v6}, Lb/l/d/b$l;->b()Lb/l/d/w$e;

    move-result-object v7

    invoke-virtual {v7}, Lb/l/d/w$e;->d()Landroidx/fragment/app/Fragment;

    move-result-object v7

    .line 205
    invoke-virtual {v6}, Lb/l/d/b$l;->c()Lb/h/i/b;

    move-result-object v8

    new-instance v12, Lb/l/d/b$j;

    invoke-direct {v12, v5, v6}, Lb/l/d/b$j;-><init>(Lb/l/d/b;Lb/l/d/b$m;)V

    .line 206
    invoke-virtual {v11, v7, v1, v8, v12}, Lb/l/d/t;->a(Landroidx/fragment/app/Fragment;Ljava/lang/Object;Lb/h/i/b;Ljava/lang/Runnable;)V

    goto :goto_474

    .line 207
    :cond_4e8
    invoke-virtual/range {p0 .. p0}, Lb/l/d/w;->d()Landroid/view/ViewGroup;

    move-result-object v3

    invoke-static {v3}, Lb/h/m/y;->K(Landroid/view/View;)Z

    move-result v3

    if-nez v3, :cond_4f3

    return-object v9

    :cond_4f3
    const/4 v3, 0x4

    .line 208
    invoke-static {v2, v3}, Lb/l/d/r;->a(Ljava/util/ArrayList;I)V

    move-object/from16 v3, v29

    .line 209
    invoke-virtual {v11, v3}, Lb/l/d/t;->a(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v16

    .line 210
    invoke-virtual/range {p0 .. p0}, Lb/l/d/w;->d()Landroid/view/ViewGroup;

    move-result-object v4

    invoke-virtual {v11, v4, v1}, Lb/l/d/t;->a(Landroid/view/ViewGroup;Ljava/lang/Object;)V

    .line 211
    invoke-virtual/range {p0 .. p0}, Lb/l/d/w;->d()Landroid/view/ViewGroup;

    move-result-object v13

    move-object v12, v11

    move-object/from16 v14, v28

    move-object v15, v3

    move-object/from16 v17, v24

    invoke-virtual/range {v12 .. v17}, Lb/l/d/t;->a(Landroid/view/View;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/Map;)V

    const/4 v1, 0x0

    .line 212
    invoke-static {v2, v1}, Lb/l/d/r;->a(Ljava/util/ArrayList;I)V

    move-object/from16 v1, v28

    .line 213
    invoke-virtual {v11, v0, v1, v3}, Lb/l/d/t;->b(Ljava/lang/Object;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    return-object v9
.end method

.method public a(Lb/e/a;Ljava/util/Collection;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lb/e/a<",
            "Ljava/lang/String;",
            "Landroid/view/View;",
            ">;",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 214
    invoke-virtual {p1}, Lb/e/a;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    .line 215
    :cond_8
    :goto_8
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_28

    .line 216
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 217
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-static {v0}, Lb/h/m/y;->B(Landroid/view/View;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p2, v0}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_8

    .line 218
    invoke-interface {p1}, Ljava/util/Iterator;->remove()V

    goto :goto_8

    :cond_28
    return-void
.end method

.method public a(Lb/l/d/w$e;)V
    .registers 3

    .line 238
    invoke-virtual {p1}, Lb/l/d/w$e;->d()Landroidx/fragment/app/Fragment;

    move-result-object v0

    iget-object v0, v0, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    .line 239
    invoke-virtual {p1}, Lb/l/d/w$e;->c()Lb/l/d/w$e$c;

    move-result-object p1

    invoke-virtual {p1, v0}, Lb/l/d/w$e$c;->applyState(Landroid/view/View;)V

    return-void
.end method

.method public a(Ljava/util/ArrayList;Landroid/view/View;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;",
            "Landroid/view/View;",
            ")V"
        }
    .end annotation

    .line 219
    instance-of v0, p2, Landroid/view/ViewGroup;

    if-eqz v0, :cond_2e

    .line 220
    move-object v0, p2

    check-cast v0, Landroid/view/ViewGroup;

    .line 221
    invoke-static {v0}, Lb/h/m/a0;->a(Landroid/view/ViewGroup;)Z

    move-result v1

    if-eqz v1, :cond_17

    .line 222
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_37

    .line 223
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_37

    .line 224
    :cond_17
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result p2

    const/4 v1, 0x0

    :goto_1c
    if-ge v1, p2, :cond_37

    .line 225
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 226
    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v3

    if-nez v3, :cond_2b

    .line 227
    invoke-virtual {p0, p1, v2}, Lb/l/d/b;->a(Ljava/util/ArrayList;Landroid/view/View;)V

    :cond_2b
    add-int/lit8 v1, v1, 0x1

    goto :goto_1c

    .line 228
    :cond_2e
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_37

    .line 229
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_37
    :goto_37
    return-void
.end method

.method public final a(Ljava/util/List;Ljava/util/List;ZLjava/util/Map;)V
    .registers 22
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lb/l/d/b$k;",
            ">;",
            "Ljava/util/List<",
            "Lb/l/d/w$e;",
            ">;Z",
            "Ljava/util/Map<",
            "Lb/l/d/w$e;",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    move-object/from16 v7, p0

    .line 25
    invoke-virtual/range {p0 .. p0}, Lb/l/d/w;->d()Landroid/view/ViewGroup;

    move-result-object v8

    .line 26
    invoke-virtual {v8}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v9

    .line 27
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 28
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v11

    const/4 v0, 0x0

    :goto_14
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const-string v2, "FragmentManager"

    const/4 v3, 0x2

    if-eqz v1, :cond_b9

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v14, v1

    check-cast v14, Lb/l/d/b$k;

    .line 29
    invoke-virtual {v14}, Lb/l/d/b$l;->d()Z

    move-result v1

    if-eqz v1, :cond_30

    .line 30
    invoke-virtual {v14}, Lb/l/d/b$l;->a()V

    :goto_2d
    move-object/from16 v6, p4

    goto :goto_14

    .line 31
    :cond_30
    invoke-virtual {v14, v9}, Lb/l/d/b$k;->a(Landroid/content/Context;)Lb/l/d/d$d;

    move-result-object v1

    if-nez v1, :cond_3a

    .line 32
    invoke-virtual {v14}, Lb/l/d/b$l;->a()V

    goto :goto_2d

    .line 33
    :cond_3a
    iget-object v15, v1, Lb/l/d/d$d;->b:Landroid/animation/Animator;

    if-nez v15, :cond_42

    .line 34
    invoke-virtual {v10, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2d

    .line 35
    :cond_42
    invoke-virtual {v14}, Lb/l/d/b$l;->b()Lb/l/d/w$e;

    move-result-object v5

    .line 36
    invoke-virtual {v5}, Lb/l/d/w$e;->d()Landroidx/fragment/app/Fragment;

    move-result-object v1

    .line 37
    sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move-object/from16 v6, p4

    invoke-interface {v6, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    invoke-virtual {v4, v12}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_7b

    .line 38
    invoke-static {v3}, Landroidx/fragment/app/FragmentManager;->d(I)Z

    move-result v3

    if-eqz v3, :cond_77

    .line 39
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Ignoring Animator set on "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " as this Fragment was involved in a Transition."

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 40
    :cond_77
    invoke-virtual {v14}, Lb/l/d/b$l;->a()V

    goto :goto_14

    .line 41
    :cond_7b
    invoke-virtual {v5}, Lb/l/d/w$e;->c()Lb/l/d/w$e$c;

    move-result-object v0

    sget-object v2, Lb/l/d/w$e$c;->GONE:Lb/l/d/w$e$c;

    if-ne v0, v2, :cond_85

    const/4 v4, 0x1

    goto :goto_86

    :cond_85
    const/4 v4, 0x0

    :goto_86
    move-object/from16 v12, p2

    if-eqz v4, :cond_8d

    .line 42
    invoke-interface {v12, v5}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 43
    :cond_8d
    iget-object v3, v1, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    .line 44
    invoke-virtual {v8, v3}, Landroid/view/ViewGroup;->startViewTransition(Landroid/view/View;)V

    .line 45
    new-instance v2, Lb/l/d/b$c;

    move-object v0, v2

    move-object/from16 v1, p0

    move-object v13, v2

    move-object v2, v8

    move-object/from16 v16, v3

    move-object v6, v14

    invoke-direct/range {v0 .. v6}, Lb/l/d/b$c;-><init>(Lb/l/d/b;Landroid/view/ViewGroup;Landroid/view/View;ZLb/l/d/w$e;Lb/l/d/b$k;)V

    invoke-virtual {v15, v13}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    move-object/from16 v0, v16

    .line 46
    invoke-virtual {v15, v0}, Landroid/animation/Animator;->setTarget(Ljava/lang/Object;)V

    .line 47
    invoke-virtual {v15}, Landroid/animation/Animator;->start()V

    .line 48
    invoke-virtual {v14}, Lb/l/d/b$l;->c()Lb/h/i/b;

    move-result-object v0

    .line 49
    new-instance v1, Lb/l/d/b$d;

    invoke-direct {v1, v7, v15}, Lb/l/d/b$d;-><init>(Lb/l/d/b;Landroid/animation/Animator;)V

    invoke-virtual {v0, v1}, Lb/h/i/b;->a(Lb/h/i/b$a;)V

    const/4 v0, 0x1

    goto/16 :goto_14

    .line 50
    :cond_b9
    invoke-virtual {v10}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_bd
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_15b

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lb/l/d/b$k;

    .line 51
    invoke-virtual {v4}, Lb/l/d/b$l;->b()Lb/l/d/w$e;

    move-result-object v5

    .line 52
    invoke-virtual {v5}, Lb/l/d/w$e;->d()Landroidx/fragment/app/Fragment;

    move-result-object v6

    const-string v10, "Ignoring Animation set on "

    if-eqz p3, :cond_f6

    .line 53
    invoke-static {v3}, Landroidx/fragment/app/FragmentManager;->d(I)Z

    move-result v5

    if-eqz v5, :cond_f2

    .line 54
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v6, " as Animations cannot run alongside Transitions."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v2, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 55
    :cond_f2
    invoke-virtual {v4}, Lb/l/d/b$l;->a()V

    goto :goto_bd

    :cond_f6
    if-eqz v0, :cond_119

    .line 56
    invoke-static {v3}, Landroidx/fragment/app/FragmentManager;->d(I)Z

    move-result v5

    if-eqz v5, :cond_115

    .line 57
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v6, " as Animations cannot run alongside Animators."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v2, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 58
    :cond_115
    invoke-virtual {v4}, Lb/l/d/b$l;->a()V

    goto :goto_bd

    .line 59
    :cond_119
    iget-object v6, v6, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    .line 60
    invoke-virtual {v4, v9}, Lb/l/d/b$k;->a(Landroid/content/Context;)Lb/l/d/d$d;

    move-result-object v10

    invoke-static {v10}, Lb/h/l/h;->a(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast v10, Lb/l/d/d$d;

    iget-object v10, v10, Lb/l/d/d$d;->a:Landroid/view/animation/Animation;

    .line 61
    invoke-static {v10}, Lb/h/l/h;->a(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast v10, Landroid/view/animation/Animation;

    .line 62
    invoke-virtual {v5}, Lb/l/d/w$e;->c()Lb/l/d/w$e$c;

    move-result-object v5

    .line 63
    sget-object v11, Lb/l/d/w$e$c;->REMOVED:Lb/l/d/w$e$c;

    if-eq v5, v11, :cond_13a

    .line 64
    invoke-virtual {v6, v10}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 65
    invoke-virtual {v4}, Lb/l/d/b$l;->a()V

    goto :goto_14d

    .line 66
    :cond_13a
    invoke-virtual {v8, v6}, Landroid/view/ViewGroup;->startViewTransition(Landroid/view/View;)V

    .line 67
    new-instance v5, Lb/l/d/d$e;

    invoke-direct {v5, v10, v8, v6}, Lb/l/d/d$e;-><init>(Landroid/view/animation/Animation;Landroid/view/ViewGroup;Landroid/view/View;)V

    .line 68
    new-instance v10, Lb/l/d/b$e;

    invoke-direct {v10, v7, v8, v6, v4}, Lb/l/d/b$e;-><init>(Lb/l/d/b;Landroid/view/ViewGroup;Landroid/view/View;Lb/l/d/b$k;)V

    invoke-virtual {v5, v10}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 69
    invoke-virtual {v6, v5}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 70
    :goto_14d
    invoke-virtual {v4}, Lb/l/d/b$l;->c()Lb/h/i/b;

    move-result-object v5

    .line 71
    new-instance v10, Lb/l/d/b$f;

    invoke-direct {v10, v7, v6, v8, v4}, Lb/l/d/b$f;-><init>(Lb/l/d/b;Landroid/view/View;Landroid/view/ViewGroup;Lb/l/d/b$k;)V

    invoke-virtual {v5, v10}, Lb/h/i/b;->a(Lb/h/i/b$a;)V

    goto/16 :goto_bd

    :cond_15b
    return-void
.end method

.method public a(Ljava/util/List;Z)V
    .registers 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lb/l/d/w$e;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v1, 0x0

    move-object v6, v1

    move-object v7, v6

    :cond_7
    :goto_7
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const/4 v8, 0x1

    if-eqz v1, :cond_44

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/l/d/w$e;

    .line 2
    invoke-virtual {v1}, Lb/l/d/w$e;->d()Landroidx/fragment/app/Fragment;

    move-result-object v2

    iget-object v2, v2, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    invoke-static {v2}, Lb/l/d/w$e$c;->from(Landroid/view/View;)Lb/l/d/w$e$c;

    move-result-object v2

    .line 3
    sget-object v3, Lb/l/d/b$a;->a:[I

    invoke-virtual {v1}, Lb/l/d/w$e;->c()Lb/l/d/w$e$c;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    move-result v4

    aget v3, v3, v4

    if-eq v3, v8, :cond_3c

    const/4 v4, 0x2

    if-eq v3, v4, :cond_3c

    const/4 v4, 0x3

    if-eq v3, v4, :cond_3c

    const/4 v4, 0x4

    if-eq v3, v4, :cond_36

    goto :goto_7

    .line 4
    :cond_36
    sget-object v3, Lb/l/d/w$e$c;->VISIBLE:Lb/l/d/w$e$c;

    if-eq v2, v3, :cond_7

    move-object v7, v1

    goto :goto_7

    .line 5
    :cond_3c
    sget-object v3, Lb/l/d/w$e$c;->VISIBLE:Lb/l/d/w$e$c;

    if-ne v2, v3, :cond_7

    if-nez v6, :cond_7

    move-object v6, v1

    goto :goto_7

    .line 6
    :cond_44
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 8
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 9
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_57
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_95

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb/l/d/w$e;

    .line 10
    new-instance v4, Lb/h/i/b;

    invoke-direct {v4}, Lb/h/i/b;-><init>()V

    .line 11
    invoke-virtual {v2, v4}, Lb/l/d/w$e;->b(Lb/h/i/b;)V

    .line 12
    new-instance v5, Lb/l/d/b$k;

    invoke-direct {v5, v2, v4, p2}, Lb/l/d/b$k;-><init>(Lb/l/d/w$e;Lb/h/i/b;Z)V

    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 13
    new-instance v4, Lb/h/i/b;

    invoke-direct {v4}, Lb/h/i/b;-><init>()V

    .line 14
    invoke-virtual {v2, v4}, Lb/l/d/w$e;->b(Lb/h/i/b;)V

    .line 15
    new-instance v5, Lb/l/d/b$m;

    const/4 v9, 0x0

    if-eqz p2, :cond_83

    if-ne v2, v6, :cond_86

    goto :goto_85

    :cond_83
    if-ne v2, v7, :cond_86

    :goto_85
    const/4 v9, 0x1

    .line 16
    :cond_86
    invoke-direct {v5, v2, v4, p2, v9}, Lb/l/d/b$m;-><init>(Lb/l/d/w$e;Lb/h/i/b;ZZ)V

    .line 17
    invoke-interface {v3, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 18
    new-instance v4, Lb/l/d/b$b;

    invoke-direct {v4, p0, v1, v2}, Lb/l/d/b$b;-><init>(Lb/l/d/b;Ljava/util/List;Lb/l/d/w$e;)V

    invoke-virtual {v2, v4}, Lb/l/d/w$e;->a(Ljava/lang/Runnable;)V

    goto :goto_57

    :cond_95
    move-object v2, p0

    move-object v4, v1

    move v5, p2

    .line 19
    invoke-virtual/range {v2 .. v7}, Lb/l/d/b;->a(Ljava/util/List;Ljava/util/List;ZLb/l/d/w$e;Lb/l/d/w$e;)Ljava/util/Map;

    move-result-object p1

    .line 20
    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    invoke-interface {p1, p2}, Ljava/util/Map;->containsValue(Ljava/lang/Object;)Z

    move-result p2

    .line 21
    invoke-virtual {p0, v0, v1, p2, p1}, Lb/l/d/b;->a(Ljava/util/List;Ljava/util/List;ZLjava/util/Map;)V

    .line 22
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_ab
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_bb

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lb/l/d/w$e;

    .line 23
    invoke-virtual {p0, p2}, Lb/l/d/b;->a(Lb/l/d/w$e;)V

    goto :goto_ab

    .line 24
    :cond_bb
    invoke-interface {v1}, Ljava/util/List;->clear()V

    return-void
.end method

.method public a(Ljava/util/Map;Landroid/view/View;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Landroid/view/View;",
            ">;",
            "Landroid/view/View;",
            ")V"
        }
    .end annotation

    .line 230
    invoke-static {p2}, Lb/h/m/y;->B(Landroid/view/View;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_9

    .line 231
    invoke-interface {p1, v0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 232
    :cond_9
    instance-of v0, p2, Landroid/view/ViewGroup;

    if-eqz v0, :cond_26

    .line 233
    check-cast p2, Landroid/view/ViewGroup;

    .line 234
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    :goto_14
    if-ge v1, v0, :cond_26

    .line 235
    invoke-virtual {p2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 236
    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v3

    if-nez v3, :cond_23

    .line 237
    invoke-virtual {p0, p1, v2}, Lb/l/d/b;->a(Ljava/util/Map;Landroid/view/View;)V

    :cond_23
    add-int/lit8 v1, v1, 0x1

    goto :goto_14

    :cond_26
    return-void
.end method
