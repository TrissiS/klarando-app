.class public Lb/n/i;
.super Lb/n/e;
.source "LifecycleRegistry.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lb/n/i$a;
    }
.end annotation


# instance fields
.field public a:Lb/c/a/b/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lb/c/a/b/a<",
            "Lb/n/g;",
            "Lb/n/i$a;",
            ">;"
        }
    .end annotation
.end field

.field public b:Lb/n/e$c;

.field public final c:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lb/n/h;",
            ">;"
        }
    .end annotation
.end field

.field public d:I

.field public e:Z

.field public f:Z

.field public g:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lb/n/e$c;",
            ">;"
        }
    .end annotation
.end field

.field public final h:Z


# direct methods
.method public constructor <init>(Lb/n/h;)V
    .registers 3

    const/4 v0, 0x1

    .line 1
    invoke-direct {p0, p1, v0}, Lb/n/i;-><init>(Lb/n/h;Z)V

    return-void
.end method

.method public constructor <init>(Lb/n/h;Z)V
    .registers 4

    .line 2
    invoke-direct {p0}, Lb/n/e;-><init>()V

    .line 3
    new-instance v0, Lb/c/a/b/a;

    invoke-direct {v0}, Lb/c/a/b/a;-><init>()V

    iput-object v0, p0, Lb/n/i;->a:Lb/c/a/b/a;

    const/4 v0, 0x0

    .line 4
    iput v0, p0, Lb/n/i;->d:I

    .line 5
    iput-boolean v0, p0, Lb/n/i;->e:Z

    .line 6
    iput-boolean v0, p0, Lb/n/i;->f:Z

    .line 7
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lb/n/i;->g:Ljava/util/ArrayList;

    .line 8
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lb/n/i;->c:Ljava/lang/ref/WeakReference;

    .line 9
    sget-object p1, Lb/n/e$c;->INITIALIZED:Lb/n/e$c;

    iput-object p1, p0, Lb/n/i;->b:Lb/n/e$c;

    .line 10
    iput-boolean p2, p0, Lb/n/i;->h:Z

    return-void
.end method

.method public static a(Lb/n/e$c;Lb/n/e$c;)Lb/n/e$c;
    .registers 3

    if-eqz p1, :cond_9

    .line 39
    invoke-virtual {p1, p0}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    move-result v0

    if-gez v0, :cond_9

    move-object p0, p1

    :cond_9
    return-object p0
.end method


# virtual methods
.method public a()Lb/n/e$c;
    .registers 2

    .line 23
    iget-object v0, p0, Lb/n/i;->b:Lb/n/e$c;

    return-object v0
.end method

.method public a(Lb/n/e$b;)V
    .registers 3

    const-string v0, "handleLifecycleEvent"

    .line 3
    invoke-virtual {p0, v0}, Lb/n/i;->a(Ljava/lang/String;)V

    .line 4
    invoke-virtual {p1}, Lb/n/e$b;->getTargetState()Lb/n/e$c;

    move-result-object p1

    invoke-virtual {p0, p1}, Lb/n/i;->b(Lb/n/e$c;)V

    return-void
.end method

.method public a(Lb/n/e$c;)V
    .registers 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const-string v0, "markState"

    .line 1
    invoke-virtual {p0, v0}, Lb/n/i;->a(Ljava/lang/String;)V

    .line 2
    invoke-virtual {p0, p1}, Lb/n/i;->d(Lb/n/e$c;)V

    return-void
.end method

.method public a(Lb/n/g;)V
    .registers 8

    const-string v0, "addObserver"

    .line 5
    invoke-virtual {p0, v0}, Lb/n/i;->a(Ljava/lang/String;)V

    .line 6
    iget-object v0, p0, Lb/n/i;->b:Lb/n/e$c;

    sget-object v1, Lb/n/e$c;->DESTROYED:Lb/n/e$c;

    if-ne v0, v1, :cond_c

    goto :goto_e

    :cond_c
    sget-object v1, Lb/n/e$c;->INITIALIZED:Lb/n/e$c;

    .line 7
    :goto_e
    new-instance v0, Lb/n/i$a;

    invoke-direct {v0, p1, v1}, Lb/n/i$a;-><init>(Lb/n/g;Lb/n/e$c;)V

    .line 8
    iget-object v1, p0, Lb/n/i;->a:Lb/c/a/b/a;

    invoke-virtual {v1, p1, v0}, Lb/c/a/b/a;->b(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/n/i$a;

    if-eqz v1, :cond_1e

    return-void

    .line 9
    :cond_1e
    iget-object v1, p0, Lb/n/i;->c:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/n/h;

    if-nez v1, :cond_29

    return-void

    .line 10
    :cond_29
    iget v2, p0, Lb/n/i;->d:I

    const/4 v3, 0x1

    if-nez v2, :cond_35

    iget-boolean v2, p0, Lb/n/i;->e:Z

    if-eqz v2, :cond_33

    goto :goto_35

    :cond_33
    const/4 v2, 0x0

    goto :goto_36

    :cond_35
    :goto_35
    const/4 v2, 0x1

    .line 11
    :goto_36
    invoke-virtual {p0, p1}, Lb/n/i;->c(Lb/n/g;)Lb/n/e$c;

    move-result-object v4

    .line 12
    iget v5, p0, Lb/n/i;->d:I

    add-int/2addr v5, v3

    iput v5, p0, Lb/n/i;->d:I

    .line 13
    :goto_3f
    iget-object v5, v0, Lb/n/i$a;->a:Lb/n/e$c;

    invoke-virtual {v5, v4}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    move-result v4

    if-gez v4, :cond_80

    iget-object v4, p0, Lb/n/i;->a:Lb/c/a/b/a;

    .line 14
    invoke-virtual {v4, p1}, Lb/c/a/b/a;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_80

    .line 15
    iget-object v4, v0, Lb/n/i$a;->a:Lb/n/e$c;

    invoke-virtual {p0, v4}, Lb/n/i;->c(Lb/n/e$c;)V

    .line 16
    iget-object v4, v0, Lb/n/i$a;->a:Lb/n/e$c;

    invoke-static {v4}, Lb/n/e$b;->upFrom(Lb/n/e$c;)Lb/n/e$b;

    move-result-object v4

    if-eqz v4, :cond_67

    .line 17
    invoke-virtual {v0, v1, v4}, Lb/n/i$a;->a(Lb/n/h;Lb/n/e$b;)V

    .line 18
    invoke-virtual {p0}, Lb/n/i;->c()V

    .line 19
    invoke-virtual {p0, p1}, Lb/n/i;->c(Lb/n/g;)Lb/n/e$c;

    move-result-object v4

    goto :goto_3f

    .line 20
    :cond_67
    new-instance p1, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "no event up from "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, v0, Lb/n/i$a;->a:Lb/n/e$c;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_80
    if-nez v2, :cond_85

    .line 21
    invoke-virtual {p0}, Lb/n/i;->d()V

    .line 22
    :cond_85
    iget p1, p0, Lb/n/i;->d:I

    sub-int/2addr p1, v3

    iput p1, p0, Lb/n/i;->d:I

    return-void
.end method

.method public final a(Lb/n/h;)V
    .registers 7

    .line 24
    iget-object v0, p0, Lb/n/i;->a:Lb/c/a/b/a;

    .line 25
    invoke-virtual {v0}, Lb/c/a/b/b;->a()Ljava/util/Iterator;

    move-result-object v0

    .line 26
    :cond_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_65

    iget-boolean v1, p0, Lb/n/i;->f:Z

    if-nez v1, :cond_65

    .line 27
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 28
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb/n/i$a;

    .line 29
    :goto_1c
    iget-object v3, v2, Lb/n/i$a;->a:Lb/n/e$c;

    iget-object v4, p0, Lb/n/i;->b:Lb/n/e$c;

    invoke-virtual {v3, v4}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    move-result v3

    if-lez v3, :cond_6

    iget-boolean v3, p0, Lb/n/i;->f:Z

    if-nez v3, :cond_6

    iget-object v3, p0, Lb/n/i;->a:Lb/c/a/b/a;

    .line 30
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Lb/c/a/b/a;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 31
    iget-object v3, v2, Lb/n/i$a;->a:Lb/n/e$c;

    invoke-static {v3}, Lb/n/e$b;->downFrom(Lb/n/e$c;)Lb/n/e$b;

    move-result-object v3

    if-eqz v3, :cond_4c

    .line 32
    invoke-virtual {v3}, Lb/n/e$b;->getTargetState()Lb/n/e$c;

    move-result-object v4

    invoke-virtual {p0, v4}, Lb/n/i;->c(Lb/n/e$c;)V

    .line 33
    invoke-virtual {v2, p1, v3}, Lb/n/i$a;->a(Lb/n/h;Lb/n/e$b;)V

    .line 34
    invoke-virtual {p0}, Lb/n/i;->c()V

    goto :goto_1c

    .line 35
    :cond_4c
    new-instance p1, Ljava/lang/IllegalStateException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "no event down from "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, v2, Lb/n/i$a;->a:Lb/n/e$c;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_65
    return-void
.end method

.method public final a(Ljava/lang/String;)V
    .registers 5
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "RestrictedApi"
        }
    .end annotation

    .line 36
    iget-boolean v0, p0, Lb/n/i;->h:Z

    if-eqz v0, :cond_2b

    .line 37
    invoke-static {}, Lb/c/a/a/a;->b()Lb/c/a/a/a;

    move-result-object v0

    invoke-virtual {v0}, Lb/c/a/a/a;->a()Z

    move-result v0

    if-eqz v0, :cond_f

    goto :goto_2b

    .line 38
    :cond_f
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Method "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " must be called on the main thread"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2b
    :goto_2b
    return-void
.end method

.method public final b(Lb/n/e$c;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/n/i;->b:Lb/n/e$c;

    if-ne v0, p1, :cond_5

    return-void

    .line 2
    :cond_5
    iput-object p1, p0, Lb/n/i;->b:Lb/n/e$c;

    .line 3
    iget-boolean p1, p0, Lb/n/i;->e:Z

    const/4 v0, 0x1

    if-nez p1, :cond_1a

    iget p1, p0, Lb/n/i;->d:I

    if-eqz p1, :cond_11

    goto :goto_1a

    .line 4
    :cond_11
    iput-boolean v0, p0, Lb/n/i;->e:Z

    .line 5
    invoke-virtual {p0}, Lb/n/i;->d()V

    const/4 p1, 0x0

    .line 6
    iput-boolean p1, p0, Lb/n/i;->e:Z

    return-void

    .line 7
    :cond_1a
    :goto_1a
    iput-boolean v0, p0, Lb/n/i;->f:Z

    return-void
.end method

.method public b(Lb/n/g;)V
    .registers 3

    const-string v0, "removeObserver"

    .line 12
    invoke-virtual {p0, v0}, Lb/n/i;->a(Ljava/lang/String;)V

    .line 13
    iget-object v0, p0, Lb/n/i;->a:Lb/c/a/b/a;

    invoke-virtual {v0, p1}, Lb/c/a/b/a;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final b(Lb/n/h;)V
    .registers 7

    .line 14
    iget-object v0, p0, Lb/n/i;->a:Lb/c/a/b/a;

    .line 15
    invoke-virtual {v0}, Lb/c/a/b/b;->c()Lb/c/a/b/b$d;

    move-result-object v0

    .line 16
    :cond_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_63

    iget-boolean v1, p0, Lb/n/i;->f:Z

    if-nez v1, :cond_63

    .line 17
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 18
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb/n/i$a;

    .line 19
    :goto_1c
    iget-object v3, v2, Lb/n/i$a;->a:Lb/n/e$c;

    iget-object v4, p0, Lb/n/i;->b:Lb/n/e$c;

    invoke-virtual {v3, v4}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    move-result v3

    if-gez v3, :cond_6

    iget-boolean v3, p0, Lb/n/i;->f:Z

    if-nez v3, :cond_6

    iget-object v3, p0, Lb/n/i;->a:Lb/c/a/b/a;

    .line 20
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Lb/c/a/b/a;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 21
    iget-object v3, v2, Lb/n/i$a;->a:Lb/n/e$c;

    invoke-virtual {p0, v3}, Lb/n/i;->c(Lb/n/e$c;)V

    .line 22
    iget-object v3, v2, Lb/n/i$a;->a:Lb/n/e$c;

    invoke-static {v3}, Lb/n/e$b;->upFrom(Lb/n/e$c;)Lb/n/e$b;

    move-result-object v3

    if-eqz v3, :cond_4a

    .line 23
    invoke-virtual {v2, p1, v3}, Lb/n/i$a;->a(Lb/n/h;Lb/n/e$b;)V

    .line 24
    invoke-virtual {p0}, Lb/n/i;->c()V

    goto :goto_1c

    .line 25
    :cond_4a
    new-instance p1, Ljava/lang/IllegalStateException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "no event up from "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, v2, Lb/n/i$a;->a:Lb/n/e$c;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_63
    return-void
.end method

.method public final b()Z
    .registers 4

    .line 8
    iget-object v0, p0, Lb/n/i;->a:Lb/c/a/b/a;

    invoke-virtual {v0}, Lb/c/a/b/b;->size()I

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_a

    return v1

    .line 9
    :cond_a
    iget-object v0, p0, Lb/n/i;->a:Lb/c/a/b/a;

    invoke-virtual {v0}, Lb/c/a/b/b;->b()Ljava/util/Map$Entry;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb/n/i$a;

    iget-object v0, v0, Lb/n/i$a;->a:Lb/n/e$c;

    .line 10
    iget-object v2, p0, Lb/n/i;->a:Lb/c/a/b/a;

    invoke-virtual {v2}, Lb/c/a/b/b;->d()Ljava/util/Map$Entry;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb/n/i$a;

    iget-object v2, v2, Lb/n/i$a;->a:Lb/n/e$c;

    if-ne v0, v2, :cond_2d

    .line 11
    iget-object v0, p0, Lb/n/i;->b:Lb/n/e$c;

    if-ne v0, v2, :cond_2d

    goto :goto_2e

    :cond_2d
    const/4 v1, 0x0

    :goto_2e
    return v1
.end method

.method public final c(Lb/n/g;)Lb/n/e$c;
    .registers 4

    .line 1
    iget-object v0, p0, Lb/n/i;->a:Lb/c/a/b/a;

    invoke-virtual {v0, p1}, Lb/c/a/b/a;->b(Ljava/lang/Object;)Ljava/util/Map$Entry;

    move-result-object p1

    const/4 v0, 0x0

    if-eqz p1, :cond_12

    .line 2
    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lb/n/i$a;

    iget-object p1, p1, Lb/n/i$a;->a:Lb/n/e$c;

    goto :goto_13

    :cond_12
    move-object p1, v0

    .line 3
    :goto_13
    iget-object v1, p0, Lb/n/i;->g:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_29

    iget-object v0, p0, Lb/n/i;->g:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb/n/e$c;

    .line 4
    :cond_29
    iget-object v1, p0, Lb/n/i;->b:Lb/n/e$c;

    invoke-static {v1, p1}, Lb/n/i;->a(Lb/n/e$c;Lb/n/e$c;)Lb/n/e$c;

    move-result-object p1

    invoke-static {p1, v0}, Lb/n/i;->a(Lb/n/e$c;Lb/n/e$c;)Lb/n/e$c;

    move-result-object p1

    return-object p1
.end method

.method public final c()V
    .registers 3

    .line 5
    iget-object v0, p0, Lb/n/i;->g:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    return-void
.end method

.method public final c(Lb/n/e$c;)V
    .registers 3

    .line 6
    iget-object v0, p0, Lb/n/i;->g:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final d()V
    .registers 4

    .line 3
    iget-object v0, p0, Lb/n/i;->c:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb/n/h;

    if-eqz v0, :cond_4f

    .line 4
    :cond_a
    :goto_a
    invoke-virtual {p0}, Lb/n/i;->b()Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_4c

    .line 5
    iput-boolean v2, p0, Lb/n/i;->f:Z

    .line 6
    iget-object v1, p0, Lb/n/i;->b:Lb/n/e$c;

    iget-object v2, p0, Lb/n/i;->a:Lb/c/a/b/a;

    invoke-virtual {v2}, Lb/c/a/b/b;->b()Ljava/util/Map$Entry;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb/n/i$a;

    iget-object v2, v2, Lb/n/i$a;->a:Lb/n/e$c;

    invoke-virtual {v1, v2}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    move-result v1

    if-gez v1, :cond_2c

    .line 7
    invoke-virtual {p0, v0}, Lb/n/i;->a(Lb/n/h;)V

    .line 8
    :cond_2c
    iget-object v1, p0, Lb/n/i;->a:Lb/c/a/b/a;

    invoke-virtual {v1}, Lb/c/a/b/b;->d()Ljava/util/Map$Entry;

    move-result-object v1

    .line 9
    iget-boolean v2, p0, Lb/n/i;->f:Z

    if-nez v2, :cond_a

    if-eqz v1, :cond_a

    iget-object v2, p0, Lb/n/i;->b:Lb/n/e$c;

    .line 10
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/n/i$a;

    iget-object v1, v1, Lb/n/i$a;->a:Lb/n/e$c;

    invoke-virtual {v2, v1}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    move-result v1

    if-lez v1, :cond_a

    .line 11
    invoke-virtual {p0, v0}, Lb/n/i;->b(Lb/n/h;)V

    goto :goto_a

    .line 12
    :cond_4c
    iput-boolean v2, p0, Lb/n/i;->f:Z

    return-void

    .line 13
    :cond_4f
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "LifecycleOwner of this LifecycleRegistry is alreadygarbage collected. It is too late to change lifecycle state."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public d(Lb/n/e$c;)V
    .registers 3

    const-string v0, "setCurrentState"

    .line 1
    invoke-virtual {p0, v0}, Lb/n/i;->a(Ljava/lang/String;)V

    .line 2
    invoke-virtual {p0, p1}, Lb/n/i;->b(Lb/n/e$c;)V

    return-void
.end method
