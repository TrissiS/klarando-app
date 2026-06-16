.class public final Lb/l/d/a;
.super Lb/l/d/q;
.source "BackStackRecord.java"

# interfaces
.implements Landroidx/fragment/app/FragmentManager$n;


# instance fields
.field public final q:Landroidx/fragment/app/FragmentManager;

.field public r:Z

.field public s:I


# direct methods
.method public constructor <init>(Landroidx/fragment/app/FragmentManager;)V
    .registers 4

    .line 1
    invoke-virtual {p1}, Landroidx/fragment/app/FragmentManager;->y()Lb/l/d/g;

    move-result-object v0

    invoke-virtual {p1}, Landroidx/fragment/app/FragmentManager;->B()Lb/l/d/h;

    move-result-object v1

    if-eqz v1, :cond_17

    .line 2
    invoke-virtual {p1}, Landroidx/fragment/app/FragmentManager;->B()Lb/l/d/h;

    move-result-object v1

    invoke-virtual {v1}, Lb/l/d/h;->h()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    goto :goto_18

    :cond_17
    const/4 v1, 0x0

    .line 3
    :goto_18
    invoke-direct {p0, v0, v1}, Lb/l/d/q;-><init>(Lb/l/d/g;Ljava/lang/ClassLoader;)V

    const/4 v0, -0x1

    .line 4
    iput v0, p0, Lb/l/d/a;->s:I

    .line 5
    iput-object p1, p0, Lb/l/d/a;->q:Landroidx/fragment/app/FragmentManager;

    return-void
.end method

.method public static b(Lb/l/d/q$a;)Z
    .registers 2

    .line 30
    iget-object p0, p0, Lb/l/d/q$a;->b:Landroidx/fragment/app/Fragment;

    if-eqz p0, :cond_1c

    .line 31
    iget-boolean v0, p0, Landroidx/fragment/app/Fragment;->s:Z

    if-eqz v0, :cond_1c

    iget-object v0, p0, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    if-eqz v0, :cond_1c

    iget-boolean v0, p0, Landroidx/fragment/app/Fragment;->H:Z

    if-nez v0, :cond_1c

    iget-boolean v0, p0, Landroidx/fragment/app/Fragment;->G:Z

    if-nez v0, :cond_1c

    .line 32
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->U()Z

    move-result p0

    if-eqz p0, :cond_1c

    const/4 p0, 0x1

    goto :goto_1d

    :cond_1c
    const/4 p0, 0x0

    :goto_1d
    return p0
.end method


# virtual methods
.method public a()I
    .registers 2

    const/4 v0, 0x0

    .line 58
    invoke-virtual {p0, v0}, Lb/l/d/a;->b(Z)I

    move-result v0

    return v0
.end method

.method public a(Ljava/util/ArrayList;Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/Fragment;
    .registers 19
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Landroidx/fragment/app/Fragment;",
            ">;",
            "Landroidx/fragment/app/Fragment;",
            ")",
            "Landroidx/fragment/app/Fragment;"
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v3, p2

    const/4 v4, 0x0

    .line 73
    :goto_7
    iget-object v5, v0, Lb/l/d/q;->a:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v4, v5, :cond_ba

    .line 74
    iget-object v5, v0, Lb/l/d/q;->a:Ljava/util/ArrayList;

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lb/l/d/q$a;

    .line 75
    iget v6, v5, Lb/l/d/q$a;->a:I

    const/4 v7, 0x0

    const/4 v8, 0x1

    if-eq v6, v8, :cond_b2

    const/4 v9, 0x2

    const/4 v10, 0x3

    const/16 v11, 0x9

    if-eq v6, v9, :cond_58

    if-eq v6, v10, :cond_41

    const/4 v9, 0x6

    if-eq v6, v9, :cond_41

    const/4 v7, 0x7

    if-eq v6, v7, :cond_b2

    const/16 v7, 0x8

    if-eq v6, v7, :cond_31

    goto/16 :goto_b7

    .line 76
    :cond_31
    iget-object v6, v0, Lb/l/d/q;->a:Ljava/util/ArrayList;

    new-instance v7, Lb/l/d/q$a;

    invoke-direct {v7, v11, v3}, Lb/l/d/q$a;-><init>(ILandroidx/fragment/app/Fragment;)V

    invoke-virtual {v6, v4, v7}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    add-int/lit8 v4, v4, 0x1

    .line 77
    iget-object v3, v5, Lb/l/d/q$a;->b:Landroidx/fragment/app/Fragment;

    goto/16 :goto_b7

    .line 78
    :cond_41
    iget-object v6, v5, Lb/l/d/q$a;->b:Landroidx/fragment/app/Fragment;

    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 79
    iget-object v5, v5, Lb/l/d/q$a;->b:Landroidx/fragment/app/Fragment;

    if-ne v5, v3, :cond_b7

    .line 80
    iget-object v3, v0, Lb/l/d/q;->a:Ljava/util/ArrayList;

    new-instance v6, Lb/l/d/q$a;

    invoke-direct {v6, v11, v5}, Lb/l/d/q$a;-><init>(ILandroidx/fragment/app/Fragment;)V

    invoke-virtual {v3, v4, v6}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    add-int/lit8 v4, v4, 0x1

    move-object v3, v7

    goto :goto_b7

    .line 81
    :cond_58
    iget-object v6, v5, Lb/l/d/q$a;->b:Landroidx/fragment/app/Fragment;

    .line 82
    iget v9, v6, Landroidx/fragment/app/Fragment;->E:I

    .line 83
    invoke-virtual/range {p1 .. p1}, Ljava/util/ArrayList;->size()I

    move-result v12

    sub-int/2addr v12, v8

    const/4 v13, 0x0

    :goto_62
    if-ltz v12, :cond_a2

    .line 84
    invoke-virtual {v1, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Landroidx/fragment/app/Fragment;

    .line 85
    iget v15, v14, Landroidx/fragment/app/Fragment;->E:I

    if-ne v15, v9, :cond_9f

    if-ne v14, v6, :cond_72

    const/4 v13, 0x1

    goto :goto_9f

    :cond_72
    if-ne v14, v3, :cond_81

    .line 86
    iget-object v3, v0, Lb/l/d/q;->a:Ljava/util/ArrayList;

    new-instance v15, Lb/l/d/q$a;

    invoke-direct {v15, v11, v14}, Lb/l/d/q$a;-><init>(ILandroidx/fragment/app/Fragment;)V

    invoke-virtual {v3, v4, v15}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    add-int/lit8 v4, v4, 0x1

    move-object v3, v7

    .line 87
    :cond_81
    new-instance v15, Lb/l/d/q$a;

    invoke-direct {v15, v10, v14}, Lb/l/d/q$a;-><init>(ILandroidx/fragment/app/Fragment;)V

    .line 88
    iget v2, v5, Lb/l/d/q$a;->c:I

    iput v2, v15, Lb/l/d/q$a;->c:I

    .line 89
    iget v2, v5, Lb/l/d/q$a;->e:I

    iput v2, v15, Lb/l/d/q$a;->e:I

    .line 90
    iget v2, v5, Lb/l/d/q$a;->d:I

    iput v2, v15, Lb/l/d/q$a;->d:I

    .line 91
    iget v2, v5, Lb/l/d/q$a;->f:I

    iput v2, v15, Lb/l/d/q$a;->f:I

    .line 92
    iget-object v2, v0, Lb/l/d/q;->a:Ljava/util/ArrayList;

    invoke-virtual {v2, v4, v15}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 93
    invoke-virtual {v1, v14}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    add-int/2addr v4, v8

    :cond_9f
    :goto_9f
    add-int/lit8 v12, v12, -0x1

    goto :goto_62

    :cond_a2
    if-eqz v13, :cond_ac

    .line 94
    iget-object v2, v0, Lb/l/d/q;->a:Ljava/util/ArrayList;

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    add-int/lit8 v4, v4, -0x1

    goto :goto_b7

    .line 95
    :cond_ac
    iput v8, v5, Lb/l/d/q$a;->a:I

    .line 96
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_b7

    .line 97
    :cond_b2
    iget-object v2, v5, Lb/l/d/q$a;->b:Landroidx/fragment/app/Fragment;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_b7
    :goto_b7
    add-int/2addr v4, v8

    goto/16 :goto_7

    :cond_ba
    return-object v3
.end method

.method public a(I)V
    .registers 9

    .line 49
    iget-boolean v0, p0, Lb/l/d/q;->g:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x2

    .line 50
    invoke-static {v0}, Landroidx/fragment/app/FragmentManager;->d(I)Z

    move-result v1

    const-string v2, "FragmentManager"

    if-eqz v1, :cond_2a

    .line 51
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Bump nesting in "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, " by "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 52
    :cond_2a
    iget-object v1, p0, Lb/l/d/q;->a:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v3, 0x0

    :goto_31
    if-ge v3, v1, :cond_6f

    .line 53
    iget-object v4, p0, Lb/l/d/q;->a:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lb/l/d/q$a;

    .line 54
    iget-object v5, v4, Lb/l/d/q$a;->b:Landroidx/fragment/app/Fragment;

    if-eqz v5, :cond_6c

    .line 55
    iget v6, v5, Landroidx/fragment/app/Fragment;->y:I

    add-int/2addr v6, p1

    iput v6, v5, Landroidx/fragment/app/Fragment;->y:I

    .line 56
    invoke-static {v0}, Landroidx/fragment/app/FragmentManager;->d(I)Z

    move-result v5

    if-eqz v5, :cond_6c

    .line 57
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Bump nesting of "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, v4, Lb/l/d/q$a;->b:Landroidx/fragment/app/Fragment;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v6, " to "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, v4, Lb/l/d/q$a;->b:Landroidx/fragment/app/Fragment;

    iget v4, v4, Landroidx/fragment/app/Fragment;->y:I

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_6c
    add-int/lit8 v3, v3, 0x1

    goto :goto_31

    :cond_6f
    return-void
.end method

.method public a(ILandroidx/fragment/app/Fragment;Ljava/lang/String;I)V
    .registers 5

    .line 47
    invoke-super {p0, p1, p2, p3, p4}, Lb/l/d/q;->a(ILandroidx/fragment/app/Fragment;Ljava/lang/String;I)V

    .line 48
    iget-object p1, p0, Lb/l/d/a;->q:Landroidx/fragment/app/FragmentManager;

    iput-object p1, p2, Landroidx/fragment/app/Fragment;->z:Landroidx/fragment/app/FragmentManager;

    return-void
.end method

.method public a(Landroidx/fragment/app/Fragment$h;)V
    .registers 5

    const/4 v0, 0x0

    .line 98
    :goto_1
    iget-object v1, p0, Lb/l/d/q;->a:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_1f

    .line 99
    iget-object v1, p0, Lb/l/d/q;->a:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/l/d/q$a;

    .line 100
    invoke-static {v1}, Lb/l/d/a;->b(Lb/l/d/q$a;)Z

    move-result v2

    if-eqz v2, :cond_1c

    .line 101
    iget-object v1, v1, Lb/l/d/q$a;->b:Landroidx/fragment/app/Fragment;

    invoke-virtual {v1, p1}, Landroidx/fragment/app/Fragment;->a(Landroidx/fragment/app/Fragment$h;)V

    :cond_1c
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_1f
    return-void
.end method

.method public a(Ljava/lang/String;Ljava/io/PrintWriter;)V
    .registers 4

    const/4 v0, 0x1

    .line 1
    invoke-virtual {p0, p1, p2, v0}, Lb/l/d/a;->a(Ljava/lang/String;Ljava/io/PrintWriter;Z)V

    return-void
.end method

.method public a(Ljava/lang/String;Ljava/io/PrintWriter;Z)V
    .registers 9

    if-eqz p3, :cond_cc

    .line 2
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mName="

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v0, p0, Lb/l/d/q;->h:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, " mIndex="

    .line 3
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lb/l/d/a;->s:I

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(I)V

    const-string v0, " mCommitted="

    .line 4
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Lb/l/d/a;->r:Z

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Z)V

    .line 5
    iget v0, p0, Lb/l/d/q;->f:I

    if-eqz v0, :cond_38

    .line 6
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mTransition=#"

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 7
    iget v0, p0, Lb/l/d/q;->f:I

    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 8
    :cond_38
    iget v0, p0, Lb/l/d/q;->b:I

    if-nez v0, :cond_40

    iget v0, p0, Lb/l/d/q;->c:I

    if-eqz v0, :cond_5f

    .line 9
    :cond_40
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mEnterAnim=#"

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 10
    iget v0, p0, Lb/l/d/q;->b:I

    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, " mExitAnim=#"

    .line 11
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 12
    iget v0, p0, Lb/l/d/q;->c:I

    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 13
    :cond_5f
    iget v0, p0, Lb/l/d/q;->d:I

    if-nez v0, :cond_67

    iget v0, p0, Lb/l/d/q;->e:I

    if-eqz v0, :cond_86

    .line 14
    :cond_67
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mPopEnterAnim=#"

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 15
    iget v0, p0, Lb/l/d/q;->d:I

    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, " mPopExitAnim=#"

    .line 16
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 17
    iget v0, p0, Lb/l/d/q;->e:I

    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 18
    :cond_86
    iget v0, p0, Lb/l/d/q;->i:I

    if-nez v0, :cond_8e

    iget-object v0, p0, Lb/l/d/q;->j:Ljava/lang/CharSequence;

    if-eqz v0, :cond_a9

    .line 19
    :cond_8e
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mBreadCrumbTitleRes=#"

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 20
    iget v0, p0, Lb/l/d/q;->i:I

    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, " mBreadCrumbTitleText="

    .line 21
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 22
    iget-object v0, p0, Lb/l/d/q;->j:Ljava/lang/CharSequence;

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 23
    :cond_a9
    iget v0, p0, Lb/l/d/q;->k:I

    if-nez v0, :cond_b1

    iget-object v0, p0, Lb/l/d/q;->l:Ljava/lang/CharSequence;

    if-eqz v0, :cond_cc

    .line 24
    :cond_b1
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mBreadCrumbShortTitleRes=#"

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 25
    iget v0, p0, Lb/l/d/q;->k:I

    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, " mBreadCrumbShortTitleText="

    .line 26
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 27
    iget-object v0, p0, Lb/l/d/q;->l:Ljava/lang/CharSequence;

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 28
    :cond_cc
    iget-object v0, p0, Lb/l/d/q;->a:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_197

    .line 29
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "Operations:"

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 30
    iget-object v0, p0, Lb/l/d/q;->a:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_e3
    if-ge v1, v0, :cond_197

    .line 31
    iget-object v2, p0, Lb/l/d/q;->a:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb/l/d/q$a;

    .line 32
    iget v3, v2, Lb/l/d/q$a;->a:I

    packed-switch v3, :pswitch_data_198

    .line 33
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "cmd="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v4, v2, Lb/l/d/q$a;->a:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_126

    :pswitch_106
    const-string v3, "OP_SET_MAX_LIFECYCLE"

    goto :goto_126

    :pswitch_109
    const-string v3, "UNSET_PRIMARY_NAV"

    goto :goto_126

    :pswitch_10c
    const-string v3, "SET_PRIMARY_NAV"

    goto :goto_126

    :pswitch_10f
    const-string v3, "ATTACH"

    goto :goto_126

    :pswitch_112
    const-string v3, "DETACH"

    goto :goto_126

    :pswitch_115
    const-string v3, "SHOW"

    goto :goto_126

    :pswitch_118
    const-string v3, "HIDE"

    goto :goto_126

    :pswitch_11b
    const-string v3, "REMOVE"

    goto :goto_126

    :pswitch_11e
    const-string v3, "REPLACE"

    goto :goto_126

    :pswitch_121
    const-string v3, "ADD"

    goto :goto_126

    :pswitch_124
    const-string v3, "NULL"

    .line 34
    :goto_126
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v4, "  Op #"

    invoke-virtual {p2, v4}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(I)V

    const-string v4, ": "

    .line 35
    invoke-virtual {p2, v4}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    invoke-virtual {p2, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v3, " "

    .line 36
    invoke-virtual {p2, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v3, v2, Lb/l/d/q$a;->b:Landroidx/fragment/app/Fragment;

    invoke-virtual {p2, v3}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    if-eqz p3, :cond_193

    .line 37
    iget v3, v2, Lb/l/d/q$a;->c:I

    if-nez v3, :cond_14d

    iget v3, v2, Lb/l/d/q$a;->d:I

    if-eqz v3, :cond_16c

    .line 38
    :cond_14d
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v3, "enterAnim=#"

    invoke-virtual {p2, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 39
    iget v3, v2, Lb/l/d/q$a;->c:I

    invoke-static {v3}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v3, " exitAnim=#"

    .line 40
    invoke-virtual {p2, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 41
    iget v3, v2, Lb/l/d/q$a;->d:I

    invoke-static {v3}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2, v3}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 42
    :cond_16c
    iget v3, v2, Lb/l/d/q$a;->e:I

    if-nez v3, :cond_174

    iget v3, v2, Lb/l/d/q$a;->f:I

    if-eqz v3, :cond_193

    .line 43
    :cond_174
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v3, "popEnterAnim=#"

    invoke-virtual {p2, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 44
    iget v3, v2, Lb/l/d/q$a;->e:I

    invoke-static {v3}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v3, " popExitAnim=#"

    .line 45
    invoke-virtual {p2, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 46
    iget v2, v2, Lb/l/d/q$a;->f:I

    invoke-static {v2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    :cond_193
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_e3

    :cond_197
    return-void

    :pswitch_data_198
    .packed-switch 0x0
        :pswitch_124
        :pswitch_121
        :pswitch_11e
        :pswitch_11b
        :pswitch_118
        :pswitch_115
        :pswitch_112
        :pswitch_10f
        :pswitch_10c
        :pswitch_109
        :pswitch_106
    .end packed-switch
.end method

.method public a(Ljava/util/ArrayList;II)Z
    .registers 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lb/l/d/a;",
            ">;II)Z"
        }
    .end annotation

    const/4 v0, 0x0

    if-ne p3, p2, :cond_4

    return v0

    .line 65
    :cond_4
    iget-object v1, p0, Lb/l/d/q;->a:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, -0x1

    const/4 v3, 0x0

    :goto_c
    if-ge v3, v1, :cond_52

    .line 66
    iget-object v4, p0, Lb/l/d/q;->a:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lb/l/d/q$a;

    .line 67
    iget-object v4, v4, Lb/l/d/q$a;->b:Landroidx/fragment/app/Fragment;

    if-eqz v4, :cond_1d

    iget v4, v4, Landroidx/fragment/app/Fragment;->E:I

    goto :goto_1e

    :cond_1d
    const/4 v4, 0x0

    :goto_1e
    if-eqz v4, :cond_4f

    if-eq v4, v2, :cond_4f

    move v2, p2

    :goto_23
    if-ge v2, p3, :cond_4e

    .line 68
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lb/l/d/a;

    .line 69
    iget-object v6, v5, Lb/l/d/q;->a:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    const/4 v7, 0x0

    :goto_32
    if-ge v7, v6, :cond_4b

    .line 70
    iget-object v8, v5, Lb/l/d/q;->a:Ljava/util/ArrayList;

    invoke-virtual {v8, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lb/l/d/q$a;

    .line 71
    iget-object v8, v8, Lb/l/d/q$a;->b:Landroidx/fragment/app/Fragment;

    if-eqz v8, :cond_43

    .line 72
    iget v8, v8, Landroidx/fragment/app/Fragment;->E:I

    goto :goto_44

    :cond_43
    const/4 v8, 0x0

    :goto_44
    if-ne v8, v4, :cond_48

    const/4 p1, 0x1

    return p1

    :cond_48
    add-int/lit8 v7, v7, 0x1

    goto :goto_32

    :cond_4b
    add-int/lit8 v2, v2, 0x1

    goto :goto_23

    :cond_4e
    move v2, v4

    :cond_4f
    add-int/lit8 v3, v3, 0x1

    goto :goto_c

    :cond_52
    return v0
.end method

.method public a(Ljava/util/ArrayList;Ljava/util/ArrayList;)Z
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lb/l/d/a;",
            ">;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Boolean;",
            ">;)Z"
        }
    .end annotation

    const/4 v0, 0x2

    .line 59
    invoke-static {v0}, Landroidx/fragment/app/FragmentManager;->d(I)Z

    move-result v0

    if-eqz v0, :cond_1d

    .line 60
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Run: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "FragmentManager"

    invoke-static {v1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 61
    :cond_1d
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 p1, 0x0

    .line 62
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 63
    iget-boolean p1, p0, Lb/l/d/q;->g:Z

    if-eqz p1, :cond_31

    .line 64
    iget-object p1, p0, Lb/l/d/a;->q:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {p1, p0}, Landroidx/fragment/app/FragmentManager;->a(Lb/l/d/a;)V

    :cond_31
    const/4 p1, 0x1

    return p1
.end method

.method public b()I
    .registers 2

    const/4 v0, 0x1

    .line 5
    invoke-virtual {p0, v0}, Lb/l/d/a;->b(Z)I

    move-result v0

    return v0
.end method

.method public b(Z)I
    .registers 4

    .line 6
    iget-boolean v0, p0, Lb/l/d/a;->r:Z

    if-nez v0, :cond_4e

    const/4 v0, 0x2

    .line 7
    invoke-static {v0}, Landroidx/fragment/app/FragmentManager;->d(I)Z

    move-result v0

    if-eqz v0, :cond_33

    .line 8
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Commit: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "FragmentManager"

    invoke-static {v1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 9
    new-instance v0, Lb/l/d/v;

    invoke-direct {v0, v1}, Lb/l/d/v;-><init>(Ljava/lang/String;)V

    .line 10
    new-instance v1, Ljava/io/PrintWriter;

    invoke-direct {v1, v0}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    const-string v0, "  "

    .line 11
    invoke-virtual {p0, v0, v1}, Lb/l/d/a;->a(Ljava/lang/String;Ljava/io/PrintWriter;)V

    .line 12
    invoke-virtual {v1}, Ljava/io/PrintWriter;->close()V

    :cond_33
    const/4 v0, 0x1

    .line 13
    iput-boolean v0, p0, Lb/l/d/a;->r:Z

    .line 14
    iget-boolean v0, p0, Lb/l/d/q;->g:Z

    if-eqz v0, :cond_43

    .line 15
    iget-object v0, p0, Lb/l/d/a;->q:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->a()I

    move-result v0

    iput v0, p0, Lb/l/d/a;->s:I

    goto :goto_46

    :cond_43
    const/4 v0, -0x1

    .line 16
    iput v0, p0, Lb/l/d/a;->s:I

    .line 17
    :goto_46
    iget-object v0, p0, Lb/l/d/a;->q:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v0, p0, p1}, Landroidx/fragment/app/FragmentManager;->a(Landroidx/fragment/app/FragmentManager$n;Z)V

    .line 18
    iget p1, p0, Lb/l/d/a;->s:I

    return p1

    .line 19
    :cond_4e
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "commit already called"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public b(Ljava/util/ArrayList;Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/Fragment;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Landroidx/fragment/app/Fragment;",
            ">;",
            "Landroidx/fragment/app/Fragment;",
            ")",
            "Landroidx/fragment/app/Fragment;"
        }
    .end annotation

    .line 23
    iget-object v0, p0, Lb/l/d/q;->a:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    :goto_8
    if-ltz v0, :cond_35

    .line 24
    iget-object v2, p0, Lb/l/d/q;->a:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb/l/d/q$a;

    .line 25
    iget v3, v2, Lb/l/d/q$a;->a:I

    if-eq v3, v1, :cond_2d

    const/4 v4, 0x3

    if-eq v3, v4, :cond_27

    packed-switch v3, :pswitch_data_36

    goto :goto_32

    .line 26
    :pswitch_1d
    iget-object v3, v2, Lb/l/d/q$a;->g:Lb/n/e$c;

    iput-object v3, v2, Lb/l/d/q$a;->h:Lb/n/e$c;

    goto :goto_32

    .line 27
    :pswitch_22
    iget-object p2, v2, Lb/l/d/q$a;->b:Landroidx/fragment/app/Fragment;

    goto :goto_32

    :pswitch_25
    const/4 p2, 0x0

    goto :goto_32

    .line 28
    :cond_27
    :pswitch_27
    iget-object v2, v2, Lb/l/d/q$a;->b:Landroidx/fragment/app/Fragment;

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_32

    .line 29
    :cond_2d
    :pswitch_2d
    iget-object v2, v2, Lb/l/d/q$a;->b:Landroidx/fragment/app/Fragment;

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    :goto_32
    add-int/lit8 v0, v0, -0x1

    goto :goto_8

    :cond_35
    return-object p2

    :pswitch_data_36
    .packed-switch 0x6
        :pswitch_27
        :pswitch_2d
        :pswitch_25
        :pswitch_22
        :pswitch_1d
    .end packed-switch
.end method

.method public b(Landroidx/fragment/app/Fragment;)Lb/l/d/q;
    .registers 5

    .line 1
    iget-object v0, p1, Landroidx/fragment/app/Fragment;->z:Landroidx/fragment/app/FragmentManager;

    if-eqz v0, :cond_29

    iget-object v1, p0, Lb/l/d/a;->q:Landroidx/fragment/app/FragmentManager;

    if-ne v0, v1, :cond_9

    goto :goto_29

    .line 2
    :cond_9
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Cannot detach Fragment attached to a different FragmentManager. Fragment "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " is already attached to a FragmentManager."

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 4
    :cond_29
    :goto_29
    invoke-super {p0, p1}, Lb/l/d/q;->b(Landroidx/fragment/app/Fragment;)Lb/l/d/q;

    return-object p0
.end method

.method public b(I)Z
    .registers 6

    .line 20
    iget-object v0, p0, Lb/l/d/q;->a:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_8
    if-ge v2, v0, :cond_23

    .line 21
    iget-object v3, p0, Lb/l/d/q;->a:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lb/l/d/q$a;

    .line 22
    iget-object v3, v3, Lb/l/d/q$a;->b:Landroidx/fragment/app/Fragment;

    if-eqz v3, :cond_19

    iget v3, v3, Landroidx/fragment/app/Fragment;->E:I

    goto :goto_1a

    :cond_19
    const/4 v3, 0x0

    :goto_1a
    if-eqz v3, :cond_20

    if-ne v3, p1, :cond_20

    const/4 p1, 0x1

    return p1

    :cond_20
    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    :cond_23
    return v1
.end method

.method public c(Landroidx/fragment/app/Fragment;)Lb/l/d/q;
    .registers 5

    .line 1
    iget-object v0, p1, Landroidx/fragment/app/Fragment;->z:Landroidx/fragment/app/FragmentManager;

    if-eqz v0, :cond_29

    iget-object v1, p0, Lb/l/d/a;->q:Landroidx/fragment/app/FragmentManager;

    if-ne v0, v1, :cond_9

    goto :goto_29

    .line 2
    :cond_9
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Cannot remove Fragment attached to a different FragmentManager. Fragment "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " is already attached to a FragmentManager."

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 4
    :cond_29
    :goto_29
    invoke-super {p0, p1}, Lb/l/d/q;->c(Landroidx/fragment/app/Fragment;)Lb/l/d/q;

    return-object p0
.end method

.method public c()V
    .registers 3

    .line 5
    invoke-virtual {p0}, Lb/l/d/q;->e()Lb/l/d/q;

    .line 6
    iget-object v0, p0, Lb/l/d/a;->q:Landroidx/fragment/app/FragmentManager;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Landroidx/fragment/app/FragmentManager;->b(Landroidx/fragment/app/FragmentManager$n;Z)V

    return-void
.end method

.method public c(Z)V
    .registers 10

    .line 7
    iget-object v0, p0, Lb/l/d/q;->a:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    :goto_8
    if-ltz v0, :cond_eb

    .line 8
    iget-object v2, p0, Lb/l/d/q;->a:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb/l/d/q$a;

    .line 9
    iget-object v3, v2, Lb/l/d/q$a;->b:Landroidx/fragment/app/Fragment;

    if-eqz v3, :cond_29

    .line 10
    invoke-virtual {v3, v1}, Landroidx/fragment/app/Fragment;->i(Z)V

    .line 11
    iget v4, p0, Lb/l/d/q;->f:I

    invoke-static {v4}, Landroidx/fragment/app/FragmentManager;->e(I)I

    move-result v4

    invoke-virtual {v3, v4}, Landroidx/fragment/app/Fragment;->b(I)V

    .line 12
    iget-object v4, p0, Lb/l/d/q;->n:Ljava/util/ArrayList;

    iget-object v5, p0, Lb/l/d/q;->m:Ljava/util/ArrayList;

    invoke-virtual {v3, v4, v5}, Landroidx/fragment/app/Fragment;->a(Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 13
    :cond_29
    iget v4, v2, Lb/l/d/q$a;->a:I

    packed-switch v4, :pswitch_data_fe

    .line 14
    :pswitch_2e
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Unknown cmd: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, v2, Lb/l/d/q$a;->a:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 15
    :pswitch_47
    iget-object v4, p0, Lb/l/d/a;->q:Landroidx/fragment/app/FragmentManager;

    iget-object v5, v2, Lb/l/d/q$a;->g:Lb/n/e$c;

    invoke-virtual {v4, v3, v5}, Landroidx/fragment/app/FragmentManager;->a(Landroidx/fragment/app/Fragment;Lb/n/e$c;)V

    goto/16 :goto_d3

    .line 16
    :pswitch_50
    iget-object v4, p0, Lb/l/d/a;->q:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v4, v3}, Landroidx/fragment/app/FragmentManager;->u(Landroidx/fragment/app/Fragment;)V

    goto/16 :goto_d3

    .line 17
    :pswitch_57
    iget-object v4, p0, Lb/l/d/a;->q:Landroidx/fragment/app/FragmentManager;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroidx/fragment/app/FragmentManager;->u(Landroidx/fragment/app/Fragment;)V

    goto/16 :goto_d3

    .line 18
    :pswitch_5f
    iget v4, v2, Lb/l/d/q$a;->c:I

    iget v5, v2, Lb/l/d/q$a;->d:I

    iget v6, v2, Lb/l/d/q$a;->e:I

    iget v7, v2, Lb/l/d/q$a;->f:I

    invoke-virtual {v3, v4, v5, v6, v7}, Landroidx/fragment/app/Fragment;->a(IIII)V

    .line 19
    iget-object v4, p0, Lb/l/d/a;->q:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v4, v3, v1}, Landroidx/fragment/app/FragmentManager;->a(Landroidx/fragment/app/Fragment;Z)V

    .line 20
    iget-object v4, p0, Lb/l/d/a;->q:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v4, v3}, Landroidx/fragment/app/FragmentManager;->g(Landroidx/fragment/app/Fragment;)V

    goto :goto_d3

    .line 21
    :pswitch_75
    iget v4, v2, Lb/l/d/q$a;->c:I

    iget v5, v2, Lb/l/d/q$a;->d:I

    iget v6, v2, Lb/l/d/q$a;->e:I

    iget v7, v2, Lb/l/d/q$a;->f:I

    invoke-virtual {v3, v4, v5, v6, v7}, Landroidx/fragment/app/Fragment;->a(IIII)V

    .line 22
    iget-object v4, p0, Lb/l/d/a;->q:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v4, v3}, Landroidx/fragment/app/FragmentManager;->b(Landroidx/fragment/app/Fragment;)V

    goto :goto_d3

    .line 23
    :pswitch_86
    iget v4, v2, Lb/l/d/q$a;->c:I

    iget v5, v2, Lb/l/d/q$a;->d:I

    iget v6, v2, Lb/l/d/q$a;->e:I

    iget v7, v2, Lb/l/d/q$a;->f:I

    invoke-virtual {v3, v4, v5, v6, v7}, Landroidx/fragment/app/Fragment;->a(IIII)V

    .line 24
    iget-object v4, p0, Lb/l/d/a;->q:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v4, v3, v1}, Landroidx/fragment/app/FragmentManager;->a(Landroidx/fragment/app/Fragment;Z)V

    .line 25
    iget-object v4, p0, Lb/l/d/a;->q:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v4, v3}, Landroidx/fragment/app/FragmentManager;->m(Landroidx/fragment/app/Fragment;)V

    goto :goto_d3

    .line 26
    :pswitch_9c
    iget v4, v2, Lb/l/d/q$a;->c:I

    iget v5, v2, Lb/l/d/q$a;->d:I

    iget v6, v2, Lb/l/d/q$a;->e:I

    iget v7, v2, Lb/l/d/q$a;->f:I

    invoke-virtual {v3, v4, v5, v6, v7}, Landroidx/fragment/app/Fragment;->a(IIII)V

    .line 27
    iget-object v4, p0, Lb/l/d/a;->q:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v4, v3}, Landroidx/fragment/app/FragmentManager;->w(Landroidx/fragment/app/Fragment;)V

    goto :goto_d3

    .line 28
    :pswitch_ad
    iget v4, v2, Lb/l/d/q$a;->c:I

    iget v5, v2, Lb/l/d/q$a;->d:I

    iget v6, v2, Lb/l/d/q$a;->e:I

    iget v7, v2, Lb/l/d/q$a;->f:I

    invoke-virtual {v3, v4, v5, v6, v7}, Landroidx/fragment/app/Fragment;->a(IIII)V

    .line 29
    iget-object v4, p0, Lb/l/d/a;->q:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v4, v3}, Landroidx/fragment/app/FragmentManager;->a(Landroidx/fragment/app/Fragment;)Lb/l/d/o;

    goto :goto_d3

    .line 30
    :pswitch_be
    iget v4, v2, Lb/l/d/q$a;->c:I

    iget v5, v2, Lb/l/d/q$a;->d:I

    iget v6, v2, Lb/l/d/q$a;->e:I

    iget v7, v2, Lb/l/d/q$a;->f:I

    invoke-virtual {v3, v4, v5, v6, v7}, Landroidx/fragment/app/Fragment;->a(IIII)V

    .line 31
    iget-object v4, p0, Lb/l/d/a;->q:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v4, v3, v1}, Landroidx/fragment/app/FragmentManager;->a(Landroidx/fragment/app/Fragment;Z)V

    .line 32
    iget-object v4, p0, Lb/l/d/a;->q:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v4, v3}, Landroidx/fragment/app/FragmentManager;->t(Landroidx/fragment/app/Fragment;)V

    .line 33
    :goto_d3
    iget-boolean v4, p0, Lb/l/d/q;->o:Z

    if-nez v4, :cond_e7

    iget v2, v2, Lb/l/d/q$a;->a:I

    const/4 v4, 0x3

    if-eq v2, v4, :cond_e7

    if-eqz v3, :cond_e7

    .line 34
    sget-boolean v2, Landroidx/fragment/app/FragmentManager;->P:Z

    if-nez v2, :cond_e7

    .line 35
    iget-object v2, p0, Lb/l/d/a;->q:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v2, v3}, Landroidx/fragment/app/FragmentManager;->r(Landroidx/fragment/app/Fragment;)V

    :cond_e7
    add-int/lit8 v0, v0, -0x1

    goto/16 :goto_8

    .line 36
    :cond_eb
    iget-boolean v0, p0, Lb/l/d/q;->o:Z

    if-nez v0, :cond_fc

    if-eqz p1, :cond_fc

    sget-boolean p1, Landroidx/fragment/app/FragmentManager;->P:Z

    if-nez p1, :cond_fc

    .line 37
    iget-object p1, p0, Lb/l/d/a;->q:Landroidx/fragment/app/FragmentManager;

    iget v0, p1, Landroidx/fragment/app/FragmentManager;->q:I

    invoke-virtual {p1, v0, v1}, Landroidx/fragment/app/FragmentManager;->a(IZ)V

    :cond_fc
    return-void

    nop

    :pswitch_data_fe
    .packed-switch 0x1
        :pswitch_be
        :pswitch_2e
        :pswitch_ad
        :pswitch_9c
        :pswitch_86
        :pswitch_75
        :pswitch_5f
        :pswitch_57
        :pswitch_50
        :pswitch_47
    .end packed-switch
.end method

.method public d()V
    .registers 3

    .line 1
    invoke-virtual {p0}, Lb/l/d/q;->e()Lb/l/d/q;

    .line 2
    iget-object v0, p0, Lb/l/d/a;->q:Landroidx/fragment/app/FragmentManager;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Landroidx/fragment/app/FragmentManager;->b(Landroidx/fragment/app/FragmentManager$n;Z)V

    return-void
.end method

.method public f()V
    .registers 11

    .line 1
    iget-object v0, p0, Lb/l/d/q;->a:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_8
    const/4 v3, 0x1

    if-ge v2, v0, :cond_e7

    .line 2
    iget-object v4, p0, Lb/l/d/q;->a:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lb/l/d/q$a;

    .line 3
    iget-object v5, v4, Lb/l/d/q$a;->b:Landroidx/fragment/app/Fragment;

    if-eqz v5, :cond_26

    .line 4
    invoke-virtual {v5, v1}, Landroidx/fragment/app/Fragment;->i(Z)V

    .line 5
    iget v6, p0, Lb/l/d/q;->f:I

    invoke-virtual {v5, v6}, Landroidx/fragment/app/Fragment;->b(I)V

    .line 6
    iget-object v6, p0, Lb/l/d/q;->m:Ljava/util/ArrayList;

    iget-object v7, p0, Lb/l/d/q;->n:Ljava/util/ArrayList;

    invoke-virtual {v5, v6, v7}, Landroidx/fragment/app/Fragment;->a(Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 7
    :cond_26
    iget v6, v4, Lb/l/d/q$a;->a:I

    packed-switch v6, :pswitch_data_f8

    .line 8
    :pswitch_2b
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown cmd: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, v4, Lb/l/d/q$a;->a:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 9
    :pswitch_44
    iget-object v6, p0, Lb/l/d/a;->q:Landroidx/fragment/app/FragmentManager;

    iget-object v7, v4, Lb/l/d/q$a;->h:Lb/n/e$c;

    invoke-virtual {v6, v5, v7}, Landroidx/fragment/app/FragmentManager;->a(Landroidx/fragment/app/Fragment;Lb/n/e$c;)V

    goto/16 :goto_d0

    .line 10
    :pswitch_4d
    iget-object v6, p0, Lb/l/d/a;->q:Landroidx/fragment/app/FragmentManager;

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Landroidx/fragment/app/FragmentManager;->u(Landroidx/fragment/app/Fragment;)V

    goto/16 :goto_d0

    .line 11
    :pswitch_55
    iget-object v6, p0, Lb/l/d/a;->q:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v6, v5}, Landroidx/fragment/app/FragmentManager;->u(Landroidx/fragment/app/Fragment;)V

    goto/16 :goto_d0

    .line 12
    :pswitch_5c
    iget v6, v4, Lb/l/d/q$a;->c:I

    iget v7, v4, Lb/l/d/q$a;->d:I

    iget v8, v4, Lb/l/d/q$a;->e:I

    iget v9, v4, Lb/l/d/q$a;->f:I

    invoke-virtual {v5, v6, v7, v8, v9}, Landroidx/fragment/app/Fragment;->a(IIII)V

    .line 13
    iget-object v6, p0, Lb/l/d/a;->q:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v6, v5, v1}, Landroidx/fragment/app/FragmentManager;->a(Landroidx/fragment/app/Fragment;Z)V

    .line 14
    iget-object v6, p0, Lb/l/d/a;->q:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v6, v5}, Landroidx/fragment/app/FragmentManager;->b(Landroidx/fragment/app/Fragment;)V

    goto :goto_d0

    .line 15
    :pswitch_72
    iget v6, v4, Lb/l/d/q$a;->c:I

    iget v7, v4, Lb/l/d/q$a;->d:I

    iget v8, v4, Lb/l/d/q$a;->e:I

    iget v9, v4, Lb/l/d/q$a;->f:I

    invoke-virtual {v5, v6, v7, v8, v9}, Landroidx/fragment/app/Fragment;->a(IIII)V

    .line 16
    iget-object v6, p0, Lb/l/d/a;->q:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v6, v5}, Landroidx/fragment/app/FragmentManager;->g(Landroidx/fragment/app/Fragment;)V

    goto :goto_d0

    .line 17
    :pswitch_83
    iget v6, v4, Lb/l/d/q$a;->c:I

    iget v7, v4, Lb/l/d/q$a;->d:I

    iget v8, v4, Lb/l/d/q$a;->e:I

    iget v9, v4, Lb/l/d/q$a;->f:I

    invoke-virtual {v5, v6, v7, v8, v9}, Landroidx/fragment/app/Fragment;->a(IIII)V

    .line 18
    iget-object v6, p0, Lb/l/d/a;->q:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v6, v5, v1}, Landroidx/fragment/app/FragmentManager;->a(Landroidx/fragment/app/Fragment;Z)V

    .line 19
    iget-object v6, p0, Lb/l/d/a;->q:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v6, v5}, Landroidx/fragment/app/FragmentManager;->w(Landroidx/fragment/app/Fragment;)V

    goto :goto_d0

    .line 20
    :pswitch_99
    iget v6, v4, Lb/l/d/q$a;->c:I

    iget v7, v4, Lb/l/d/q$a;->d:I

    iget v8, v4, Lb/l/d/q$a;->e:I

    iget v9, v4, Lb/l/d/q$a;->f:I

    invoke-virtual {v5, v6, v7, v8, v9}, Landroidx/fragment/app/Fragment;->a(IIII)V

    .line 21
    iget-object v6, p0, Lb/l/d/a;->q:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v6, v5}, Landroidx/fragment/app/FragmentManager;->m(Landroidx/fragment/app/Fragment;)V

    goto :goto_d0

    .line 22
    :pswitch_aa
    iget v6, v4, Lb/l/d/q$a;->c:I

    iget v7, v4, Lb/l/d/q$a;->d:I

    iget v8, v4, Lb/l/d/q$a;->e:I

    iget v9, v4, Lb/l/d/q$a;->f:I

    invoke-virtual {v5, v6, v7, v8, v9}, Landroidx/fragment/app/Fragment;->a(IIII)V

    .line 23
    iget-object v6, p0, Lb/l/d/a;->q:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v6, v5}, Landroidx/fragment/app/FragmentManager;->t(Landroidx/fragment/app/Fragment;)V

    goto :goto_d0

    .line 24
    :pswitch_bb
    iget v6, v4, Lb/l/d/q$a;->c:I

    iget v7, v4, Lb/l/d/q$a;->d:I

    iget v8, v4, Lb/l/d/q$a;->e:I

    iget v9, v4, Lb/l/d/q$a;->f:I

    invoke-virtual {v5, v6, v7, v8, v9}, Landroidx/fragment/app/Fragment;->a(IIII)V

    .line 25
    iget-object v6, p0, Lb/l/d/a;->q:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v6, v5, v1}, Landroidx/fragment/app/FragmentManager;->a(Landroidx/fragment/app/Fragment;Z)V

    .line 26
    iget-object v6, p0, Lb/l/d/a;->q:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v6, v5}, Landroidx/fragment/app/FragmentManager;->a(Landroidx/fragment/app/Fragment;)Lb/l/d/o;

    .line 27
    :goto_d0
    iget-boolean v6, p0, Lb/l/d/q;->o:Z

    if-nez v6, :cond_e3

    iget v4, v4, Lb/l/d/q$a;->a:I

    if-eq v4, v3, :cond_e3

    if-eqz v5, :cond_e3

    .line 28
    sget-boolean v3, Landroidx/fragment/app/FragmentManager;->P:Z

    if-nez v3, :cond_e3

    .line 29
    iget-object v3, p0, Lb/l/d/a;->q:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v3, v5}, Landroidx/fragment/app/FragmentManager;->r(Landroidx/fragment/app/Fragment;)V

    :cond_e3
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_8

    .line 30
    :cond_e7
    iget-boolean v0, p0, Lb/l/d/q;->o:Z

    if-nez v0, :cond_f6

    sget-boolean v0, Landroidx/fragment/app/FragmentManager;->P:Z

    if-nez v0, :cond_f6

    .line 31
    iget-object v0, p0, Lb/l/d/a;->q:Landroidx/fragment/app/FragmentManager;

    iget v1, v0, Landroidx/fragment/app/FragmentManager;->q:I

    invoke-virtual {v0, v1, v3}, Landroidx/fragment/app/FragmentManager;->a(IZ)V

    :cond_f6
    return-void

    nop

    :pswitch_data_f8
    .packed-switch 0x1
        :pswitch_bb
        :pswitch_2b
        :pswitch_aa
        :pswitch_99
        :pswitch_83
        :pswitch_72
        :pswitch_5c
        :pswitch_55
        :pswitch_4d
        :pswitch_44
    .end packed-switch
.end method

.method public g()Ljava/lang/String;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/l/d/q;->h:Ljava/lang/String;

    return-object v0
.end method

.method public h()Z
    .registers 4

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 1
    :goto_2
    iget-object v2, p0, Lb/l/d/q;->a:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_1d

    .line 2
    iget-object v2, p0, Lb/l/d/q;->a:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb/l/d/q$a;

    .line 3
    invoke-static {v2}, Lb/l/d/a;->b(Lb/l/d/q$a;)Z

    move-result v2

    if-eqz v2, :cond_1a

    const/4 v0, 0x1

    return v0

    :cond_1a
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_1d
    return v0
.end method

.method public i()V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/l/d/q;->p:Ljava/util/ArrayList;

    if-eqz v0, :cond_1e

    const/4 v0, 0x0

    .line 2
    :goto_5
    iget-object v1, p0, Lb/l/d/q;->p:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_1b

    .line 3
    iget-object v1, p0, Lb/l/d/q;->p:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Runnable;

    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    :cond_1b
    const/4 v0, 0x0

    .line 4
    iput-object v0, p0, Lb/l/d/q;->p:Ljava/util/ArrayList;

    :cond_1e
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x80

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v1, "BackStackEntry{"

    .line 2
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4
    iget v1, p0, Lb/l/d/a;->s:I

    if-ltz v1, :cond_25

    const-string v1, " #"

    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 6
    iget v1, p0, Lb/l/d/a;->s:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 7
    :cond_25
    iget-object v1, p0, Lb/l/d/q;->h:Ljava/lang/String;

    if-eqz v1, :cond_33

    const-string v1, " "

    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    iget-object v1, p0, Lb/l/d/q;->h:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_33
    const-string v1, "}"

    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
