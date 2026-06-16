.class public Lb/l/d/p;
.super Ljava/lang/Object;
.source "FragmentStore.java"


# instance fields
.field public final a:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroidx/fragment/app/Fragment;",
            ">;"
        }
    .end annotation
.end field

.field public final b:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lb/l/d/o;",
            ">;"
        }
    .end annotation
.end field

.field public c:Lb/l/d/l;


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lb/l/d/p;->a:Ljava/util/ArrayList;

    .line 3
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lb/l/d/p;->b:Ljava/util/HashMap;

    return-void
.end method


# virtual methods
.method public a()V
    .registers 3

    .line 28
    iget-object v0, p0, Lb/l/d/p;->b:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v0

    const/4 v1, 0x0

    .line 29
    invoke-static {v1}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Collection;->removeAll(Ljava/util/Collection;)Z

    return-void
.end method

.method public a(I)V
    .registers 4

    .line 26
    iget-object v0, p0, Lb/l/d/p;->b:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_a
    :goto_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1c

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/l/d/o;

    if-eqz v1, :cond_a

    .line 27
    invoke-virtual {v1, p1}, Lb/l/d/o;->a(I)V

    goto :goto_a

    :cond_1c
    return-void
.end method

.method public a(Landroidx/fragment/app/Fragment;)V
    .registers 5

    .line 19
    iget-object v0, p0, Lb/l/d/p;->a:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_18

    .line 20
    iget-object v0, p0, Lb/l/d/p;->a:Ljava/util/ArrayList;

    monitor-enter v0

    .line 21
    :try_start_b
    iget-object v1, p0, Lb/l/d/p;->a:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 22
    monitor-exit v0
    :try_end_11
    .catchall {:try_start_b .. :try_end_11} :catchall_15

    const/4 v0, 0x1

    .line 23
    iput-boolean v0, p1, Landroidx/fragment/app/Fragment;->s:Z

    return-void

    :catchall_15
    move-exception p1

    .line 24
    :try_start_16
    monitor-exit v0
    :try_end_17
    .catchall {:try_start_16 .. :try_end_17} :catchall_15

    throw p1

    .line 25
    :cond_18
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Fragment already added: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public a(Lb/l/d/l;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lb/l/d/p;->c:Lb/l/d/l;

    return-void
.end method

.method public a(Lb/l/d/o;)V
    .registers 5

    .line 9
    invoke-virtual {p1}, Lb/l/d/o;->k()Landroidx/fragment/app/Fragment;

    move-result-object v0

    .line 10
    iget-object v1, v0, Landroidx/fragment/app/Fragment;->m:Ljava/lang/String;

    invoke-virtual {p0, v1}, Lb/l/d/p;->a(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_d

    return-void

    .line 11
    :cond_d
    iget-object v1, p0, Lb/l/d/p;->b:Ljava/util/HashMap;

    iget-object v2, v0, Landroidx/fragment/app/Fragment;->m:Ljava/lang/String;

    invoke-virtual {v1, v2, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    iget-boolean p1, v0, Landroidx/fragment/app/Fragment;->J:Z

    if-eqz p1, :cond_2a

    .line 13
    iget-boolean p1, v0, Landroidx/fragment/app/Fragment;->I:Z

    if-eqz p1, :cond_22

    .line 14
    iget-object p1, p0, Lb/l/d/p;->c:Lb/l/d/l;

    invoke-virtual {p1, v0}, Lb/l/d/l;->a(Landroidx/fragment/app/Fragment;)V

    goto :goto_27

    .line 15
    :cond_22
    iget-object p1, p0, Lb/l/d/p;->c:Lb/l/d/l;

    invoke-virtual {p1, v0}, Lb/l/d/l;->e(Landroidx/fragment/app/Fragment;)V

    :goto_27
    const/4 p1, 0x0

    .line 16
    iput-boolean p1, v0, Landroidx/fragment/app/Fragment;->J:Z

    :cond_2a
    const/4 p1, 0x2

    .line 17
    invoke-static {p1}, Landroidx/fragment/app/FragmentManager;->d(I)Z

    move-result p1

    if-eqz p1, :cond_47

    .line 18
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Added fragment to active set "

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "FragmentManager"

    invoke-static {v0, p1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_47
    return-void
.end method

.method public a(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .registers 8

    .line 31
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "    "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 32
    iget-object v1, p0, Lb/l/d/p;->b:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_4d

    .line 33
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v1, "Active Fragments:"

    .line 34
    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 35
    iget-object v1, p0, Lb/l/d/p;->b:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_2b
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4d

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb/l/d/o;

    .line 36
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    if-eqz v2, :cond_47

    .line 37
    invoke-virtual {v2}, Lb/l/d/o;->k()Landroidx/fragment/app/Fragment;

    move-result-object v2

    .line 38
    invoke-virtual {p3, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 39
    invoke-virtual {v2, v0, p2, p3, p4}, Landroidx/fragment/app/Fragment;->a(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V

    goto :goto_2b

    :cond_47
    const-string v2, "null"

    .line 40
    invoke-virtual {p3, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto :goto_2b

    .line 41
    :cond_4d
    iget-object p2, p0, Lb/l/d/p;->a:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p2

    if-lez p2, :cond_82

    .line 42
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string p4, "Added Fragments:"

    invoke-virtual {p3, p4}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    const/4 p4, 0x0

    :goto_5e
    if-ge p4, p2, :cond_82

    .line 43
    iget-object v0, p0, Lb/l/d/p;->a:Ljava/util/ArrayList;

    invoke-virtual {v0, p4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/fragment/app/Fragment;

    .line 44
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v1, "  #"

    .line 45
    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 46
    invoke-virtual {p3, p4}, Ljava/io/PrintWriter;->print(I)V

    const-string v1, ": "

    .line 47
    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 48
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    add-int/lit8 p4, p4, 0x1

    goto :goto_5e

    :cond_82
    return-void
.end method

.method public a(Ljava/util/List;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 2
    iget-object v0, p0, Lb/l/d/p;->a:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    if-eqz p1, :cond_62

    .line 3
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_b
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_62

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 4
    invoke-virtual {p0, v0}, Lb/l/d/p;->b(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object v1

    if-eqz v1, :cond_46

    const/4 v2, 0x2

    .line 5
    invoke-static {v2}, Landroidx/fragment/app/FragmentManager;->d(I)Z

    move-result v2

    if-eqz v2, :cond_42

    .line 6
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "restoreSaveState: added ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "): "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v2, "FragmentManager"

    invoke-static {v2, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 7
    :cond_42
    invoke-virtual {p0, v1}, Lb/l/d/p;->a(Landroidx/fragment/app/Fragment;)V

    goto :goto_b

    .line 8
    :cond_46
    new-instance p1, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "No instantiated fragment for ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ")"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_62
    return-void
.end method

.method public a(Ljava/lang/String;)Z
    .registers 3

    .line 30
    iget-object v0, p0, Lb/l/d/p;->b:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_a

    const/4 p1, 0x1

    goto :goto_b

    :cond_a
    const/4 p1, 0x0

    :goto_b
    return p1
.end method

.method public b(Landroidx/fragment/app/Fragment;)I
    .registers 7

    .line 18
    iget-object v0, p1, Landroidx/fragment/app/Fragment;->N:Landroid/view/ViewGroup;

    const/4 v1, -0x1

    if-nez v0, :cond_6

    return v1

    .line 19
    :cond_6
    iget-object v2, p0, Lb/l/d/p;->a:Ljava/util/ArrayList;

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result p1

    add-int/lit8 v2, p1, -0x1

    :goto_e
    if-ltz v2, :cond_2a

    .line 20
    iget-object v3, p0, Lb/l/d/p;->a:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/fragment/app/Fragment;

    .line 21
    iget-object v4, v3, Landroidx/fragment/app/Fragment;->N:Landroid/view/ViewGroup;

    if-ne v4, v0, :cond_27

    iget-object v3, v3, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    if-eqz v3, :cond_27

    .line 22
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result p1

    add-int/lit8 p1, p1, 0x1

    return p1

    :cond_27
    add-int/lit8 v2, v2, -0x1

    goto :goto_e

    :cond_2a
    :goto_2a
    add-int/lit8 p1, p1, 0x1

    .line 23
    iget-object v2, p0, Lb/l/d/p;->a:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge p1, v2, :cond_4a

    .line 24
    iget-object v2, p0, Lb/l/d/p;->a:Ljava/util/ArrayList;

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/fragment/app/Fragment;

    .line 25
    iget-object v3, v2, Landroidx/fragment/app/Fragment;->N:Landroid/view/ViewGroup;

    if-ne v3, v0, :cond_49

    iget-object v2, v2, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    if-eqz v2, :cond_49

    .line 26
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result p1

    return p1

    :cond_49
    goto :goto_2a

    :cond_4a
    return v1
.end method

.method public b(I)Landroidx/fragment/app/Fragment;
    .registers 5

    .line 10
    iget-object v0, p0, Lb/l/d/p;->a:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_8
    if-ltz v0, :cond_1c

    .line 11
    iget-object v1, p0, Lb/l/d/p;->a:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/fragment/app/Fragment;

    if-eqz v1, :cond_19

    .line 12
    iget v2, v1, Landroidx/fragment/app/Fragment;->D:I

    if-ne v2, p1, :cond_19

    return-object v1

    :cond_19
    add-int/lit8 v0, v0, -0x1

    goto :goto_8

    .line 13
    :cond_1c
    iget-object v0, p0, Lb/l/d/p;->b:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_26
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3d

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/l/d/o;

    if-eqz v1, :cond_26

    .line 14
    invoke-virtual {v1}, Lb/l/d/o;->k()Landroidx/fragment/app/Fragment;

    move-result-object v1

    .line 15
    iget v2, v1, Landroidx/fragment/app/Fragment;->D:I

    if-ne v2, p1, :cond_26

    return-object v1

    :cond_3d
    const/4 p1, 0x0

    return-object p1
.end method

.method public b(Ljava/lang/String;)Landroidx/fragment/app/Fragment;
    .registers 3

    .line 16
    iget-object v0, p0, Lb/l/d/p;->b:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lb/l/d/o;

    if-eqz p1, :cond_f

    .line 17
    invoke-virtual {p1}, Lb/l/d/o;->k()Landroidx/fragment/app/Fragment;

    move-result-object p1

    return-object p1

    :cond_f
    const/4 p1, 0x0

    return-object p1
.end method

.method public b()Ljava/util/List;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lb/l/d/o;",
            ">;"
        }
    .end annotation

    .line 7
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 8
    iget-object v1, p0, Lb/l/d/p;->b:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_f
    :goto_f
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_21

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb/l/d/o;

    if-eqz v2, :cond_f

    .line 9
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_f

    :cond_21
    return-object v0
.end method

.method public b(Lb/l/d/o;)V
    .registers 5

    .line 1
    invoke-virtual {p1}, Lb/l/d/o;->k()Landroidx/fragment/app/Fragment;

    move-result-object p1

    .line 2
    iget-boolean v0, p1, Landroidx/fragment/app/Fragment;->I:Z

    if-eqz v0, :cond_d

    .line 3
    iget-object v0, p0, Lb/l/d/p;->c:Lb/l/d/l;

    invoke-virtual {v0, p1}, Lb/l/d/l;->e(Landroidx/fragment/app/Fragment;)V

    .line 4
    :cond_d
    iget-object v0, p0, Lb/l/d/p;->b:Ljava/util/HashMap;

    iget-object v1, p1, Landroidx/fragment/app/Fragment;->m:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb/l/d/o;

    if-nez v0, :cond_1b

    return-void

    :cond_1b
    const/4 v0, 0x2

    .line 5
    invoke-static {v0}, Landroidx/fragment/app/FragmentManager;->d(I)Z

    move-result v0

    if-eqz v0, :cond_38

    .line 6
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Removed fragment from active set "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "FragmentManager"

    invoke-static {v0, p1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_38
    return-void
.end method

.method public c(Ljava/lang/String;)Landroidx/fragment/app/Fragment;
    .registers 5

    if-eqz p1, :cond_22

    .line 10
    iget-object v0, p0, Lb/l/d/p;->a:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_a
    if-ltz v0, :cond_22

    .line 11
    iget-object v1, p0, Lb/l/d/p;->a:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/fragment/app/Fragment;

    if-eqz v1, :cond_1f

    .line 12
    iget-object v2, v1, Landroidx/fragment/app/Fragment;->F:Ljava/lang/String;

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1f

    return-object v1

    :cond_1f
    add-int/lit8 v0, v0, -0x1

    goto :goto_a

    :cond_22
    if-eqz p1, :cond_49

    .line 13
    iget-object v0, p0, Lb/l/d/p;->b:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_2e
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_49

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/l/d/o;

    if-eqz v1, :cond_2e

    .line 14
    invoke-virtual {v1}, Lb/l/d/o;->k()Landroidx/fragment/app/Fragment;

    move-result-object v1

    .line 15
    iget-object v2, v1, Landroidx/fragment/app/Fragment;->F:Ljava/lang/String;

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2e

    return-object v1

    :cond_49
    const/4 p1, 0x0

    return-object p1
.end method

.method public c()Ljava/util/List;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroidx/fragment/app/Fragment;",
            ">;"
        }
    .end annotation

    .line 6
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    iget-object v1, p0, Lb/l/d/p;->b:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_f
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2a

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb/l/d/o;

    if-eqz v2, :cond_25

    .line 8
    invoke-virtual {v2}, Lb/l/d/o;->k()Landroidx/fragment/app/Fragment;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_f

    :cond_25
    const/4 v2, 0x0

    .line 9
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_f

    :cond_2a
    return-object v0
.end method

.method public c(Landroidx/fragment/app/Fragment;)V
    .registers 4

    .line 1
    iget-object v0, p0, Lb/l/d/p;->a:Ljava/util/ArrayList;

    monitor-enter v0

    .line 2
    :try_start_3
    iget-object v1, p0, Lb/l/d/p;->a:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 3
    monitor-exit v0
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_d

    const/4 v0, 0x0

    .line 4
    iput-boolean v0, p1, Landroidx/fragment/app/Fragment;->s:Z

    return-void

    :catchall_d
    move-exception p1

    .line 5
    :try_start_e
    monitor-exit v0
    :try_end_f
    .catchall {:try_start_e .. :try_end_f} :catchall_d

    throw p1
.end method

.method public d(Ljava/lang/String;)Landroidx/fragment/app/Fragment;
    .registers 4

    .line 6
    iget-object v0, p0, Lb/l/d/p;->b:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_23

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/l/d/o;

    if-eqz v1, :cond_a

    .line 7
    invoke-virtual {v1}, Lb/l/d/o;->k()Landroidx/fragment/app/Fragment;

    move-result-object v1

    .line 8
    invoke-virtual {v1, p1}, Landroidx/fragment/app/Fragment;->a(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object v1

    if-eqz v1, :cond_a

    return-object v1

    :cond_23
    const/4 p1, 0x0

    return-object p1
.end method

.method public d()Ljava/util/List;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroidx/fragment/app/Fragment;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lb/l/d/p;->a:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_d

    .line 2
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    return-object v0

    .line 3
    :cond_d
    iget-object v0, p0, Lb/l/d/p;->a:Ljava/util/ArrayList;

    monitor-enter v0

    .line 4
    :try_start_10
    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Lb/l/d/p;->a:Ljava/util/ArrayList;

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    monitor-exit v0

    return-object v1

    :catchall_19
    move-exception v1

    .line 5
    monitor-exit v0
    :try_end_1b
    .catchall {:try_start_10 .. :try_end_1b} :catchall_19

    throw v1
.end method

.method public e()Lb/l/d/l;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/l/d/p;->c:Lb/l/d/l;

    return-object v0
.end method

.method public e(Ljava/lang/String;)Lb/l/d/o;
    .registers 3

    .line 2
    iget-object v0, p0, Lb/l/d/p;->b:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lb/l/d/o;

    return-object p1
.end method

.method public f()V
    .registers 5

    .line 1
    iget-object v0, p0, Lb/l/d/p;->a:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_6
    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_22

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/fragment/app/Fragment;

    .line 2
    iget-object v2, p0, Lb/l/d/p;->b:Ljava/util/HashMap;

    iget-object v1, v1, Landroidx/fragment/app/Fragment;->m:Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/l/d/o;

    if-eqz v1, :cond_6

    .line 3
    invoke-virtual {v1}, Lb/l/d/o;->l()V

    goto :goto_6

    .line 4
    :cond_22
    iget-object v0, p0, Lb/l/d/p;->b:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_2c
    :goto_2c
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_54

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/l/d/o;

    if-eqz v1, :cond_2c

    .line 5
    invoke-virtual {v1}, Lb/l/d/o;->l()V

    .line 6
    invoke-virtual {v1}, Lb/l/d/o;->k()Landroidx/fragment/app/Fragment;

    move-result-object v2

    .line 7
    iget-boolean v3, v2, Landroidx/fragment/app/Fragment;->t:Z

    if-eqz v3, :cond_4d

    invoke-virtual {v2}, Landroidx/fragment/app/Fragment;->S()Z

    move-result v2

    if-nez v2, :cond_4d

    const/4 v2, 0x1

    goto :goto_4e

    :cond_4d
    const/4 v2, 0x0

    :goto_4e
    if-eqz v2, :cond_2c

    .line 8
    invoke-virtual {p0, v1}, Lb/l/d/p;->b(Lb/l/d/o;)V

    goto :goto_2c

    :cond_54
    return-void
.end method

.method public g()V
    .registers 2

    .line 1
    iget-object v0, p0, Lb/l/d/p;->b:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    return-void
.end method

.method public h()Ljava/util/ArrayList;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Landroidx/fragment/app/FragmentState;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lb/l/d/p;->b:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 2
    iget-object v1, p0, Lb/l/d/p;->b:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_15
    :goto_15
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_56

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb/l/d/o;

    if-eqz v2, :cond_15

    .line 3
    invoke-virtual {v2}, Lb/l/d/o;->k()Landroidx/fragment/app/Fragment;

    move-result-object v3

    .line 4
    invoke-virtual {v2}, Lb/l/d/o;->p()Landroidx/fragment/app/FragmentState;

    move-result-object v2

    .line 5
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 v4, 0x2

    .line 6
    invoke-static {v4}, Landroidx/fragment/app/FragmentManager;->d(I)Z

    move-result v4

    if-eqz v4, :cond_15

    .line 7
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Saved state of "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, ": "

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, v2, Landroidx/fragment/app/FragmentState;->t:Landroid/os/Bundle;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "FragmentManager"

    invoke-static {v3, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_15

    :cond_56
    return-object v0
.end method

.method public i()Ljava/util/ArrayList;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lb/l/d/p;->a:Ljava/util/ArrayList;

    monitor-enter v0

    .line 2
    :try_start_3
    iget-object v1, p0, Lb/l/d/p;->a:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_e

    const/4 v1, 0x0

    .line 3
    monitor-exit v0

    return-object v1

    .line 4
    :cond_e
    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Lb/l/d/p;->a:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 5
    iget-object v2, p0, Lb/l/d/p;->a:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1f
    :goto_1f
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_58

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/fragment/app/Fragment;

    .line 6
    iget-object v4, v3, Landroidx/fragment/app/Fragment;->m:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 v4, 0x2

    .line 7
    invoke-static {v4}, Landroidx/fragment/app/FragmentManager;->d(I)Z

    move-result v4

    if-eqz v4, :cond_1f

    const-string v4, "FragmentManager"

    .line 8
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "saveAllState: adding fragment ("

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, v3, Landroidx/fragment/app/Fragment;->m:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "): "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v4, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1f

    .line 9
    :cond_58
    monitor-exit v0

    return-object v1

    :catchall_5a
    move-exception v1

    .line 10
    monitor-exit v0
    :try_end_5c
    .catchall {:try_start_3 .. :try_end_5c} :catchall_5a

    throw v1
.end method
