.class public Lb/l/d/w$e;
.super Ljava/lang/Object;
.source "SpecialEffectsController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/l/d/w;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "e"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lb/l/d/w$e$b;,
        Lb/l/d/w$e$c;
    }
.end annotation


# instance fields
.field public a:Lb/l/d/w$e$c;

.field public b:Lb/l/d/w$e$b;

.field public final c:Landroidx/fragment/app/Fragment;

.field public final d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field public final e:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Lb/h/i/b;",
            ">;"
        }
    .end annotation
.end field

.field public f:Z

.field public g:Z


# direct methods
.method public constructor <init>(Lb/l/d/w$e$c;Lb/l/d/w$e$b;Landroidx/fragment/app/Fragment;Lb/h/i/b;)V
    .registers 6

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lb/l/d/w$e;->d:Ljava/util/List;

    .line 3
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lb/l/d/w$e;->e:Ljava/util/HashSet;

    const/4 v0, 0x0

    .line 4
    iput-boolean v0, p0, Lb/l/d/w$e;->f:Z

    .line 5
    iput-boolean v0, p0, Lb/l/d/w$e;->g:Z

    .line 6
    iput-object p1, p0, Lb/l/d/w$e;->a:Lb/l/d/w$e$c;

    .line 7
    iput-object p2, p0, Lb/l/d/w$e;->b:Lb/l/d/w$e$b;

    .line 8
    iput-object p3, p0, Lb/l/d/w$e;->c:Landroidx/fragment/app/Fragment;

    .line 9
    new-instance p1, Lb/l/d/w$e$a;

    invoke-direct {p1, p0}, Lb/l/d/w$e$a;-><init>(Lb/l/d/w$e;)V

    invoke-virtual {p4, p1}, Lb/h/i/b;->a(Lb/h/i/b$a;)V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 3

    .line 1
    invoke-virtual {p0}, Lb/l/d/w$e;->f()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lb/l/d/w$e;->f:Z

    .line 3
    iget-object v0, p0, Lb/l/d/w$e;->e:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_16

    .line 4
    invoke-virtual {p0}, Lb/l/d/w$e;->b()V

    goto :goto_31

    .line 5
    :cond_16
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lb/l/d/w$e;->e:Ljava/util/HashSet;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 6
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_21
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_31

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/h/i/b;

    .line 7
    invoke-virtual {v1}, Lb/h/i/b;->a()V

    goto :goto_21

    :cond_31
    :goto_31
    return-void
.end method

.method public final a(Lb/h/i/b;)V
    .registers 3

    .line 23
    iget-object v0, p0, Lb/l/d/w$e;->e:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_13

    iget-object p1, p0, Lb/l/d/w$e;->e:Ljava/util/HashSet;

    invoke-virtual {p1}, Ljava/util/HashSet;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_13

    .line 24
    invoke-virtual {p0}, Lb/l/d/w$e;->b()V

    :cond_13
    return-void
.end method

.method public final a(Lb/l/d/w$e$c;Lb/l/d/w$e$b;)V
    .registers 8

    .line 8
    sget-object v0, Lb/l/d/w$c;->b:[I

    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    move-result p2

    aget p2, v0, p2

    const/4 v0, 0x1

    const-string v1, "SpecialEffectsController: For fragment "

    const-string v2, "FragmentManager"

    const/4 v3, 0x2

    if-eq p2, v0, :cond_8b

    const-string v0, " mFinalState = "

    if-eq p2, v3, :cond_51

    const/4 v4, 0x3

    if-eq p2, v4, :cond_19

    goto/16 :goto_c2

    .line 9
    :cond_19
    iget-object p2, p0, Lb/l/d/w$e;->a:Lb/l/d/w$e$c;

    sget-object v4, Lb/l/d/w$e$c;->REMOVED:Lb/l/d/w$e$c;

    if-eq p2, v4, :cond_c2

    .line 10
    invoke-static {v3}, Landroidx/fragment/app/FragmentManager;->d(I)Z

    move-result p2

    if-eqz p2, :cond_4e

    .line 11
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lb/l/d/w$e;->c:Landroidx/fragment/app/Fragment;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lb/l/d/w$e;->a:Lb/l/d/w$e$c;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, " -> "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ". "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v2, p2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    :cond_4e
    iput-object p1, p0, Lb/l/d/w$e;->a:Lb/l/d/w$e$c;

    goto :goto_c2

    .line 13
    :cond_51
    invoke-static {v3}, Landroidx/fragment/app/FragmentManager;->d(I)Z

    move-result p1

    if-eqz p1, :cond_82

    .line 14
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p2, p0, Lb/l/d/w$e;->c:Landroidx/fragment/app/Fragment;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p2, p0, Lb/l/d/w$e;->a:Lb/l/d/w$e$c;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p2, " -> REMOVED. mLifecycleImpact  = "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p2, p0, Lb/l/d/w$e;->b:Lb/l/d/w$e$b;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p2, " to REMOVING."

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 15
    :cond_82
    sget-object p1, Lb/l/d/w$e$c;->REMOVED:Lb/l/d/w$e$c;

    iput-object p1, p0, Lb/l/d/w$e;->a:Lb/l/d/w$e$c;

    .line 16
    sget-object p1, Lb/l/d/w$e$b;->REMOVING:Lb/l/d/w$e$b;

    iput-object p1, p0, Lb/l/d/w$e;->b:Lb/l/d/w$e$b;

    goto :goto_c2

    .line 17
    :cond_8b
    iget-object p1, p0, Lb/l/d/w$e;->a:Lb/l/d/w$e$c;

    sget-object p2, Lb/l/d/w$e$c;->REMOVED:Lb/l/d/w$e$c;

    if-ne p1, p2, :cond_c2

    .line 18
    invoke-static {v3}, Landroidx/fragment/app/FragmentManager;->d(I)Z

    move-result p1

    if-eqz p1, :cond_ba

    .line 19
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p2, p0, Lb/l/d/w$e;->c:Landroidx/fragment/app/Fragment;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p2, " mFinalState = REMOVED -> VISIBLE. mLifecycleImpact = "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p2, p0, Lb/l/d/w$e;->b:Lb/l/d/w$e$b;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p2, " to ADDING."

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 20
    :cond_ba
    sget-object p1, Lb/l/d/w$e$c;->VISIBLE:Lb/l/d/w$e$c;

    iput-object p1, p0, Lb/l/d/w$e;->a:Lb/l/d/w$e$c;

    .line 21
    sget-object p1, Lb/l/d/w$e$b;->ADDING:Lb/l/d/w$e$b;

    iput-object p1, p0, Lb/l/d/w$e;->b:Lb/l/d/w$e$b;

    :cond_c2
    :goto_c2
    return-void
.end method

.method public final a(Ljava/lang/Runnable;)V
    .registers 3

    .line 22
    iget-object v0, p0, Lb/l/d/w$e;->d:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public b()V
    .registers 3

    .line 3
    iget-boolean v0, p0, Lb/l/d/w$e;->g:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x2

    .line 4
    invoke-static {v0}, Landroidx/fragment/app/FragmentManager;->d(I)Z

    move-result v0

    if-eqz v0, :cond_27

    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SpecialEffectsController: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " has called complete."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "FragmentManager"

    invoke-static {v1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_27
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Lb/l/d/w$e;->g:Z

    .line 7
    iget-object v0, p0, Lb/l/d/w$e;->d:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_30
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_40

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Runnable;

    .line 8
    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    goto :goto_30

    :cond_40
    return-void
.end method

.method public final b(Lb/h/i/b;)V
    .registers 3

    .line 1
    invoke-virtual {p0}, Lb/l/d/w$e;->h()V

    .line 2
    iget-object v0, p0, Lb/l/d/w$e;->e:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public c()Lb/l/d/w$e$c;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/l/d/w$e;->a:Lb/l/d/w$e$c;

    return-object v0
.end method

.method public final d()Landroidx/fragment/app/Fragment;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/l/d/w$e;->c:Landroidx/fragment/app/Fragment;

    return-object v0
.end method

.method public e()Lb/l/d/w$e$b;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/l/d/w$e;->b:Lb/l/d/w$e$b;

    return-object v0
.end method

.method public final f()Z
    .registers 2

    .line 1
    iget-boolean v0, p0, Lb/l/d/w$e;->f:Z

    return v0
.end method

.method public final g()Z
    .registers 2

    .line 1
    iget-boolean v0, p0, Lb/l/d/w$e;->g:Z

    return v0
.end method

.method public h()V
    .registers 1

    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Operation "

    .line 2
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "{"

    .line 3
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "} "

    .line 5
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 6
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "mFinalState = "

    .line 7
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 8
    iget-object v3, p0, Lb/l/d/w$e;->a:Lb/l/d/w$e$c;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 9
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "mLifecycleImpact = "

    .line 11
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    iget-object v3, p0, Lb/l/d/w$e;->b:Lb/l/d/w$e$b;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 13
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "mFragment = "

    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    iget-object v1, p0, Lb/l/d/w$e;->c:Landroidx/fragment/app/Fragment;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "}"

    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
