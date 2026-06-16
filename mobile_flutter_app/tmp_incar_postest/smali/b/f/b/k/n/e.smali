.class public Lb/f/b/k/n/e;
.super Ljava/lang/Object;
.source "DependencyGraph.java"


# instance fields
.field public a:Lb/f/b/k/f;

.field public b:Z

.field public c:Z

.field public d:Lb/f/b/k/f;

.field public e:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lb/f/b/k/n/m;",
            ">;"
        }
    .end annotation
.end field

.field public f:Lb/f/b/k/n/b$b;

.field public g:Lb/f/b/k/n/b$a;

.field public h:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lb/f/b/k/n/k;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lb/f/b/k/f;)V
    .registers 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lb/f/b/k/n/e;->b:Z

    .line 3
    iput-boolean v0, p0, Lb/f/b/k/n/e;->c:Z

    .line 4
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lb/f/b/k/n/e;->e:Ljava/util/ArrayList;

    .line 5
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v0, 0x0

    .line 6
    iput-object v0, p0, Lb/f/b/k/n/e;->f:Lb/f/b/k/n/b$b;

    .line 7
    new-instance v0, Lb/f/b/k/n/b$a;

    invoke-direct {v0}, Lb/f/b/k/n/b$a;-><init>()V

    iput-object v0, p0, Lb/f/b/k/n/e;->g:Lb/f/b/k/n/b$a;

    .line 8
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lb/f/b/k/n/e;->h:Ljava/util/ArrayList;

    .line 9
    iput-object p1, p0, Lb/f/b/k/n/e;->a:Lb/f/b/k/f;

    .line 10
    iput-object p1, p0, Lb/f/b/k/n/e;->d:Lb/f/b/k/f;

    return-void
.end method


# virtual methods
.method public final a(Lb/f/b/k/f;I)I
    .registers 9

    .line 2
    iget-object v0, p0, Lb/f/b/k/n/e;->h:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const-wide/16 v1, 0x0

    const/4 v3, 0x0

    :goto_9
    if-ge v3, v0, :cond_1e

    .line 3
    iget-object v4, p0, Lb/f/b/k/n/e;->h:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lb/f/b/k/n/k;

    .line 4
    invoke-virtual {v4, p1, p2}, Lb/f/b/k/n/k;->a(Lb/f/b/k/f;I)J

    move-result-wide v4

    .line 5
    invoke-static {v1, v2, v4, v5}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v1

    add-int/lit8 v3, v3, 0x1

    goto :goto_9

    :cond_1e
    long-to-int p1, v1

    return p1
.end method

.method public a()V
    .registers 5

    .line 211
    iget-object v0, p0, Lb/f/b/k/n/e;->e:Ljava/util/ArrayList;

    invoke-virtual {p0, v0}, Lb/f/b/k/n/e;->a(Ljava/util/ArrayList;)V

    .line 212
    iget-object v0, p0, Lb/f/b/k/n/e;->h:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    const/4 v0, 0x0

    .line 213
    sput v0, Lb/f/b/k/n/k;->d:I

    .line 214
    iget-object v1, p0, Lb/f/b/k/n/e;->a:Lb/f/b/k/f;

    iget-object v1, v1, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    iget-object v2, p0, Lb/f/b/k/n/e;->h:Ljava/util/ArrayList;

    invoke-virtual {p0, v1, v0, v2}, Lb/f/b/k/n/e;->a(Lb/f/b/k/n/m;ILjava/util/ArrayList;)V

    .line 215
    iget-object v1, p0, Lb/f/b/k/n/e;->a:Lb/f/b/k/f;

    iget-object v1, v1, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v2, p0, Lb/f/b/k/n/e;->h:Ljava/util/ArrayList;

    const/4 v3, 0x1

    invoke-virtual {p0, v1, v3, v2}, Lb/f/b/k/n/e;->a(Lb/f/b/k/n/m;ILjava/util/ArrayList;)V

    .line 216
    iput-boolean v0, p0, Lb/f/b/k/n/e;->b:Z

    return-void
.end method

.method public final a(Lb/f/b/k/e;Lb/f/b/k/e$b;ILb/f/b/k/e$b;I)V
    .registers 7

    .line 95
    iget-object v0, p0, Lb/f/b/k/n/e;->g:Lb/f/b/k/n/b$a;

    iput-object p2, v0, Lb/f/b/k/n/b$a;->a:Lb/f/b/k/e$b;

    .line 96
    iput-object p4, v0, Lb/f/b/k/n/b$a;->b:Lb/f/b/k/e$b;

    .line 97
    iput p3, v0, Lb/f/b/k/n/b$a;->c:I

    .line 98
    iput p5, v0, Lb/f/b/k/n/b$a;->d:I

    .line 99
    iget-object p2, p0, Lb/f/b/k/n/e;->f:Lb/f/b/k/n/b$b;

    invoke-interface {p2, p1, v0}, Lb/f/b/k/n/b$b;->a(Lb/f/b/k/e;Lb/f/b/k/n/b$a;)V

    .line 100
    iget-object p2, p0, Lb/f/b/k/n/e;->g:Lb/f/b/k/n/b$a;

    iget p2, p2, Lb/f/b/k/n/b$a;->e:I

    invoke-virtual {p1, p2}, Lb/f/b/k/e;->q(I)V

    .line 101
    iget-object p2, p0, Lb/f/b/k/n/e;->g:Lb/f/b/k/n/b$a;

    iget p2, p2, Lb/f/b/k/n/b$a;->f:I

    invoke-virtual {p1, p2}, Lb/f/b/k/e;->i(I)V

    .line 102
    iget-object p2, p0, Lb/f/b/k/n/e;->g:Lb/f/b/k/n/b$a;

    iget-boolean p2, p2, Lb/f/b/k/n/b$a;->h:Z

    invoke-virtual {p1, p2}, Lb/f/b/k/e;->a(Z)V

    .line 103
    iget-object p2, p0, Lb/f/b/k/n/e;->g:Lb/f/b/k/n/b$a;

    iget p2, p2, Lb/f/b/k/n/b$a;->g:I

    invoke-virtual {p1, p2}, Lb/f/b/k/e;->h(I)V

    return-void
.end method

.method public a(Lb/f/b/k/n/b$b;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lb/f/b/k/n/e;->f:Lb/f/b/k/n/b$b;

    return-void
.end method

.method public final a(Lb/f/b/k/n/f;IILb/f/b/k/n/f;Ljava/util/ArrayList;Lb/f/b/k/n/k;)V
    .registers 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lb/f/b/k/n/f;",
            "II",
            "Lb/f/b/k/n/f;",
            "Ljava/util/ArrayList<",
            "Lb/f/b/k/n/k;",
            ">;",
            "Lb/f/b/k/n/k;",
            ")V"
        }
    .end annotation

    .line 247
    iget-object p1, p1, Lb/f/b/k/n/f;->d:Lb/f/b/k/n/m;

    .line 248
    iget-object v0, p1, Lb/f/b/k/n/m;->c:Lb/f/b/k/n/k;

    if-nez v0, :cond_107

    iget-object v0, p0, Lb/f/b/k/n/e;->a:Lb/f/b/k/f;

    iget-object v1, v0, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    if-eq p1, v1, :cond_107

    iget-object v0, v0, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    if-ne p1, v0, :cond_12

    goto/16 :goto_107

    :cond_12
    if-nez p6, :cond_1c

    .line 249
    new-instance p6, Lb/f/b/k/n/k;

    invoke-direct {p6, p1, p3}, Lb/f/b/k/n/k;-><init>(Lb/f/b/k/n/m;I)V

    .line 250
    invoke-virtual {p5, p6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 251
    :cond_1c
    iput-object p6, p1, Lb/f/b/k/n/m;->c:Lb/f/b/k/n/k;

    .line 252
    invoke-virtual {p6, p1}, Lb/f/b/k/n/k;->a(Lb/f/b/k/n/m;)V

    .line 253
    iget-object p3, p1, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object p3, p3, Lb/f/b/k/n/f;->k:Ljava/util/List;

    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p3

    :cond_29
    :goto_29
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_46

    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb/f/b/k/n/d;

    .line 254
    instance-of v1, v0, Lb/f/b/k/n/f;

    if-eqz v1, :cond_29

    .line 255
    move-object v1, v0

    check-cast v1, Lb/f/b/k/n/f;

    const/4 v3, 0x0

    move-object v0, p0

    move v2, p2

    move-object v4, p4

    move-object v5, p5

    move-object v6, p6

    invoke-virtual/range {v0 .. v6}, Lb/f/b/k/n/e;->a(Lb/f/b/k/n/f;IILb/f/b/k/n/f;Ljava/util/ArrayList;Lb/f/b/k/n/k;)V

    goto :goto_29

    .line 256
    :cond_46
    iget-object p3, p1, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget-object p3, p3, Lb/f/b/k/n/f;->k:Ljava/util/List;

    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p3

    :cond_4e
    :goto_4e
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_6b

    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb/f/b/k/n/d;

    .line 257
    instance-of v1, v0, Lb/f/b/k/n/f;

    if-eqz v1, :cond_4e

    .line 258
    move-object v1, v0

    check-cast v1, Lb/f/b/k/n/f;

    const/4 v3, 0x1

    move-object v0, p0

    move v2, p2

    move-object v4, p4

    move-object v5, p5

    move-object v6, p6

    invoke-virtual/range {v0 .. v6}, Lb/f/b/k/n/e;->a(Lb/f/b/k/n/f;IILb/f/b/k/n/f;Ljava/util/ArrayList;Lb/f/b/k/n/k;)V

    goto :goto_4e

    :cond_6b
    const/4 p3, 0x1

    if-ne p2, p3, :cond_9a

    .line 259
    instance-of v0, p1, Lb/f/b/k/n/l;

    if-eqz v0, :cond_9a

    .line 260
    move-object v0, p1

    check-cast v0, Lb/f/b/k/n/l;

    iget-object v0, v0, Lb/f/b/k/n/l;->k:Lb/f/b/k/n/f;

    iget-object v0, v0, Lb/f/b/k/n/f;->k:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_7d
    :goto_7d
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_9a

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb/f/b/k/n/d;

    .line 261
    instance-of v1, v0, Lb/f/b/k/n/f;

    if-eqz v1, :cond_7d

    .line 262
    move-object v1, v0

    check-cast v1, Lb/f/b/k/n/f;

    const/4 v3, 0x2

    move-object v0, p0

    move v2, p2

    move-object v4, p4

    move-object v5, p5

    move-object v6, p6

    invoke-virtual/range {v0 .. v6}, Lb/f/b/k/n/e;->a(Lb/f/b/k/n/f;IILb/f/b/k/n/f;Ljava/util/ArrayList;Lb/f/b/k/n/k;)V

    goto :goto_7d

    .line 263
    :cond_9a
    iget-object v0, p1, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object v0, v0, Lb/f/b/k/n/f;->l:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_a2
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_bd

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Lb/f/b/k/n/f;

    if-ne v1, p4, :cond_b3

    .line 264
    iput-boolean p3, p6, Lb/f/b/k/n/k;->a:Z

    :cond_b3
    const/4 v3, 0x0

    move-object v0, p0

    move v2, p2

    move-object v4, p4

    move-object v5, p5

    move-object v6, p6

    .line 265
    invoke-virtual/range {v0 .. v6}, Lb/f/b/k/n/e;->a(Lb/f/b/k/n/f;IILb/f/b/k/n/f;Ljava/util/ArrayList;Lb/f/b/k/n/k;)V

    goto :goto_a2

    .line 266
    :cond_bd
    iget-object v0, p1, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget-object v0, v0, Lb/f/b/k/n/f;->l:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_c5
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_e0

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Lb/f/b/k/n/f;

    if-ne v1, p4, :cond_d6

    .line 267
    iput-boolean p3, p6, Lb/f/b/k/n/k;->a:Z

    :cond_d6
    const/4 v3, 0x1

    move-object v0, p0

    move v2, p2

    move-object v4, p4

    move-object v5, p5

    move-object v6, p6

    .line 268
    invoke-virtual/range {v0 .. v6}, Lb/f/b/k/n/e;->a(Lb/f/b/k/n/f;IILb/f/b/k/n/f;Ljava/util/ArrayList;Lb/f/b/k/n/k;)V

    goto :goto_c5

    :cond_e0
    if-ne p2, p3, :cond_107

    .line 269
    instance-of p3, p1, Lb/f/b/k/n/l;

    if-eqz p3, :cond_107

    .line 270
    check-cast p1, Lb/f/b/k/n/l;

    iget-object p1, p1, Lb/f/b/k/n/l;->k:Lb/f/b/k/n/f;

    iget-object p1, p1, Lb/f/b/k/n/f;->l:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_f0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_107

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    move-object v1, p3

    check-cast v1, Lb/f/b/k/n/f;

    const/4 v3, 0x2

    move-object v0, p0

    move v2, p2

    move-object v4, p4

    move-object v5, p5

    move-object v6, p6

    .line 271
    :try_start_103
    invoke-virtual/range {v0 .. v6}, Lb/f/b/k/n/e;->a(Lb/f/b/k/n/f;IILb/f/b/k/n/f;Ljava/util/ArrayList;Lb/f/b/k/n/k;)V
    :try_end_106
    .catchall {:try_start_103 .. :try_end_106} :catchall_108

    goto :goto_f0

    :cond_107
    :goto_107
    return-void

    :catchall_108
    move-exception p1

    throw p1
.end method

.method public final a(Lb/f/b/k/n/m;ILjava/util/ArrayList;)V
    .registers 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lb/f/b/k/n/m;",
            "I",
            "Ljava/util/ArrayList<",
            "Lb/f/b/k/n/k;",
            ">;)V"
        }
    .end annotation

    .line 272
    iget-object v0, p1, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object v0, v0, Lb/f/b/k/n/f;->k:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_8
    :goto_8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_39

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/f/b/k/n/d;

    .line 273
    instance-of v2, v1, Lb/f/b/k/n/f;

    if-eqz v2, :cond_26

    .line 274
    move-object v4, v1

    check-cast v4, Lb/f/b/k/n/f;

    const/4 v6, 0x0

    .line 275
    iget-object v7, p1, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    const/4 v9, 0x0

    move-object v3, p0

    move v5, p2

    move-object v8, p3

    invoke-virtual/range {v3 .. v9}, Lb/f/b/k/n/e;->a(Lb/f/b/k/n/f;IILb/f/b/k/n/f;Ljava/util/ArrayList;Lb/f/b/k/n/k;)V

    goto :goto_8

    .line 276
    :cond_26
    instance-of v2, v1, Lb/f/b/k/n/m;

    if-eqz v2, :cond_8

    .line 277
    check-cast v1, Lb/f/b/k/n/m;

    .line 278
    iget-object v3, v1, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    const/4 v5, 0x0

    iget-object v6, p1, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    const/4 v8, 0x0

    move-object v2, p0

    move v4, p2

    move-object v7, p3

    invoke-virtual/range {v2 .. v8}, Lb/f/b/k/n/e;->a(Lb/f/b/k/n/f;IILb/f/b/k/n/f;Ljava/util/ArrayList;Lb/f/b/k/n/k;)V

    goto :goto_8

    .line 279
    :cond_39
    iget-object v0, p1, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget-object v0, v0, Lb/f/b/k/n/f;->k:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_41
    :goto_41
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_72

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/f/b/k/n/d;

    .line 280
    instance-of v2, v1, Lb/f/b/k/n/f;

    if-eqz v2, :cond_5f

    .line 281
    move-object v4, v1

    check-cast v4, Lb/f/b/k/n/f;

    const/4 v6, 0x1

    .line 282
    iget-object v7, p1, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    const/4 v9, 0x0

    move-object v3, p0

    move v5, p2

    move-object v8, p3

    invoke-virtual/range {v3 .. v9}, Lb/f/b/k/n/e;->a(Lb/f/b/k/n/f;IILb/f/b/k/n/f;Ljava/util/ArrayList;Lb/f/b/k/n/k;)V

    goto :goto_41

    .line 283
    :cond_5f
    instance-of v2, v1, Lb/f/b/k/n/m;

    if-eqz v2, :cond_41

    .line 284
    check-cast v1, Lb/f/b/k/n/m;

    .line 285
    iget-object v3, v1, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    const/4 v5, 0x1

    iget-object v6, p1, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    const/4 v8, 0x0

    move-object v2, p0

    move v4, p2

    move-object v7, p3

    invoke-virtual/range {v2 .. v8}, Lb/f/b/k/n/e;->a(Lb/f/b/k/n/f;IILb/f/b/k/n/f;Ljava/util/ArrayList;Lb/f/b/k/n/k;)V

    goto :goto_41

    :cond_72
    const/4 v0, 0x1

    if-ne p2, v0, :cond_9c

    .line 286
    check-cast p1, Lb/f/b/k/n/l;

    iget-object p1, p1, Lb/f/b/k/n/l;->k:Lb/f/b/k/n/f;

    iget-object p1, p1, Lb/f/b/k/n/f;->k:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_7f
    :goto_7f
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_9c

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb/f/b/k/n/d;

    .line 287
    instance-of v1, v0, Lb/f/b/k/n/f;

    if-eqz v1, :cond_7f

    .line 288
    move-object v3, v0

    check-cast v3, Lb/f/b/k/n/f;

    const/4 v5, 0x2

    const/4 v6, 0x0

    const/4 v8, 0x0

    move-object v2, p0

    move v4, p2

    move-object v7, p3

    .line 289
    invoke-virtual/range {v2 .. v8}, Lb/f/b/k/n/e;->a(Lb/f/b/k/n/f;IILb/f/b/k/n/f;Ljava/util/ArrayList;Lb/f/b/k/n/k;)V

    goto :goto_7f

    :cond_9c
    return-void
.end method

.method public a(Ljava/util/ArrayList;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lb/f/b/k/n/m;",
            ">;)V"
        }
    .end annotation

    .line 217
    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    .line 218
    iget-object v0, p0, Lb/f/b/k/n/e;->d:Lb/f/b/k/f;

    iget-object v0, v0, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    invoke-virtual {v0}, Lb/f/b/k/n/j;->c()V

    .line 219
    iget-object v0, p0, Lb/f/b/k/n/e;->d:Lb/f/b/k/f;

    iget-object v0, v0, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    invoke-virtual {v0}, Lb/f/b/k/n/l;->c()V

    .line 220
    iget-object v0, p0, Lb/f/b/k/n/e;->d:Lb/f/b/k/f;

    iget-object v0, v0, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 221
    iget-object v0, p0, Lb/f/b/k/n/e;->d:Lb/f/b/k/f;

    iget-object v0, v0, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 222
    iget-object v0, p0, Lb/f/b/k/n/e;->d:Lb/f/b/k/f;

    iget-object v0, v0, Lb/f/b/k/m;->D0:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v1, 0x0

    :cond_28
    :goto_28
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_96

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb/f/b/k/e;

    .line 223
    instance-of v3, v2, Lb/f/b/k/h;

    if-eqz v3, :cond_41

    .line 224
    new-instance v3, Lb/f/b/k/n/h;

    invoke-direct {v3, v2}, Lb/f/b/k/n/h;-><init>(Lb/f/b/k/e;)V

    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_28

    .line 225
    :cond_41
    invoke-virtual {v2}, Lb/f/b/k/e;->E()Z

    move-result v3

    if-eqz v3, :cond_60

    .line 226
    iget-object v3, v2, Lb/f/b/k/e;->b:Lb/f/b/k/n/c;

    if-nez v3, :cond_53

    .line 227
    new-instance v3, Lb/f/b/k/n/c;

    const/4 v4, 0x0

    invoke-direct {v3, v2, v4}, Lb/f/b/k/n/c;-><init>(Lb/f/b/k/e;I)V

    .line 228
    iput-object v3, v2, Lb/f/b/k/e;->b:Lb/f/b/k/n/c;

    :cond_53
    if-nez v1, :cond_5a

    .line 229
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 230
    :cond_5a
    iget-object v3, v2, Lb/f/b/k/e;->b:Lb/f/b/k/n/c;

    invoke-virtual {v1, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_65

    .line 231
    :cond_60
    iget-object v3, v2, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 232
    :goto_65
    invoke-virtual {v2}, Lb/f/b/k/e;->G()Z

    move-result v3

    if-eqz v3, :cond_84

    .line 233
    iget-object v3, v2, Lb/f/b/k/e;->c:Lb/f/b/k/n/c;

    if-nez v3, :cond_77

    .line 234
    new-instance v3, Lb/f/b/k/n/c;

    const/4 v4, 0x1

    invoke-direct {v3, v2, v4}, Lb/f/b/k/n/c;-><init>(Lb/f/b/k/e;I)V

    .line 235
    iput-object v3, v2, Lb/f/b/k/e;->c:Lb/f/b/k/n/c;

    :cond_77
    if-nez v1, :cond_7e

    .line 236
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 237
    :cond_7e
    iget-object v3, v2, Lb/f/b/k/e;->c:Lb/f/b/k/n/c;

    invoke-virtual {v1, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_89

    .line 238
    :cond_84
    iget-object v3, v2, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 239
    :goto_89
    instance-of v3, v2, Lb/f/b/k/j;

    if-eqz v3, :cond_28

    .line 240
    new-instance v3, Lb/f/b/k/n/i;

    invoke-direct {v3, v2}, Lb/f/b/k/n/i;-><init>(Lb/f/b/k/e;)V

    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_28

    :cond_96
    if-eqz v1, :cond_9b

    .line 241
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 242
    :cond_9b
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_9f
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_af

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/f/b/k/n/m;

    .line 243
    invoke-virtual {v1}, Lb/f/b/k/n/m;->c()V

    goto :goto_9f

    .line 244
    :cond_af
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_b3
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_ca

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb/f/b/k/n/m;

    .line 245
    iget-object v1, v0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v2, p0, Lb/f/b/k/n/e;->d:Lb/f/b/k/f;

    if-ne v1, v2, :cond_c6

    goto :goto_b3

    .line 246
    :cond_c6
    invoke-virtual {v0}, Lb/f/b/k/n/m;->a()V

    goto :goto_b3

    :cond_ca
    return-void
.end method

.method public final a(Lb/f/b/k/f;)Z
    .registers 15

    .line 104
    iget-object v0, p1, Lb/f/b/k/m;->D0:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_6
    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_35a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/f/b/k/e;

    .line 105
    iget-object v3, v1, Lb/f/b/k/e;->L:[Lb/f/b/k/e$b;

    aget-object v4, v3, v2

    const/4 v9, 0x1

    .line 106
    aget-object v3, v3, v9

    .line 107
    invoke-virtual {v1}, Lb/f/b/k/e;->z()I

    move-result v5

    const/16 v6, 0x8

    if-ne v5, v6, :cond_25

    .line 108
    iput-boolean v9, v1, Lb/f/b/k/e;->a:Z

    goto :goto_6

    .line 109
    :cond_25
    iget v5, v1, Lb/f/b/k/e;->o:F

    const/high16 v10, 0x3f800000    # 1.0f

    const/4 v6, 0x2

    cmpg-float v5, v5, v10

    if-gez v5, :cond_34

    sget-object v5, Lb/f/b/k/e$b;->MATCH_CONSTRAINT:Lb/f/b/k/e$b;

    if-ne v4, v5, :cond_34

    .line 110
    iput v6, v1, Lb/f/b/k/e;->j:I

    .line 111
    :cond_34
    iget v5, v1, Lb/f/b/k/e;->r:F

    cmpg-float v5, v5, v10

    if-gez v5, :cond_40

    sget-object v5, Lb/f/b/k/e$b;->MATCH_CONSTRAINT:Lb/f/b/k/e$b;

    if-ne v3, v5, :cond_40

    .line 112
    iput v6, v1, Lb/f/b/k/e;->k:I

    .line 113
    :cond_40
    invoke-virtual {v1}, Lb/f/b/k/e;->i()F

    move-result v5

    const/4 v7, 0x0

    const/4 v8, 0x3

    cmpl-float v5, v5, v7

    if-lez v5, :cond_7a

    .line 114
    sget-object v5, Lb/f/b/k/e$b;->MATCH_CONSTRAINT:Lb/f/b/k/e$b;

    if-ne v4, v5, :cond_59

    sget-object v5, Lb/f/b/k/e$b;->WRAP_CONTENT:Lb/f/b/k/e$b;

    if-eq v3, v5, :cond_56

    sget-object v5, Lb/f/b/k/e$b;->FIXED:Lb/f/b/k/e$b;

    if-ne v3, v5, :cond_59

    .line 115
    :cond_56
    iput v8, v1, Lb/f/b/k/e;->j:I

    goto :goto_7a

    .line 116
    :cond_59
    sget-object v5, Lb/f/b/k/e$b;->MATCH_CONSTRAINT:Lb/f/b/k/e$b;

    if-ne v3, v5, :cond_68

    sget-object v5, Lb/f/b/k/e$b;->WRAP_CONTENT:Lb/f/b/k/e$b;

    if-eq v4, v5, :cond_65

    sget-object v5, Lb/f/b/k/e$b;->FIXED:Lb/f/b/k/e$b;

    if-ne v4, v5, :cond_68

    .line 117
    :cond_65
    iput v8, v1, Lb/f/b/k/e;->k:I

    goto :goto_7a

    .line 118
    :cond_68
    sget-object v5, Lb/f/b/k/e$b;->MATCH_CONSTRAINT:Lb/f/b/k/e$b;

    if-ne v4, v5, :cond_7a

    if-ne v3, v5, :cond_7a

    .line 119
    iget v5, v1, Lb/f/b/k/e;->j:I

    if-nez v5, :cond_74

    .line 120
    iput v8, v1, Lb/f/b/k/e;->j:I

    .line 121
    :cond_74
    iget v5, v1, Lb/f/b/k/e;->k:I

    if-nez v5, :cond_7a

    .line 122
    iput v8, v1, Lb/f/b/k/e;->k:I

    .line 123
    :cond_7a
    :goto_7a
    sget-object v5, Lb/f/b/k/e$b;->MATCH_CONSTRAINT:Lb/f/b/k/e$b;

    if-ne v4, v5, :cond_90

    iget v5, v1, Lb/f/b/k/e;->j:I

    if-ne v5, v9, :cond_90

    .line 124
    iget-object v5, v1, Lb/f/b/k/e;->A:Lb/f/b/k/d;

    iget-object v5, v5, Lb/f/b/k/d;->d:Lb/f/b/k/d;

    if-eqz v5, :cond_8e

    iget-object v5, v1, Lb/f/b/k/e;->C:Lb/f/b/k/d;

    iget-object v5, v5, Lb/f/b/k/d;->d:Lb/f/b/k/d;

    if-nez v5, :cond_90

    .line 125
    :cond_8e
    sget-object v4, Lb/f/b/k/e$b;->WRAP_CONTENT:Lb/f/b/k/e$b;

    :cond_90
    move-object v5, v4

    .line 126
    sget-object v4, Lb/f/b/k/e$b;->MATCH_CONSTRAINT:Lb/f/b/k/e$b;

    if-ne v3, v4, :cond_a7

    iget v4, v1, Lb/f/b/k/e;->k:I

    if-ne v4, v9, :cond_a7

    .line 127
    iget-object v4, v1, Lb/f/b/k/e;->B:Lb/f/b/k/d;

    iget-object v4, v4, Lb/f/b/k/d;->d:Lb/f/b/k/d;

    if-eqz v4, :cond_a5

    iget-object v4, v1, Lb/f/b/k/e;->D:Lb/f/b/k/d;

    iget-object v4, v4, Lb/f/b/k/d;->d:Lb/f/b/k/d;

    if-nez v4, :cond_a7

    .line 128
    :cond_a5
    sget-object v3, Lb/f/b/k/e$b;->WRAP_CONTENT:Lb/f/b/k/e$b;

    :cond_a7
    move-object v7, v3

    .line 129
    iget-object v3, v1, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    iput-object v5, v3, Lb/f/b/k/n/m;->d:Lb/f/b/k/e$b;

    .line 130
    iget v4, v1, Lb/f/b/k/e;->j:I

    iput v4, v3, Lb/f/b/k/n/m;->a:I

    .line 131
    iget-object v3, v1, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iput-object v7, v3, Lb/f/b/k/n/m;->d:Lb/f/b/k/e$b;

    .line 132
    iget v4, v1, Lb/f/b/k/e;->k:I

    iput v4, v3, Lb/f/b/k/n/m;->a:I

    .line 133
    sget-object v3, Lb/f/b/k/e$b;->MATCH_PARENT:Lb/f/b/k/e$b;

    if-eq v5, v3, :cond_c4

    sget-object v3, Lb/f/b/k/e$b;->FIXED:Lb/f/b/k/e$b;

    if-eq v5, v3, :cond_c4

    sget-object v3, Lb/f/b/k/e$b;->WRAP_CONTENT:Lb/f/b/k/e$b;

    if-ne v5, v3, :cond_d2

    :cond_c4
    sget-object v3, Lb/f/b/k/e$b;->MATCH_PARENT:Lb/f/b/k/e$b;

    if-eq v7, v3, :cond_303

    sget-object v3, Lb/f/b/k/e$b;->FIXED:Lb/f/b/k/e$b;

    if-eq v7, v3, :cond_303

    sget-object v3, Lb/f/b/k/e$b;->WRAP_CONTENT:Lb/f/b/k/e$b;

    if-ne v7, v3, :cond_d2

    goto/16 :goto_303

    .line 134
    :cond_d2
    sget-object v3, Lb/f/b/k/e$b;->MATCH_CONSTRAINT:Lb/f/b/k/e$b;

    const/high16 v11, 0x3f000000    # 0.5f

    if-ne v5, v3, :cond_1a6

    sget-object v3, Lb/f/b/k/e$b;->WRAP_CONTENT:Lb/f/b/k/e$b;

    if-eq v7, v3, :cond_e0

    sget-object v3, Lb/f/b/k/e$b;->FIXED:Lb/f/b/k/e$b;

    if-ne v7, v3, :cond_1a6

    .line 135
    :cond_e0
    iget v3, v1, Lb/f/b/k/e;->j:I

    if-ne v3, v8, :cond_11e

    .line 136
    sget-object v2, Lb/f/b/k/e$b;->WRAP_CONTENT:Lb/f/b/k/e$b;

    if-ne v7, v2, :cond_f1

    const/4 v6, 0x0

    const/4 v8, 0x0

    move-object v3, p0

    move-object v4, v1

    move-object v5, v2

    move-object v7, v2

    .line 137
    invoke-virtual/range {v3 .. v8}, Lb/f/b/k/n/e;->a(Lb/f/b/k/e;Lb/f/b/k/e$b;ILb/f/b/k/e$b;I)V

    .line 138
    :cond_f1
    invoke-virtual {v1}, Lb/f/b/k/e;->k()I

    move-result v8

    int-to-float v2, v8

    .line 139
    iget v3, v1, Lb/f/b/k/e;->P:F

    mul-float v2, v2, v3

    add-float/2addr v2, v11

    float-to-int v6, v2

    .line 140
    sget-object v7, Lb/f/b/k/e$b;->FIXED:Lb/f/b/k/e$b;

    move-object v3, p0

    move-object v4, v1

    move-object v5, v7

    invoke-virtual/range {v3 .. v8}, Lb/f/b/k/n/e;->a(Lb/f/b/k/e;Lb/f/b/k/e$b;ILb/f/b/k/e$b;I)V

    .line 141
    iget-object v2, v1, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    iget-object v2, v2, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-virtual {v1}, Lb/f/b/k/e;->A()I

    move-result v3

    invoke-virtual {v2, v3}, Lb/f/b/k/n/g;->a(I)V

    .line 142
    iget-object v2, v1, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v2, v2, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-virtual {v1}, Lb/f/b/k/e;->k()I

    move-result v3

    invoke-virtual {v2, v3}, Lb/f/b/k/n/g;->a(I)V

    .line 143
    iput-boolean v9, v1, Lb/f/b/k/e;->a:Z

    goto/16 :goto_6

    :cond_11e
    if-ne v3, v9, :cond_135

    .line 144
    sget-object v5, Lb/f/b/k/e$b;->WRAP_CONTENT:Lb/f/b/k/e$b;

    const/4 v6, 0x0

    const/4 v8, 0x0

    move-object v3, p0

    move-object v4, v1

    invoke-virtual/range {v3 .. v8}, Lb/f/b/k/n/e;->a(Lb/f/b/k/e;Lb/f/b/k/e$b;ILb/f/b/k/e$b;I)V

    .line 145
    iget-object v2, v1, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    iget-object v2, v2, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-virtual {v1}, Lb/f/b/k/e;->A()I

    move-result v1

    iput v1, v2, Lb/f/b/k/n/g;->m:I

    goto/16 :goto_6

    :cond_135
    if-ne v3, v6, :cond_175

    .line 146
    iget-object v3, p1, Lb/f/b/k/e;->L:[Lb/f/b/k/e$b;

    aget-object v4, v3, v2

    sget-object v12, Lb/f/b/k/e$b;->FIXED:Lb/f/b/k/e$b;

    if-eq v4, v12, :cond_145

    aget-object v3, v3, v2

    sget-object v4, Lb/f/b/k/e$b;->MATCH_PARENT:Lb/f/b/k/e$b;

    if-ne v3, v4, :cond_1a6

    .line 147
    :cond_145
    iget v2, v1, Lb/f/b/k/e;->o:F

    .line 148
    invoke-virtual {p1}, Lb/f/b/k/e;->A()I

    move-result v3

    int-to-float v3, v3

    mul-float v2, v2, v3

    add-float/2addr v2, v11

    float-to-int v6, v2

    .line 149
    invoke-virtual {v1}, Lb/f/b/k/e;->k()I

    move-result v8

    .line 150
    sget-object v5, Lb/f/b/k/e$b;->FIXED:Lb/f/b/k/e$b;

    move-object v3, p0

    move-object v4, v1

    invoke-virtual/range {v3 .. v8}, Lb/f/b/k/n/e;->a(Lb/f/b/k/e;Lb/f/b/k/e$b;ILb/f/b/k/e$b;I)V

    .line 151
    iget-object v2, v1, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    iget-object v2, v2, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-virtual {v1}, Lb/f/b/k/e;->A()I

    move-result v3

    invoke-virtual {v2, v3}, Lb/f/b/k/n/g;->a(I)V

    .line 152
    iget-object v2, v1, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v2, v2, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-virtual {v1}, Lb/f/b/k/e;->k()I

    move-result v3

    invoke-virtual {v2, v3}, Lb/f/b/k/n/g;->a(I)V

    .line 153
    iput-boolean v9, v1, Lb/f/b/k/e;->a:Z

    goto/16 :goto_6

    .line 154
    :cond_175
    iget-object v3, v1, Lb/f/b/k/e;->I:[Lb/f/b/k/d;

    aget-object v4, v3, v2

    iget-object v4, v4, Lb/f/b/k/d;->d:Lb/f/b/k/d;

    if-eqz v4, :cond_183

    aget-object v3, v3, v9

    iget-object v3, v3, Lb/f/b/k/d;->d:Lb/f/b/k/d;

    if-nez v3, :cond_1a6

    .line 155
    :cond_183
    sget-object v5, Lb/f/b/k/e$b;->WRAP_CONTENT:Lb/f/b/k/e$b;

    const/4 v6, 0x0

    const/4 v8, 0x0

    move-object v3, p0

    move-object v4, v1

    invoke-virtual/range {v3 .. v8}, Lb/f/b/k/n/e;->a(Lb/f/b/k/e;Lb/f/b/k/e$b;ILb/f/b/k/e$b;I)V

    .line 156
    iget-object v2, v1, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    iget-object v2, v2, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-virtual {v1}, Lb/f/b/k/e;->A()I

    move-result v3

    invoke-virtual {v2, v3}, Lb/f/b/k/n/g;->a(I)V

    .line 157
    iget-object v2, v1, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v2, v2, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-virtual {v1}, Lb/f/b/k/e;->k()I

    move-result v3

    invoke-virtual {v2, v3}, Lb/f/b/k/n/g;->a(I)V

    .line 158
    iput-boolean v9, v1, Lb/f/b/k/e;->a:Z

    goto/16 :goto_6

    .line 159
    :cond_1a6
    sget-object v3, Lb/f/b/k/e$b;->MATCH_CONSTRAINT:Lb/f/b/k/e$b;

    if-ne v7, v3, :cond_280

    sget-object v3, Lb/f/b/k/e$b;->WRAP_CONTENT:Lb/f/b/k/e$b;

    if-eq v5, v3, :cond_1b2

    sget-object v3, Lb/f/b/k/e$b;->FIXED:Lb/f/b/k/e$b;

    if-ne v5, v3, :cond_280

    .line 160
    :cond_1b2
    iget v3, v1, Lb/f/b/k/e;->k:I

    if-ne v3, v8, :cond_1f8

    .line 161
    sget-object v7, Lb/f/b/k/e$b;->WRAP_CONTENT:Lb/f/b/k/e$b;

    if-ne v5, v7, :cond_1c2

    const/4 v6, 0x0

    const/4 v8, 0x0

    move-object v3, p0

    move-object v4, v1

    move-object v5, v7

    .line 162
    invoke-virtual/range {v3 .. v8}, Lb/f/b/k/n/e;->a(Lb/f/b/k/e;Lb/f/b/k/e$b;ILb/f/b/k/e$b;I)V

    .line 163
    :cond_1c2
    invoke-virtual {v1}, Lb/f/b/k/e;->A()I

    move-result v6

    .line 164
    iget v2, v1, Lb/f/b/k/e;->P:F

    .line 165
    invoke-virtual {v1}, Lb/f/b/k/e;->j()I

    move-result v3

    const/4 v4, -0x1

    if-ne v3, v4, :cond_1d1

    div-float v2, v10, v2

    :cond_1d1
    int-to-float v3, v6

    mul-float v3, v3, v2

    add-float/2addr v3, v11

    float-to-int v8, v3

    .line 166
    sget-object v7, Lb/f/b/k/e$b;->FIXED:Lb/f/b/k/e$b;

    move-object v3, p0

    move-object v4, v1

    move-object v5, v7

    invoke-virtual/range {v3 .. v8}, Lb/f/b/k/n/e;->a(Lb/f/b/k/e;Lb/f/b/k/e$b;ILb/f/b/k/e$b;I)V

    .line 167
    iget-object v2, v1, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    iget-object v2, v2, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-virtual {v1}, Lb/f/b/k/e;->A()I

    move-result v3

    invoke-virtual {v2, v3}, Lb/f/b/k/n/g;->a(I)V

    .line 168
    iget-object v2, v1, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v2, v2, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-virtual {v1}, Lb/f/b/k/e;->k()I

    move-result v3

    invoke-virtual {v2, v3}, Lb/f/b/k/n/g;->a(I)V

    .line 169
    iput-boolean v9, v1, Lb/f/b/k/e;->a:Z

    goto/16 :goto_6

    :cond_1f8
    if-ne v3, v9, :cond_20f

    const/4 v6, 0x0

    .line 170
    sget-object v7, Lb/f/b/k/e$b;->WRAP_CONTENT:Lb/f/b/k/e$b;

    const/4 v8, 0x0

    move-object v3, p0

    move-object v4, v1

    invoke-virtual/range {v3 .. v8}, Lb/f/b/k/n/e;->a(Lb/f/b/k/e;Lb/f/b/k/e$b;ILb/f/b/k/e$b;I)V

    .line 171
    iget-object v2, v1, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v2, v2, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-virtual {v1}, Lb/f/b/k/e;->k()I

    move-result v1

    iput v1, v2, Lb/f/b/k/n/g;->m:I

    goto/16 :goto_6

    :cond_20f
    if-ne v3, v6, :cond_24f

    .line 172
    iget-object v3, p1, Lb/f/b/k/e;->L:[Lb/f/b/k/e$b;

    aget-object v4, v3, v9

    sget-object v8, Lb/f/b/k/e$b;->FIXED:Lb/f/b/k/e$b;

    if-eq v4, v8, :cond_21f

    aget-object v3, v3, v9

    sget-object v4, Lb/f/b/k/e$b;->MATCH_PARENT:Lb/f/b/k/e$b;

    if-ne v3, v4, :cond_280

    .line 173
    :cond_21f
    iget v2, v1, Lb/f/b/k/e;->r:F

    .line 174
    invoke-virtual {v1}, Lb/f/b/k/e;->A()I

    move-result v6

    .line 175
    invoke-virtual {p1}, Lb/f/b/k/e;->k()I

    move-result v3

    int-to-float v3, v3

    mul-float v2, v2, v3

    add-float/2addr v2, v11

    float-to-int v8, v2

    .line 176
    sget-object v7, Lb/f/b/k/e$b;->FIXED:Lb/f/b/k/e$b;

    move-object v3, p0

    move-object v4, v1

    invoke-virtual/range {v3 .. v8}, Lb/f/b/k/n/e;->a(Lb/f/b/k/e;Lb/f/b/k/e$b;ILb/f/b/k/e$b;I)V

    .line 177
    iget-object v2, v1, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    iget-object v2, v2, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-virtual {v1}, Lb/f/b/k/e;->A()I

    move-result v3

    invoke-virtual {v2, v3}, Lb/f/b/k/n/g;->a(I)V

    .line 178
    iget-object v2, v1, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v2, v2, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-virtual {v1}, Lb/f/b/k/e;->k()I

    move-result v3

    invoke-virtual {v2, v3}, Lb/f/b/k/n/g;->a(I)V

    .line 179
    iput-boolean v9, v1, Lb/f/b/k/e;->a:Z

    goto/16 :goto_6

    .line 180
    :cond_24f
    iget-object v3, v1, Lb/f/b/k/e;->I:[Lb/f/b/k/d;

    aget-object v4, v3, v6

    iget-object v4, v4, Lb/f/b/k/d;->d:Lb/f/b/k/d;

    if-eqz v4, :cond_25d

    aget-object v3, v3, v8

    iget-object v3, v3, Lb/f/b/k/d;->d:Lb/f/b/k/d;

    if-nez v3, :cond_280

    .line 181
    :cond_25d
    sget-object v5, Lb/f/b/k/e$b;->WRAP_CONTENT:Lb/f/b/k/e$b;

    const/4 v6, 0x0

    const/4 v8, 0x0

    move-object v3, p0

    move-object v4, v1

    invoke-virtual/range {v3 .. v8}, Lb/f/b/k/n/e;->a(Lb/f/b/k/e;Lb/f/b/k/e$b;ILb/f/b/k/e$b;I)V

    .line 182
    iget-object v2, v1, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    iget-object v2, v2, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-virtual {v1}, Lb/f/b/k/e;->A()I

    move-result v3

    invoke-virtual {v2, v3}, Lb/f/b/k/n/g;->a(I)V

    .line 183
    iget-object v2, v1, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v2, v2, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-virtual {v1}, Lb/f/b/k/e;->k()I

    move-result v3

    invoke-virtual {v2, v3}, Lb/f/b/k/n/g;->a(I)V

    .line 184
    iput-boolean v9, v1, Lb/f/b/k/e;->a:Z

    goto/16 :goto_6

    .line 185
    :cond_280
    sget-object v3, Lb/f/b/k/e$b;->MATCH_CONSTRAINT:Lb/f/b/k/e$b;

    if-ne v5, v3, :cond_6

    if-ne v7, v3, :cond_6

    .line 186
    iget v3, v1, Lb/f/b/k/e;->j:I

    if-eq v3, v9, :cond_2e3

    iget v4, v1, Lb/f/b/k/e;->k:I

    if-ne v4, v9, :cond_28f

    goto :goto_2e3

    :cond_28f
    if-ne v4, v6, :cond_6

    if-ne v3, v6, :cond_6

    .line 187
    iget-object v3, p1, Lb/f/b/k/e;->L:[Lb/f/b/k/e$b;

    aget-object v4, v3, v2

    sget-object v5, Lb/f/b/k/e$b;->FIXED:Lb/f/b/k/e$b;

    if-eq v4, v5, :cond_29f

    aget-object v2, v3, v2

    if-ne v2, v5, :cond_6

    :cond_29f
    iget-object v2, p1, Lb/f/b/k/e;->L:[Lb/f/b/k/e$b;

    aget-object v3, v2, v9

    sget-object v4, Lb/f/b/k/e$b;->FIXED:Lb/f/b/k/e$b;

    if-eq v3, v4, :cond_2ab

    aget-object v2, v2, v9

    if-ne v2, v4, :cond_6

    .line 188
    :cond_2ab
    iget v2, v1, Lb/f/b/k/e;->o:F

    .line 189
    iget v3, v1, Lb/f/b/k/e;->r:F

    .line 190
    invoke-virtual {p1}, Lb/f/b/k/e;->A()I

    move-result v4

    int-to-float v4, v4

    mul-float v2, v2, v4

    add-float/2addr v2, v11

    float-to-int v6, v2

    .line 191
    invoke-virtual {p1}, Lb/f/b/k/e;->k()I

    move-result v2

    int-to-float v2, v2

    mul-float v3, v3, v2

    add-float/2addr v3, v11

    float-to-int v8, v3

    .line 192
    sget-object v7, Lb/f/b/k/e$b;->FIXED:Lb/f/b/k/e$b;

    move-object v3, p0

    move-object v4, v1

    move-object v5, v7

    invoke-virtual/range {v3 .. v8}, Lb/f/b/k/n/e;->a(Lb/f/b/k/e;Lb/f/b/k/e$b;ILb/f/b/k/e$b;I)V

    .line 193
    iget-object v2, v1, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    iget-object v2, v2, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-virtual {v1}, Lb/f/b/k/e;->A()I

    move-result v3

    invoke-virtual {v2, v3}, Lb/f/b/k/n/g;->a(I)V

    .line 194
    iget-object v2, v1, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v2, v2, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-virtual {v1}, Lb/f/b/k/e;->k()I

    move-result v3

    invoke-virtual {v2, v3}, Lb/f/b/k/n/g;->a(I)V

    .line 195
    iput-boolean v9, v1, Lb/f/b/k/e;->a:Z

    goto/16 :goto_6

    .line 196
    :cond_2e3
    :goto_2e3
    sget-object v7, Lb/f/b/k/e$b;->WRAP_CONTENT:Lb/f/b/k/e$b;

    const/4 v6, 0x0

    const/4 v8, 0x0

    move-object v3, p0

    move-object v4, v1

    move-object v5, v7

    invoke-virtual/range {v3 .. v8}, Lb/f/b/k/n/e;->a(Lb/f/b/k/e;Lb/f/b/k/e$b;ILb/f/b/k/e$b;I)V

    .line 197
    iget-object v2, v1, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    iget-object v2, v2, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-virtual {v1}, Lb/f/b/k/e;->A()I

    move-result v3

    iput v3, v2, Lb/f/b/k/n/g;->m:I

    .line 198
    iget-object v2, v1, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v2, v2, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-virtual {v1}, Lb/f/b/k/e;->k()I

    move-result v1

    iput v1, v2, Lb/f/b/k/n/g;->m:I

    goto/16 :goto_6

    .line 199
    :cond_303
    :goto_303
    invoke-virtual {v1}, Lb/f/b/k/e;->A()I

    move-result v2

    .line 200
    sget-object v3, Lb/f/b/k/e$b;->MATCH_PARENT:Lb/f/b/k/e$b;

    if-ne v5, v3, :cond_31e

    .line 201
    invoke-virtual {p1}, Lb/f/b/k/e;->A()I

    move-result v2

    iget-object v3, v1, Lb/f/b/k/e;->A:Lb/f/b/k/d;

    iget v3, v3, Lb/f/b/k/d;->e:I

    sub-int/2addr v2, v3

    iget-object v3, v1, Lb/f/b/k/e;->C:Lb/f/b/k/d;

    iget v3, v3, Lb/f/b/k/d;->e:I

    sub-int/2addr v2, v3

    .line 202
    sget-object v3, Lb/f/b/k/e$b;->FIXED:Lb/f/b/k/e$b;

    move v6, v2

    move-object v5, v3

    goto :goto_31f

    :cond_31e
    move v6, v2

    .line 203
    :goto_31f
    invoke-virtual {v1}, Lb/f/b/k/e;->k()I

    move-result v2

    .line 204
    sget-object v3, Lb/f/b/k/e$b;->MATCH_PARENT:Lb/f/b/k/e$b;

    if-ne v7, v3, :cond_33a

    .line 205
    invoke-virtual {p1}, Lb/f/b/k/e;->k()I

    move-result v2

    iget-object v3, v1, Lb/f/b/k/e;->B:Lb/f/b/k/d;

    iget v3, v3, Lb/f/b/k/d;->e:I

    sub-int/2addr v2, v3

    iget-object v3, v1, Lb/f/b/k/e;->D:Lb/f/b/k/d;

    iget v3, v3, Lb/f/b/k/d;->e:I

    sub-int/2addr v2, v3

    .line 206
    sget-object v3, Lb/f/b/k/e$b;->FIXED:Lb/f/b/k/e$b;

    move v8, v2

    move-object v7, v3

    goto :goto_33b

    :cond_33a
    move v8, v2

    :goto_33b
    move-object v3, p0

    move-object v4, v1

    .line 207
    invoke-virtual/range {v3 .. v8}, Lb/f/b/k/n/e;->a(Lb/f/b/k/e;Lb/f/b/k/e$b;ILb/f/b/k/e$b;I)V

    .line 208
    iget-object v2, v1, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    iget-object v2, v2, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-virtual {v1}, Lb/f/b/k/e;->A()I

    move-result v3

    invoke-virtual {v2, v3}, Lb/f/b/k/n/g;->a(I)V

    .line 209
    iget-object v2, v1, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v2, v2, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-virtual {v1}, Lb/f/b/k/e;->k()I

    move-result v3

    invoke-virtual {v2, v3}, Lb/f/b/k/n/g;->a(I)V

    .line 210
    iput-boolean v9, v1, Lb/f/b/k/e;->a:Z

    goto/16 :goto_6

    :cond_35a
    return v2
.end method

.method public a(Z)Z
    .registers 10

    const/4 v0, 0x1

    and-int/2addr p1, v0

    .line 6
    iget-boolean v1, p0, Lb/f/b/k/n/e;->b:Z

    const/4 v2, 0x0

    if-nez v1, :cond_b

    iget-boolean v1, p0, Lb/f/b/k/n/e;->c:Z

    if-eqz v1, :cond_3e

    .line 7
    :cond_b
    iget-object v1, p0, Lb/f/b/k/n/e;->a:Lb/f/b/k/f;

    iget-object v1, v1, Lb/f/b/k/m;->D0:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_13
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2c

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lb/f/b/k/e;

    .line 8
    iput-boolean v2, v3, Lb/f/b/k/e;->a:Z

    .line 9
    iget-object v4, v3, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    invoke-virtual {v4}, Lb/f/b/k/n/j;->g()V

    .line 10
    iget-object v3, v3, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    invoke-virtual {v3}, Lb/f/b/k/n/l;->g()V

    goto :goto_13

    .line 11
    :cond_2c
    iget-object v1, p0, Lb/f/b/k/n/e;->a:Lb/f/b/k/f;

    iput-boolean v2, v1, Lb/f/b/k/e;->a:Z

    .line 12
    iget-object v1, v1, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    invoke-virtual {v1}, Lb/f/b/k/n/j;->g()V

    .line 13
    iget-object v1, p0, Lb/f/b/k/n/e;->a:Lb/f/b/k/f;

    iget-object v1, v1, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    invoke-virtual {v1}, Lb/f/b/k/n/l;->g()V

    .line 14
    iput-boolean v2, p0, Lb/f/b/k/n/e;->c:Z

    .line 15
    :cond_3e
    iget-object v1, p0, Lb/f/b/k/n/e;->d:Lb/f/b/k/f;

    invoke-virtual {p0, v1}, Lb/f/b/k/n/e;->a(Lb/f/b/k/f;)Z

    move-result v1

    if-eqz v1, :cond_47

    return v2

    .line 16
    :cond_47
    iget-object v1, p0, Lb/f/b/k/n/e;->a:Lb/f/b/k/f;

    invoke-virtual {v1, v2}, Lb/f/b/k/e;->r(I)V

    .line 17
    iget-object v1, p0, Lb/f/b/k/n/e;->a:Lb/f/b/k/f;

    invoke-virtual {v1, v2}, Lb/f/b/k/e;->s(I)V

    .line 18
    iget-object v1, p0, Lb/f/b/k/n/e;->a:Lb/f/b/k/f;

    invoke-virtual {v1, v2}, Lb/f/b/k/e;->b(I)Lb/f/b/k/e$b;

    move-result-object v1

    .line 19
    iget-object v3, p0, Lb/f/b/k/n/e;->a:Lb/f/b/k/f;

    invoke-virtual {v3, v0}, Lb/f/b/k/e;->b(I)Lb/f/b/k/e$b;

    move-result-object v3

    .line 20
    iget-boolean v4, p0, Lb/f/b/k/n/e;->b:Z

    if-eqz v4, :cond_64

    .line 21
    invoke-virtual {p0}, Lb/f/b/k/n/e;->a()V

    .line 22
    :cond_64
    iget-object v4, p0, Lb/f/b/k/n/e;->a:Lb/f/b/k/f;

    invoke-virtual {v4}, Lb/f/b/k/e;->B()I

    move-result v4

    .line 23
    iget-object v5, p0, Lb/f/b/k/n/e;->a:Lb/f/b/k/f;

    invoke-virtual {v5}, Lb/f/b/k/e;->C()I

    move-result v5

    .line 24
    iget-object v6, p0, Lb/f/b/k/n/e;->a:Lb/f/b/k/f;

    iget-object v6, v6, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    iget-object v6, v6, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    invoke-virtual {v6, v4}, Lb/f/b/k/n/f;->a(I)V

    .line 25
    iget-object v6, p0, Lb/f/b/k/n/e;->a:Lb/f/b/k/f;

    iget-object v6, v6, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v6, v6, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    invoke-virtual {v6, v5}, Lb/f/b/k/n/f;->a(I)V

    .line 26
    invoke-virtual {p0}, Lb/f/b/k/n/e;->d()V

    .line 27
    sget-object v6, Lb/f/b/k/e$b;->WRAP_CONTENT:Lb/f/b/k/e$b;

    if-eq v1, v6, :cond_8b

    if-ne v3, v6, :cond_ec

    :cond_8b
    if-eqz p1, :cond_a6

    .line 28
    iget-object v6, p0, Lb/f/b/k/n/e;->e:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_93
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_a6

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lb/f/b/k/n/m;

    .line 29
    invoke-virtual {v7}, Lb/f/b/k/n/m;->f()Z

    move-result v7

    if-nez v7, :cond_93

    const/4 p1, 0x0

    :cond_a6
    if-eqz p1, :cond_c9

    .line 30
    sget-object v6, Lb/f/b/k/e$b;->WRAP_CONTENT:Lb/f/b/k/e$b;

    if-ne v1, v6, :cond_c9

    .line 31
    iget-object v6, p0, Lb/f/b/k/n/e;->a:Lb/f/b/k/f;

    sget-object v7, Lb/f/b/k/e$b;->FIXED:Lb/f/b/k/e$b;

    invoke-virtual {v6, v7}, Lb/f/b/k/e;->a(Lb/f/b/k/e$b;)V

    .line 32
    iget-object v6, p0, Lb/f/b/k/n/e;->a:Lb/f/b/k/f;

    invoke-virtual {p0, v6, v2}, Lb/f/b/k/n/e;->a(Lb/f/b/k/f;I)I

    move-result v7

    invoke-virtual {v6, v7}, Lb/f/b/k/e;->q(I)V

    .line 33
    iget-object v6, p0, Lb/f/b/k/n/e;->a:Lb/f/b/k/f;

    iget-object v7, v6, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    iget-object v7, v7, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-virtual {v6}, Lb/f/b/k/e;->A()I

    move-result v6

    invoke-virtual {v7, v6}, Lb/f/b/k/n/g;->a(I)V

    :cond_c9
    if-eqz p1, :cond_ec

    .line 34
    sget-object p1, Lb/f/b/k/e$b;->WRAP_CONTENT:Lb/f/b/k/e$b;

    if-ne v3, p1, :cond_ec

    .line 35
    iget-object p1, p0, Lb/f/b/k/n/e;->a:Lb/f/b/k/f;

    sget-object v6, Lb/f/b/k/e$b;->FIXED:Lb/f/b/k/e$b;

    invoke-virtual {p1, v6}, Lb/f/b/k/e;->b(Lb/f/b/k/e$b;)V

    .line 36
    iget-object p1, p0, Lb/f/b/k/n/e;->a:Lb/f/b/k/f;

    invoke-virtual {p0, p1, v0}, Lb/f/b/k/n/e;->a(Lb/f/b/k/f;I)I

    move-result v6

    invoke-virtual {p1, v6}, Lb/f/b/k/e;->i(I)V

    .line 37
    iget-object p1, p0, Lb/f/b/k/n/e;->a:Lb/f/b/k/f;

    iget-object v6, p1, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v6, v6, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-virtual {p1}, Lb/f/b/k/e;->k()I

    move-result p1

    invoke-virtual {v6, p1}, Lb/f/b/k/n/g;->a(I)V

    .line 38
    :cond_ec
    iget-object p1, p0, Lb/f/b/k/n/e;->a:Lb/f/b/k/f;

    iget-object p1, p1, Lb/f/b/k/e;->L:[Lb/f/b/k/e$b;

    aget-object v6, p1, v2

    sget-object v7, Lb/f/b/k/e$b;->FIXED:Lb/f/b/k/e$b;

    if-eq v6, v7, :cond_ff

    aget-object p1, p1, v2

    sget-object v6, Lb/f/b/k/e$b;->MATCH_PARENT:Lb/f/b/k/e$b;

    if-ne p1, v6, :cond_fd

    goto :goto_ff

    :cond_fd
    const/4 p1, 0x0

    goto :goto_14a

    .line 39
    :cond_ff
    :goto_ff
    iget-object p1, p0, Lb/f/b/k/n/e;->a:Lb/f/b/k/f;

    invoke-virtual {p1}, Lb/f/b/k/e;->A()I

    move-result p1

    add-int/2addr p1, v4

    .line 40
    iget-object v6, p0, Lb/f/b/k/n/e;->a:Lb/f/b/k/f;

    iget-object v6, v6, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    iget-object v6, v6, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    invoke-virtual {v6, p1}, Lb/f/b/k/n/f;->a(I)V

    .line 41
    iget-object v6, p0, Lb/f/b/k/n/e;->a:Lb/f/b/k/f;

    iget-object v6, v6, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    iget-object v6, v6, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    sub-int/2addr p1, v4

    invoke-virtual {v6, p1}, Lb/f/b/k/n/g;->a(I)V

    .line 42
    invoke-virtual {p0}, Lb/f/b/k/n/e;->d()V

    .line 43
    iget-object p1, p0, Lb/f/b/k/n/e;->a:Lb/f/b/k/f;

    iget-object p1, p1, Lb/f/b/k/e;->L:[Lb/f/b/k/e$b;

    aget-object v4, p1, v0

    sget-object v6, Lb/f/b/k/e$b;->FIXED:Lb/f/b/k/e$b;

    if-eq v4, v6, :cond_12c

    aget-object p1, p1, v0

    sget-object v4, Lb/f/b/k/e$b;->MATCH_PARENT:Lb/f/b/k/e$b;

    if-ne p1, v4, :cond_146

    .line 44
    :cond_12c
    iget-object p1, p0, Lb/f/b/k/n/e;->a:Lb/f/b/k/f;

    invoke-virtual {p1}, Lb/f/b/k/e;->k()I

    move-result p1

    add-int/2addr p1, v5

    .line 45
    iget-object v4, p0, Lb/f/b/k/n/e;->a:Lb/f/b/k/f;

    iget-object v4, v4, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v4, v4, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    invoke-virtual {v4, p1}, Lb/f/b/k/n/f;->a(I)V

    .line 46
    iget-object v4, p0, Lb/f/b/k/n/e;->a:Lb/f/b/k/f;

    iget-object v4, v4, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v4, v4, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    sub-int/2addr p1, v5

    invoke-virtual {v4, p1}, Lb/f/b/k/n/g;->a(I)V

    .line 47
    :cond_146
    invoke-virtual {p0}, Lb/f/b/k/n/e;->d()V

    const/4 p1, 0x1

    .line 48
    :goto_14a
    iget-object v4, p0, Lb/f/b/k/n/e;->e:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_150
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_16b

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lb/f/b/k/n/m;

    .line 49
    iget-object v6, v5, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v7, p0, Lb/f/b/k/n/e;->a:Lb/f/b/k/f;

    if-ne v6, v7, :cond_167

    iget-boolean v6, v5, Lb/f/b/k/n/m;->g:Z

    if-nez v6, :cond_167

    goto :goto_150

    .line 50
    :cond_167
    invoke-virtual {v5}, Lb/f/b/k/n/m;->b()V

    goto :goto_150

    .line 51
    :cond_16b
    iget-object v4, p0, Lb/f/b/k/n/e;->e:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_171
    :goto_171
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1a8

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lb/f/b/k/n/m;

    if-nez p1, :cond_186

    .line 52
    iget-object v6, v5, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v7, p0, Lb/f/b/k/n/e;->a:Lb/f/b/k/f;

    if-ne v6, v7, :cond_186

    goto :goto_171

    .line 53
    :cond_186
    iget-object v6, v5, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-boolean v6, v6, Lb/f/b/k/n/f;->j:Z

    if-nez v6, :cond_18e

    :goto_18c
    const/4 v0, 0x0

    goto :goto_1a8

    .line 54
    :cond_18e
    iget-object v6, v5, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget-boolean v6, v6, Lb/f/b/k/n/f;->j:Z

    if-nez v6, :cond_199

    instance-of v6, v5, Lb/f/b/k/n/h;

    if-nez v6, :cond_199

    goto :goto_18c

    .line 55
    :cond_199
    iget-object v6, v5, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget-boolean v6, v6, Lb/f/b/k/n/f;->j:Z

    if-nez v6, :cond_171

    instance-of v6, v5, Lb/f/b/k/n/c;

    if-nez v6, :cond_171

    instance-of v5, v5, Lb/f/b/k/n/h;

    if-nez v5, :cond_171

    goto :goto_18c

    .line 56
    :cond_1a8
    :goto_1a8
    iget-object p1, p0, Lb/f/b/k/n/e;->a:Lb/f/b/k/f;

    invoke-virtual {p1, v1}, Lb/f/b/k/e;->a(Lb/f/b/k/e$b;)V

    .line 57
    iget-object p1, p0, Lb/f/b/k/n/e;->a:Lb/f/b/k/f;

    invoke-virtual {p1, v3}, Lb/f/b/k/e;->b(Lb/f/b/k/e$b;)V

    return v0
.end method

.method public a(ZI)Z
    .registers 12

    const/4 v0, 0x1

    and-int/2addr p1, v0

    .line 58
    iget-object v1, p0, Lb/f/b/k/n/e;->a:Lb/f/b/k/f;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lb/f/b/k/e;->b(I)Lb/f/b/k/e$b;

    move-result-object v1

    .line 59
    iget-object v3, p0, Lb/f/b/k/n/e;->a:Lb/f/b/k/f;

    invoke-virtual {v3, v0}, Lb/f/b/k/e;->b(I)Lb/f/b/k/e$b;

    move-result-object v3

    .line 60
    iget-object v4, p0, Lb/f/b/k/n/e;->a:Lb/f/b/k/f;

    invoke-virtual {v4}, Lb/f/b/k/e;->B()I

    move-result v4

    .line 61
    iget-object v5, p0, Lb/f/b/k/n/e;->a:Lb/f/b/k/f;

    invoke-virtual {v5}, Lb/f/b/k/e;->C()I

    move-result v5

    if-eqz p1, :cond_89

    .line 62
    sget-object v6, Lb/f/b/k/e$b;->WRAP_CONTENT:Lb/f/b/k/e$b;

    if-eq v1, v6, :cond_23

    if-ne v3, v6, :cond_89

    .line 63
    :cond_23
    iget-object v6, p0, Lb/f/b/k/n/e;->e:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_29
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_40

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lb/f/b/k/n/m;

    .line 64
    iget v8, v7, Lb/f/b/k/n/m;->f:I

    if-ne v8, p2, :cond_29

    .line 65
    invoke-virtual {v7}, Lb/f/b/k/n/m;->f()Z

    move-result v7

    if-nez v7, :cond_29

    const/4 p1, 0x0

    :cond_40
    if-nez p2, :cond_66

    if-eqz p1, :cond_89

    .line 66
    sget-object p1, Lb/f/b/k/e$b;->WRAP_CONTENT:Lb/f/b/k/e$b;

    if-ne v1, p1, :cond_89

    .line 67
    iget-object p1, p0, Lb/f/b/k/n/e;->a:Lb/f/b/k/f;

    sget-object v6, Lb/f/b/k/e$b;->FIXED:Lb/f/b/k/e$b;

    invoke-virtual {p1, v6}, Lb/f/b/k/e;->a(Lb/f/b/k/e$b;)V

    .line 68
    iget-object p1, p0, Lb/f/b/k/n/e;->a:Lb/f/b/k/f;

    invoke-virtual {p0, p1, v2}, Lb/f/b/k/n/e;->a(Lb/f/b/k/f;I)I

    move-result v6

    invoke-virtual {p1, v6}, Lb/f/b/k/e;->q(I)V

    .line 69
    iget-object p1, p0, Lb/f/b/k/n/e;->a:Lb/f/b/k/f;

    iget-object v6, p1, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    iget-object v6, v6, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-virtual {p1}, Lb/f/b/k/e;->A()I

    move-result p1

    invoke-virtual {v6, p1}, Lb/f/b/k/n/g;->a(I)V

    goto :goto_89

    :cond_66
    if-eqz p1, :cond_89

    .line 70
    sget-object p1, Lb/f/b/k/e$b;->WRAP_CONTENT:Lb/f/b/k/e$b;

    if-ne v3, p1, :cond_89

    .line 71
    iget-object p1, p0, Lb/f/b/k/n/e;->a:Lb/f/b/k/f;

    sget-object v6, Lb/f/b/k/e$b;->FIXED:Lb/f/b/k/e$b;

    invoke-virtual {p1, v6}, Lb/f/b/k/e;->b(Lb/f/b/k/e$b;)V

    .line 72
    iget-object p1, p0, Lb/f/b/k/n/e;->a:Lb/f/b/k/f;

    invoke-virtual {p0, p1, v0}, Lb/f/b/k/n/e;->a(Lb/f/b/k/f;I)I

    move-result v6

    invoke-virtual {p1, v6}, Lb/f/b/k/e;->i(I)V

    .line 73
    iget-object p1, p0, Lb/f/b/k/n/e;->a:Lb/f/b/k/f;

    iget-object v6, p1, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v6, v6, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-virtual {p1}, Lb/f/b/k/e;->k()I

    move-result p1

    invoke-virtual {v6, p1}, Lb/f/b/k/n/g;->a(I)V

    :cond_89
    :goto_89
    if-nez p2, :cond_b6

    .line 74
    iget-object p1, p0, Lb/f/b/k/n/e;->a:Lb/f/b/k/f;

    iget-object p1, p1, Lb/f/b/k/e;->L:[Lb/f/b/k/e$b;

    aget-object v5, p1, v2

    sget-object v6, Lb/f/b/k/e$b;->FIXED:Lb/f/b/k/e$b;

    if-eq v5, v6, :cond_9b

    aget-object p1, p1, v2

    sget-object v5, Lb/f/b/k/e$b;->MATCH_PARENT:Lb/f/b/k/e$b;

    if-ne p1, v5, :cond_c7

    .line 75
    :cond_9b
    iget-object p1, p0, Lb/f/b/k/n/e;->a:Lb/f/b/k/f;

    invoke-virtual {p1}, Lb/f/b/k/e;->A()I

    move-result p1

    add-int/2addr p1, v4

    .line 76
    iget-object v5, p0, Lb/f/b/k/n/e;->a:Lb/f/b/k/f;

    iget-object v5, v5, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    iget-object v5, v5, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    invoke-virtual {v5, p1}, Lb/f/b/k/n/f;->a(I)V

    .line 77
    iget-object v5, p0, Lb/f/b/k/n/e;->a:Lb/f/b/k/f;

    iget-object v5, v5, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    iget-object v5, v5, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    sub-int/2addr p1, v4

    invoke-virtual {v5, p1}, Lb/f/b/k/n/g;->a(I)V

    goto :goto_e3

    .line 78
    :cond_b6
    iget-object p1, p0, Lb/f/b/k/n/e;->a:Lb/f/b/k/f;

    iget-object p1, p1, Lb/f/b/k/e;->L:[Lb/f/b/k/e$b;

    aget-object v4, p1, v0

    sget-object v6, Lb/f/b/k/e$b;->FIXED:Lb/f/b/k/e$b;

    if-eq v4, v6, :cond_c9

    aget-object p1, p1, v0

    sget-object v4, Lb/f/b/k/e$b;->MATCH_PARENT:Lb/f/b/k/e$b;

    if-ne p1, v4, :cond_c7

    goto :goto_c9

    :cond_c7
    const/4 p1, 0x0

    goto :goto_e4

    .line 79
    :cond_c9
    :goto_c9
    iget-object p1, p0, Lb/f/b/k/n/e;->a:Lb/f/b/k/f;

    invoke-virtual {p1}, Lb/f/b/k/e;->k()I

    move-result p1

    add-int/2addr p1, v5

    .line 80
    iget-object v4, p0, Lb/f/b/k/n/e;->a:Lb/f/b/k/f;

    iget-object v4, v4, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v4, v4, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    invoke-virtual {v4, p1}, Lb/f/b/k/n/f;->a(I)V

    .line 81
    iget-object v4, p0, Lb/f/b/k/n/e;->a:Lb/f/b/k/f;

    iget-object v4, v4, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v4, v4, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    sub-int/2addr p1, v5

    invoke-virtual {v4, p1}, Lb/f/b/k/n/g;->a(I)V

    :goto_e3
    const/4 p1, 0x1

    .line 82
    :goto_e4
    invoke-virtual {p0}, Lb/f/b/k/n/e;->d()V

    .line 83
    iget-object v4, p0, Lb/f/b/k/n/e;->e:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_ed
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_10d

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lb/f/b/k/n/m;

    .line 84
    iget v6, v5, Lb/f/b/k/n/m;->f:I

    if-eq v6, p2, :cond_fe

    goto :goto_ed

    .line 85
    :cond_fe
    iget-object v6, v5, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v7, p0, Lb/f/b/k/n/e;->a:Lb/f/b/k/f;

    if-ne v6, v7, :cond_109

    iget-boolean v6, v5, Lb/f/b/k/n/m;->g:Z

    if-nez v6, :cond_109

    goto :goto_ed

    .line 86
    :cond_109
    invoke-virtual {v5}, Lb/f/b/k/n/m;->b()V

    goto :goto_ed

    .line 87
    :cond_10d
    iget-object v4, p0, Lb/f/b/k/n/e;->e:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_113
    :goto_113
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_147

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lb/f/b/k/n/m;

    .line 88
    iget v6, v5, Lb/f/b/k/n/m;->f:I

    if-eq v6, p2, :cond_124

    goto :goto_113

    :cond_124
    if-nez p1, :cond_12d

    .line 89
    iget-object v6, v5, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v7, p0, Lb/f/b/k/n/e;->a:Lb/f/b/k/f;

    if-ne v6, v7, :cond_12d

    goto :goto_113

    .line 90
    :cond_12d
    iget-object v6, v5, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-boolean v6, v6, Lb/f/b/k/n/f;->j:Z

    if-nez v6, :cond_135

    :goto_133
    const/4 v0, 0x0

    goto :goto_147

    .line 91
    :cond_135
    iget-object v6, v5, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget-boolean v6, v6, Lb/f/b/k/n/f;->j:Z

    if-nez v6, :cond_13c

    goto :goto_133

    .line 92
    :cond_13c
    instance-of v6, v5, Lb/f/b/k/n/c;

    if-nez v6, :cond_113

    iget-object v5, v5, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget-boolean v5, v5, Lb/f/b/k/n/f;->j:Z

    if-nez v5, :cond_113

    goto :goto_133

    .line 93
    :cond_147
    :goto_147
    iget-object p1, p0, Lb/f/b/k/n/e;->a:Lb/f/b/k/f;

    invoke-virtual {p1, v1}, Lb/f/b/k/e;->a(Lb/f/b/k/e$b;)V

    .line 94
    iget-object p1, p0, Lb/f/b/k/n/e;->a:Lb/f/b/k/f;

    invoke-virtual {p1, v3}, Lb/f/b/k/e;->b(Lb/f/b/k/e$b;)V

    return v0
.end method

.method public b()V
    .registers 2

    const/4 v0, 0x1

    .line 23
    iput-boolean v0, p0, Lb/f/b/k/n/e;->b:Z

    return-void
.end method

.method public b(Z)Z
    .registers 6

    .line 1
    iget-boolean p1, p0, Lb/f/b/k/n/e;->b:Z

    const/4 v0, 0x0

    if-eqz p1, :cond_51

    .line 2
    iget-object p1, p0, Lb/f/b/k/n/e;->a:Lb/f/b/k/f;

    iget-object p1, p1, Lb/f/b/k/m;->D0:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_d
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_32

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/f/b/k/e;

    .line 3
    iput-boolean v0, v1, Lb/f/b/k/e;->a:Z

    .line 4
    iget-object v2, v1, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    iget-object v3, v2, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iput-boolean v0, v3, Lb/f/b/k/n/f;->j:Z

    .line 5
    iput-boolean v0, v2, Lb/f/b/k/n/m;->g:Z

    .line 6
    invoke-virtual {v2}, Lb/f/b/k/n/j;->g()V

    .line 7
    iget-object v1, v1, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v2, v1, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iput-boolean v0, v2, Lb/f/b/k/n/f;->j:Z

    .line 8
    iput-boolean v0, v1, Lb/f/b/k/n/m;->g:Z

    .line 9
    invoke-virtual {v1}, Lb/f/b/k/n/l;->g()V

    goto :goto_d

    .line 10
    :cond_32
    iget-object p1, p0, Lb/f/b/k/n/e;->a:Lb/f/b/k/f;

    iput-boolean v0, p1, Lb/f/b/k/e;->a:Z

    .line 11
    iget-object p1, p1, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    iget-object v1, p1, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iput-boolean v0, v1, Lb/f/b/k/n/f;->j:Z

    .line 12
    iput-boolean v0, p1, Lb/f/b/k/n/m;->g:Z

    .line 13
    invoke-virtual {p1}, Lb/f/b/k/n/j;->g()V

    .line 14
    iget-object p1, p0, Lb/f/b/k/n/e;->a:Lb/f/b/k/f;

    iget-object p1, p1, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v1, p1, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iput-boolean v0, v1, Lb/f/b/k/n/f;->j:Z

    .line 15
    iput-boolean v0, p1, Lb/f/b/k/n/m;->g:Z

    .line 16
    invoke-virtual {p1}, Lb/f/b/k/n/l;->g()V

    .line 17
    invoke-virtual {p0}, Lb/f/b/k/n/e;->a()V

    .line 18
    :cond_51
    iget-object p1, p0, Lb/f/b/k/n/e;->d:Lb/f/b/k/f;

    invoke-virtual {p0, p1}, Lb/f/b/k/n/e;->a(Lb/f/b/k/f;)Z

    move-result p1

    if-eqz p1, :cond_5a

    return v0

    .line 19
    :cond_5a
    iget-object p1, p0, Lb/f/b/k/n/e;->a:Lb/f/b/k/f;

    invoke-virtual {p1, v0}, Lb/f/b/k/e;->r(I)V

    .line 20
    iget-object p1, p0, Lb/f/b/k/n/e;->a:Lb/f/b/k/f;

    invoke-virtual {p1, v0}, Lb/f/b/k/e;->s(I)V

    .line 21
    iget-object p1, p0, Lb/f/b/k/n/e;->a:Lb/f/b/k/f;

    iget-object p1, p1, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    iget-object p1, p1, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    invoke-virtual {p1, v0}, Lb/f/b/k/n/f;->a(I)V

    .line 22
    iget-object p1, p0, Lb/f/b/k/n/e;->a:Lb/f/b/k/f;

    iget-object p1, p1, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object p1, p1, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    invoke-virtual {p1, v0}, Lb/f/b/k/n/f;->a(I)V

    const/4 p1, 0x1

    return p1
.end method

.method public c()V
    .registers 2

    const/4 v0, 0x1

    .line 1
    iput-boolean v0, p0, Lb/f/b/k/n/e;->c:Z

    return-void
.end method

.method public d()V
    .registers 12

    .line 1
    iget-object v0, p0, Lb/f/b/k/n/e;->a:Lb/f/b/k/f;

    iget-object v0, v0, Lb/f/b/k/m;->D0:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_8
    :goto_8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_de

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/f/b/k/e;

    .line 2
    iget-boolean v2, v1, Lb/f/b/k/e;->a:Z

    if-eqz v2, :cond_19

    goto :goto_8

    .line 3
    :cond_19
    iget-object v2, v1, Lb/f/b/k/e;->L:[Lb/f/b/k/e$b;

    const/4 v3, 0x0

    aget-object v8, v2, v3

    const/4 v9, 0x1

    .line 4
    aget-object v10, v2, v9

    .line 5
    iget v2, v1, Lb/f/b/k/e;->j:I

    .line 6
    iget v4, v1, Lb/f/b/k/e;->k:I

    .line 7
    sget-object v5, Lb/f/b/k/e$b;->WRAP_CONTENT:Lb/f/b/k/e$b;

    if-eq v8, v5, :cond_32

    sget-object v5, Lb/f/b/k/e$b;->MATCH_CONSTRAINT:Lb/f/b/k/e$b;

    if-ne v8, v5, :cond_30

    if-ne v2, v9, :cond_30

    goto :goto_32

    :cond_30
    const/4 v2, 0x0

    goto :goto_33

    :cond_32
    :goto_32
    const/4 v2, 0x1

    .line 8
    :goto_33
    sget-object v5, Lb/f/b/k/e$b;->WRAP_CONTENT:Lb/f/b/k/e$b;

    if-eq v10, v5, :cond_3d

    sget-object v5, Lb/f/b/k/e$b;->MATCH_CONSTRAINT:Lb/f/b/k/e$b;

    if-ne v10, v5, :cond_3e

    if-ne v4, v9, :cond_3e

    :cond_3d
    const/4 v3, 0x1

    .line 9
    :cond_3e
    iget-object v4, v1, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    iget-object v4, v4, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget-boolean v5, v4, Lb/f/b/k/n/f;->j:Z

    .line 10
    iget-object v6, v1, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v6, v6, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget-boolean v7, v6, Lb/f/b/k/n/f;->j:Z

    if-eqz v5, :cond_60

    if-eqz v7, :cond_60

    .line 11
    sget-object v7, Lb/f/b/k/e$b;->FIXED:Lb/f/b/k/e$b;

    iget v5, v4, Lb/f/b/k/n/f;->g:I

    iget v8, v6, Lb/f/b/k/n/f;->g:I

    move-object v2, p0

    move-object v3, v1

    move-object v4, v7

    move-object v6, v7

    move v7, v8

    invoke-virtual/range {v2 .. v7}, Lb/f/b/k/n/e;->a(Lb/f/b/k/e;Lb/f/b/k/e$b;ILb/f/b/k/e$b;I)V

    .line 12
    iput-boolean v9, v1, Lb/f/b/k/e;->a:Z

    goto/16 :goto_cb

    :cond_60
    if-eqz v5, :cond_96

    if-eqz v3, :cond_96

    .line 13
    sget-object v4, Lb/f/b/k/e$b;->FIXED:Lb/f/b/k/e$b;

    iget-object v2, v1, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    iget-object v2, v2, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget v5, v2, Lb/f/b/k/n/f;->g:I

    sget-object v6, Lb/f/b/k/e$b;->WRAP_CONTENT:Lb/f/b/k/e$b;

    iget-object v2, v1, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v2, v2, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget v7, v2, Lb/f/b/k/n/f;->g:I

    move-object v2, p0

    move-object v3, v1

    invoke-virtual/range {v2 .. v7}, Lb/f/b/k/n/e;->a(Lb/f/b/k/e;Lb/f/b/k/e$b;ILb/f/b/k/e$b;I)V

    .line 14
    sget-object v2, Lb/f/b/k/e$b;->MATCH_CONSTRAINT:Lb/f/b/k/e$b;

    if-ne v10, v2, :cond_88

    .line 15
    iget-object v2, v1, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v2, v2, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-virtual {v1}, Lb/f/b/k/e;->k()I

    move-result v3

    iput v3, v2, Lb/f/b/k/n/g;->m:I

    goto :goto_cb

    .line 16
    :cond_88
    iget-object v2, v1, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v2, v2, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-virtual {v1}, Lb/f/b/k/e;->k()I

    move-result v3

    invoke-virtual {v2, v3}, Lb/f/b/k/n/g;->a(I)V

    .line 17
    iput-boolean v9, v1, Lb/f/b/k/e;->a:Z

    goto :goto_cb

    :cond_96
    if-eqz v7, :cond_cb

    if-eqz v2, :cond_cb

    .line 18
    sget-object v4, Lb/f/b/k/e$b;->WRAP_CONTENT:Lb/f/b/k/e$b;

    iget-object v2, v1, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    iget-object v2, v2, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget v5, v2, Lb/f/b/k/n/f;->g:I

    sget-object v6, Lb/f/b/k/e$b;->FIXED:Lb/f/b/k/e$b;

    iget-object v2, v1, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v2, v2, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget v7, v2, Lb/f/b/k/n/f;->g:I

    move-object v2, p0

    move-object v3, v1

    invoke-virtual/range {v2 .. v7}, Lb/f/b/k/n/e;->a(Lb/f/b/k/e;Lb/f/b/k/e$b;ILb/f/b/k/e$b;I)V

    .line 19
    sget-object v2, Lb/f/b/k/e$b;->MATCH_CONSTRAINT:Lb/f/b/k/e$b;

    if-ne v8, v2, :cond_be

    .line 20
    iget-object v2, v1, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    iget-object v2, v2, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-virtual {v1}, Lb/f/b/k/e;->A()I

    move-result v3

    iput v3, v2, Lb/f/b/k/n/g;->m:I

    goto :goto_cb

    .line 21
    :cond_be
    iget-object v2, v1, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    iget-object v2, v2, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-virtual {v1}, Lb/f/b/k/e;->A()I

    move-result v3

    invoke-virtual {v2, v3}, Lb/f/b/k/n/g;->a(I)V

    .line 22
    iput-boolean v9, v1, Lb/f/b/k/e;->a:Z

    .line 23
    :cond_cb
    :goto_cb
    iget-boolean v2, v1, Lb/f/b/k/e;->a:Z

    if-eqz v2, :cond_8

    iget-object v2, v1, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v2, v2, Lb/f/b/k/n/l;->l:Lb/f/b/k/n/g;

    if-eqz v2, :cond_8

    .line 24
    invoke-virtual {v1}, Lb/f/b/k/e;->e()I

    move-result v1

    invoke-virtual {v2, v1}, Lb/f/b/k/n/g;->a(I)V

    goto/16 :goto_8

    :cond_de
    return-void
.end method
