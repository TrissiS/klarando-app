.class public abstract Lb/l/d/w;
.super Ljava/lang/Object;
.source "SpecialEffectsController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lb/l/d/w$d;,
        Lb/l/d/w$e;
    }
.end annotation


# instance fields
.field public final a:Landroid/view/ViewGroup;

.field public final b:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lb/l/d/w$e;",
            ">;"
        }
    .end annotation
.end field

.field public final c:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lb/l/d/w$e;",
            ">;"
        }
    .end annotation
.end field

.field public d:Z

.field public e:Z


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;)V
    .registers 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lb/l/d/w;->b:Ljava/util/ArrayList;

    .line 3
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lb/l/d/w;->c:Ljava/util/ArrayList;

    const/4 v0, 0x0

    .line 4
    iput-boolean v0, p0, Lb/l/d/w;->d:Z

    .line 5
    iput-boolean v0, p0, Lb/l/d/w;->e:Z

    .line 6
    iput-object p1, p0, Lb/l/d/w;->a:Landroid/view/ViewGroup;

    return-void
.end method

.method public static a(Landroid/view/ViewGroup;Landroidx/fragment/app/FragmentManager;)Lb/l/d/w;
    .registers 2

    .line 1
    invoke-virtual {p1}, Landroidx/fragment/app/FragmentManager;->G()Lb/l/d/x;

    move-result-object p1

    .line 2
    invoke-static {p0, p1}, Lb/l/d/w;->a(Landroid/view/ViewGroup;Lb/l/d/x;)Lb/l/d/w;

    move-result-object p0

    return-object p0
.end method

.method public static a(Landroid/view/ViewGroup;Lb/l/d/x;)Lb/l/d/w;
    .registers 4

    .line 3
    sget v0, Lb/l/b;->special_effects_controller_view_tag:I

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getTag(I)Ljava/lang/Object;

    move-result-object v0

    .line 4
    instance-of v1, v0, Lb/l/d/w;

    if-eqz v1, :cond_d

    .line 5
    check-cast v0, Lb/l/d/w;

    return-object v0

    .line 6
    :cond_d
    invoke-interface {p1, p0}, Lb/l/d/x;->a(Landroid/view/ViewGroup;)Lb/l/d/w;

    move-result-object p1

    .line 7
    sget v0, Lb/l/b;->special_effects_controller_view_tag:I

    invoke-virtual {p0, v0, p1}, Landroid/view/ViewGroup;->setTag(ILjava/lang/Object;)V

    return-object p1
.end method


# virtual methods
.method public final a(Landroidx/fragment/app/Fragment;)Lb/l/d/w$e;
    .registers 5

    .line 8
    iget-object v0, p0, Lb/l/d/w;->b:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_23

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/l/d/w$e;

    .line 9
    invoke-virtual {v1}, Lb/l/d/w$e;->d()Landroidx/fragment/app/Fragment;

    move-result-object v2

    invoke-virtual {v2, p1}, Landroidx/fragment/app/Fragment;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    invoke-virtual {v1}, Lb/l/d/w$e;->f()Z

    move-result v2

    if-nez v2, :cond_6

    return-object v1

    :cond_23
    const/4 p1, 0x0

    return-object p1
.end method

.method public a()V
    .registers 8

    .line 31
    iget-boolean v0, p0, Lb/l/d/w;->e:Z

    if-eqz v0, :cond_5

    return-void

    .line 32
    :cond_5
    iget-object v0, p0, Lb/l/d/w;->a:Landroid/view/ViewGroup;

    invoke-static {v0}, Lb/h/m/y;->J(Landroid/view/View;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_14

    .line 33
    invoke-virtual {p0}, Lb/l/d/w;->b()V

    .line 34
    iput-boolean v1, p0, Lb/l/d/w;->d:Z

    return-void

    .line 35
    :cond_14
    iget-object v0, p0, Lb/l/d/w;->b:Ljava/util/ArrayList;

    monitor-enter v0

    .line 36
    :try_start_17
    iget-object v2, p0, Lb/l/d/w;->b:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_96

    .line 37
    new-instance v2, Ljava/util/ArrayList;

    iget-object v3, p0, Lb/l/d/w;->c:Ljava/util/ArrayList;

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 38
    iget-object v3, p0, Lb/l/d/w;->c:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->clear()V

    .line 39
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_2f
    :goto_2f
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_67

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lb/l/d/w$e;

    const/4 v4, 0x2

    .line 40
    invoke-static {v4}, Landroidx/fragment/app/FragmentManager;->d(I)Z

    move-result v4

    if-eqz v4, :cond_58

    const-string v4, "FragmentManager"

    .line 41
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "SpecialEffectsController: Cancelling operation "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    :cond_58
    invoke-virtual {v3}, Lb/l/d/w$e;->a()V

    .line 43
    invoke-virtual {v3}, Lb/l/d/w$e;->g()Z

    move-result v4

    if-nez v4, :cond_2f

    .line 44
    iget-object v4, p0, Lb/l/d/w;->c:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2f

    .line 45
    :cond_67
    invoke-virtual {p0}, Lb/l/d/w;->f()V

    .line 46
    new-instance v2, Ljava/util/ArrayList;

    iget-object v3, p0, Lb/l/d/w;->b:Ljava/util/ArrayList;

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 47
    iget-object v3, p0, Lb/l/d/w;->b:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->clear()V

    .line 48
    iget-object v3, p0, Lb/l/d/w;->c:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 49
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_7f
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_8f

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lb/l/d/w$e;

    .line 50
    invoke-virtual {v4}, Lb/l/d/w$e;->h()V

    goto :goto_7f

    .line 51
    :cond_8f
    iget-boolean v3, p0, Lb/l/d/w;->d:Z

    invoke-virtual {p0, v2, v3}, Lb/l/d/w;->a(Ljava/util/List;Z)V

    .line 52
    iput-boolean v1, p0, Lb/l/d/w;->d:Z

    .line 53
    :cond_96
    monitor-exit v0

    return-void

    :catchall_98
    move-exception v1

    monitor-exit v0
    :try_end_9a
    .catchall {:try_start_17 .. :try_end_9a} :catchall_98

    throw v1
.end method

.method public a(Lb/l/d/o;)V
    .registers 4

    const/4 v0, 0x2

    .line 15
    invoke-static {v0}, Landroidx/fragment/app/FragmentManager;->d(I)Z

    move-result v0

    if-eqz v0, :cond_21

    .line 16
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SpecialEffectsController: Enqueuing hide operation for fragment "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    invoke-virtual {p1}, Lb/l/d/o;->k()Landroidx/fragment/app/Fragment;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "FragmentManager"

    .line 18
    invoke-static {v1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 19
    :cond_21
    sget-object v0, Lb/l/d/w$e$c;->GONE:Lb/l/d/w$e$c;

    sget-object v1, Lb/l/d/w$e$b;->NONE:Lb/l/d/w$e$b;

    invoke-virtual {p0, v0, v1, p1}, Lb/l/d/w;->a(Lb/l/d/w$e$c;Lb/l/d/w$e$b;Lb/l/d/o;)V

    return-void
.end method

.method public a(Lb/l/d/w$e$c;Lb/l/d/o;)V
    .registers 5

    const/4 v0, 0x2

    .line 10
    invoke-static {v0}, Landroidx/fragment/app/FragmentManager;->d(I)Z

    move-result v0

    if-eqz v0, :cond_21

    .line 11
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SpecialEffectsController: Enqueuing add operation for fragment "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    invoke-virtual {p2}, Lb/l/d/o;->k()Landroidx/fragment/app/Fragment;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "FragmentManager"

    .line 13
    invoke-static {v1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 14
    :cond_21
    sget-object v0, Lb/l/d/w$e$b;->ADDING:Lb/l/d/w$e$b;

    invoke-virtual {p0, p1, v0, p2}, Lb/l/d/w;->a(Lb/l/d/w$e$c;Lb/l/d/w$e$b;Lb/l/d/o;)V

    return-void
.end method

.method public final a(Lb/l/d/w$e$c;Lb/l/d/w$e$b;Lb/l/d/o;)V
    .registers 7

    .line 20
    iget-object v0, p0, Lb/l/d/w;->b:Ljava/util/ArrayList;

    monitor-enter v0

    .line 21
    :try_start_3
    new-instance v1, Lb/h/i/b;

    invoke-direct {v1}, Lb/h/i/b;-><init>()V

    .line 22
    invoke-virtual {p3}, Lb/l/d/o;->k()Landroidx/fragment/app/Fragment;

    move-result-object v2

    invoke-virtual {p0, v2}, Lb/l/d/w;->a(Landroidx/fragment/app/Fragment;)Lb/l/d/w$e;

    move-result-object v2

    if-eqz v2, :cond_17

    .line 23
    invoke-virtual {v2, p1, p2}, Lb/l/d/w$e;->a(Lb/l/d/w$e$c;Lb/l/d/w$e$b;)V

    .line 24
    monitor-exit v0

    return-void

    .line 25
    :cond_17
    new-instance v2, Lb/l/d/w$d;

    invoke-direct {v2, p1, p2, p3, v1}, Lb/l/d/w$d;-><init>(Lb/l/d/w$e$c;Lb/l/d/w$e$b;Lb/l/d/o;Lb/h/i/b;)V

    .line 26
    iget-object p1, p0, Lb/l/d/w;->b:Ljava/util/ArrayList;

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 27
    new-instance p1, Lb/l/d/w$a;

    invoke-direct {p1, p0, v2}, Lb/l/d/w$a;-><init>(Lb/l/d/w;Lb/l/d/w$d;)V

    invoke-virtual {v2, p1}, Lb/l/d/w$e;->a(Ljava/lang/Runnable;)V

    .line 28
    new-instance p1, Lb/l/d/w$b;

    invoke-direct {p1, p0, v2}, Lb/l/d/w$b;-><init>(Lb/l/d/w;Lb/l/d/w$d;)V

    invoke-virtual {v2, p1}, Lb/l/d/w$e;->a(Ljava/lang/Runnable;)V

    .line 29
    monitor-exit v0

    return-void

    :catchall_33
    move-exception p1

    monitor-exit v0
    :try_end_35
    .catchall {:try_start_3 .. :try_end_35} :catchall_33

    throw p1
.end method

.method public abstract a(Ljava/util/List;Z)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lb/l/d/w$e;",
            ">;Z)V"
        }
    .end annotation
.end method

.method public a(Z)V
    .registers 2

    .line 30
    iput-boolean p1, p0, Lb/l/d/w;->d:Z

    return-void
.end method

.method public final b(Landroidx/fragment/app/Fragment;)Lb/l/d/w$e;
    .registers 5

    .line 1
    iget-object v0, p0, Lb/l/d/w;->c:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_23

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/l/d/w$e;

    .line 2
    invoke-virtual {v1}, Lb/l/d/w$e;->d()Landroidx/fragment/app/Fragment;

    move-result-object v2

    invoke-virtual {v2, p1}, Landroidx/fragment/app/Fragment;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    invoke-virtual {v1}, Lb/l/d/w$e;->f()Z

    move-result v2

    if-nez v2, :cond_6

    return-object v1

    :cond_23
    const/4 p1, 0x0

    return-object p1
.end method

.method public b()V
    .registers 10

    .line 8
    iget-object v0, p0, Lb/l/d/w;->a:Landroid/view/ViewGroup;

    invoke-static {v0}, Lb/h/m/y;->J(Landroid/view/View;)Z

    move-result v0

    .line 9
    iget-object v1, p0, Lb/l/d/w;->b:Ljava/util/ArrayList;

    monitor-enter v1

    .line 10
    :try_start_9
    invoke-virtual {p0}, Lb/l/d/w;->f()V

    .line 11
    iget-object v2, p0, Lb/l/d/w;->b:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_12
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_22

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lb/l/d/w$e;

    .line 12
    invoke-virtual {v3}, Lb/l/d/w$e;->h()V

    goto :goto_12

    .line 13
    :cond_22
    new-instance v2, Ljava/util/ArrayList;

    iget-object v3, p0, Lb/l/d/w;->c:Ljava/util/ArrayList;

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 14
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_2d
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    const/4 v4, 0x2

    if-eqz v3, :cond_7f

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lb/l/d/w$e;

    .line 15
    invoke-static {v4}, Landroidx/fragment/app/FragmentManager;->d(I)Z

    move-result v4

    if-eqz v4, :cond_7b

    const-string v4, "FragmentManager"

    .line 16
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "SpecialEffectsController: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz v0, :cond_51

    const-string v6, ""

    goto :goto_69

    .line 17
    :cond_51
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Container "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v7, p0, Lb/l/d/w;->a:Landroid/view/ViewGroup;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v7, " is not attached to window. "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    :goto_69
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "Cancelling running operation "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 18
    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 19
    :cond_7b
    invoke-virtual {v3}, Lb/l/d/w$e;->a()V

    goto :goto_2d

    .line 20
    :cond_7f
    new-instance v2, Ljava/util/ArrayList;

    iget-object v3, p0, Lb/l/d/w;->b:Ljava/util/ArrayList;

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 21
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_8a
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_db

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lb/l/d/w$e;

    .line 22
    invoke-static {v4}, Landroidx/fragment/app/FragmentManager;->d(I)Z

    move-result v5

    if-eqz v5, :cond_d7

    const-string v5, "FragmentManager"

    .line 23
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "SpecialEffectsController: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz v0, :cond_ad

    const-string v7, ""

    goto :goto_c5

    .line 24
    :cond_ad
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Container "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v8, p0, Lb/l/d/w;->a:Landroid/view/ViewGroup;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v8, " is not attached to window. "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    :goto_c5
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, "Cancelling pending operation "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 25
    invoke-static {v5, v6}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 26
    :cond_d7
    invoke-virtual {v3}, Lb/l/d/w$e;->a()V

    goto :goto_8a

    .line 27
    :cond_db
    monitor-exit v1

    return-void

    :catchall_dd
    move-exception v0

    monitor-exit v1
    :try_end_df
    .catchall {:try_start_9 .. :try_end_df} :catchall_dd

    throw v0
.end method

.method public b(Lb/l/d/o;)V
    .registers 4

    const/4 v0, 0x2

    .line 3
    invoke-static {v0}, Landroidx/fragment/app/FragmentManager;->d(I)Z

    move-result v0

    if-eqz v0, :cond_21

    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SpecialEffectsController: Enqueuing remove operation for fragment "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 5
    invoke-virtual {p1}, Lb/l/d/o;->k()Landroidx/fragment/app/Fragment;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "FragmentManager"

    .line 6
    invoke-static {v1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 7
    :cond_21
    sget-object v0, Lb/l/d/w$e$c;->REMOVED:Lb/l/d/w$e$c;

    sget-object v1, Lb/l/d/w$e$b;->REMOVING:Lb/l/d/w$e$b;

    invoke-virtual {p0, v0, v1, p1}, Lb/l/d/w;->a(Lb/l/d/w$e$c;Lb/l/d/w$e$b;Lb/l/d/o;)V

    return-void
.end method

.method public c()V
    .registers 2

    .line 6
    iget-boolean v0, p0, Lb/l/d/w;->e:Z

    if-eqz v0, :cond_a

    const/4 v0, 0x0

    .line 7
    iput-boolean v0, p0, Lb/l/d/w;->e:Z

    .line 8
    invoke-virtual {p0}, Lb/l/d/w;->a()V

    :cond_a
    return-void
.end method

.method public c(Lb/l/d/o;)V
    .registers 4

    const/4 v0, 0x2

    .line 1
    invoke-static {v0}, Landroidx/fragment/app/FragmentManager;->d(I)Z

    move-result v0

    if-eqz v0, :cond_21

    .line 2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SpecialEffectsController: Enqueuing show operation for fragment "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3
    invoke-virtual {p1}, Lb/l/d/o;->k()Landroidx/fragment/app/Fragment;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "FragmentManager"

    .line 4
    invoke-static {v1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 5
    :cond_21
    sget-object v0, Lb/l/d/w$e$c;->VISIBLE:Lb/l/d/w$e$c;

    sget-object v1, Lb/l/d/w$e$b;->NONE:Lb/l/d/w$e$b;

    invoke-virtual {p0, v0, v1, p1}, Lb/l/d/w;->a(Lb/l/d/w$e$c;Lb/l/d/w$e$b;Lb/l/d/o;)V

    return-void
.end method

.method public d()Landroid/view/ViewGroup;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/l/d/w;->a:Landroid/view/ViewGroup;

    return-object v0
.end method

.method public d(Lb/l/d/o;)Lb/l/d/w$e$b;
    .registers 4

    .line 2
    invoke-virtual {p1}, Lb/l/d/o;->k()Landroidx/fragment/app/Fragment;

    move-result-object v0

    invoke-virtual {p0, v0}, Lb/l/d/w;->a(Landroidx/fragment/app/Fragment;)Lb/l/d/w$e;

    move-result-object v0

    if-eqz v0, :cond_f

    .line 3
    invoke-virtual {v0}, Lb/l/d/w$e;->e()Lb/l/d/w$e$b;

    move-result-object v0

    goto :goto_10

    :cond_f
    const/4 v0, 0x0

    .line 4
    :goto_10
    invoke-virtual {p1}, Lb/l/d/o;->k()Landroidx/fragment/app/Fragment;

    move-result-object p1

    invoke-virtual {p0, p1}, Lb/l/d/w;->b(Landroidx/fragment/app/Fragment;)Lb/l/d/w$e;

    move-result-object p1

    if-eqz p1, :cond_25

    if-eqz v0, :cond_20

    .line 5
    sget-object v1, Lb/l/d/w$e$b;->NONE:Lb/l/d/w$e$b;

    if-ne v0, v1, :cond_25

    .line 6
    :cond_20
    invoke-virtual {p1}, Lb/l/d/w$e;->e()Lb/l/d/w$e$b;

    move-result-object p1

    return-object p1

    :cond_25
    return-object v0
.end method

.method public e()V
    .registers 7

    .line 1
    iget-object v0, p0, Lb/l/d/w;->b:Ljava/util/ArrayList;

    monitor-enter v0

    .line 2
    :try_start_3
    invoke-virtual {p0}, Lb/l/d/w;->f()V

    const/4 v1, 0x0

    .line 3
    iput-boolean v1, p0, Lb/l/d/w;->e:Z

    .line 4
    iget-object v1, p0, Lb/l/d/w;->b:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    :goto_11
    if-ltz v1, :cond_3f

    .line 5
    iget-object v2, p0, Lb/l/d/w;->b:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb/l/d/w$e;

    .line 6
    invoke-virtual {v2}, Lb/l/d/w$e;->d()Landroidx/fragment/app/Fragment;

    move-result-object v3

    iget-object v3, v3, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    invoke-static {v3}, Lb/l/d/w$e$c;->from(Landroid/view/View;)Lb/l/d/w$e$c;

    move-result-object v3

    .line 7
    invoke-virtual {v2}, Lb/l/d/w$e;->c()Lb/l/d/w$e$c;

    move-result-object v4

    sget-object v5, Lb/l/d/w$e$c;->VISIBLE:Lb/l/d/w$e$c;

    if-ne v4, v5, :cond_3c

    sget-object v4, Lb/l/d/w$e$c;->VISIBLE:Lb/l/d/w$e$c;

    if-eq v3, v4, :cond_3c

    .line 8
    invoke-virtual {v2}, Lb/l/d/w$e;->d()Landroidx/fragment/app/Fragment;

    move-result-object v1

    .line 9
    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->U()Z

    move-result v1

    iput-boolean v1, p0, Lb/l/d/w;->e:Z

    goto :goto_3f

    :cond_3c
    add-int/lit8 v1, v1, -0x1

    goto :goto_11

    .line 10
    :cond_3f
    :goto_3f
    monitor-exit v0

    return-void

    :catchall_41
    move-exception v1

    monitor-exit v0
    :try_end_43
    .catchall {:try_start_3 .. :try_end_43} :catchall_41

    throw v1
.end method

.method public final f()V
    .registers 5

    .line 1
    iget-object v0, p0, Lb/l/d/w;->b:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_6
    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_30

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/l/d/w$e;

    .line 2
    invoke-virtual {v1}, Lb/l/d/w$e;->e()Lb/l/d/w$e$b;

    move-result-object v2

    sget-object v3, Lb/l/d/w$e$b;->ADDING:Lb/l/d/w$e$b;

    if-ne v2, v3, :cond_6

    .line 3
    invoke-virtual {v1}, Lb/l/d/w$e;->d()Landroidx/fragment/app/Fragment;

    move-result-object v2

    .line 4
    invoke-virtual {v2}, Landroidx/fragment/app/Fragment;->u0()Landroid/view/View;

    move-result-object v2

    .line 5
    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v2

    invoke-static {v2}, Lb/l/d/w$e$c;->from(I)Lb/l/d/w$e$c;

    move-result-object v2

    .line 6
    sget-object v3, Lb/l/d/w$e$b;->NONE:Lb/l/d/w$e$b;

    invoke-virtual {v1, v2, v3}, Lb/l/d/w$e;->a(Lb/l/d/w$e$c;Lb/l/d/w$e$b;)V

    goto :goto_6

    :cond_30
    return-void
.end method
