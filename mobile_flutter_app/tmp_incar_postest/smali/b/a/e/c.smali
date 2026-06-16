.class public abstract Lb/a/e/c;
.super Ljava/lang/Object;
.source "ActivityResultRegistry.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lb/a/e/c$c;,
        Lb/a/e/c$b;
    }
.end annotation


# instance fields
.field public a:Ljava/util/Random;

.field public final b:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final c:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public final d:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lb/a/e/c$c;",
            ">;"
        }
    .end annotation
.end field

.field public e:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final transient f:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lb/a/e/c$b<",
            "*>;>;"
        }
    .end annotation
.end field

.field public final g:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field public final h:Landroid/os/Bundle;


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    iput-object v0, p0, Lb/a/e/c;->a:Ljava/util/Random;

    .line 3
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lb/a/e/c;->b:Ljava/util/Map;

    .line 4
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lb/a/e/c;->c:Ljava/util/Map;

    .line 5
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lb/a/e/c;->d:Ljava/util/Map;

    .line 6
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lb/a/e/c;->e:Ljava/util/ArrayList;

    .line 7
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lb/a/e/c;->f:Ljava/util/Map;

    .line 8
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lb/a/e/c;->g:Ljava/util/Map;

    .line 9
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    iput-object v0, p0, Lb/a/e/c;->h:Landroid/os/Bundle;

    return-void
.end method


# virtual methods
.method public final a()I
    .registers 6

    .line 39
    iget-object v0, p0, Lb/a/e/c;->a:Ljava/util/Random;

    const/high16 v1, 0x7fff0000

    invoke-virtual {v0, v1}, Ljava/util/Random;->nextInt(I)I

    move-result v0

    const/high16 v2, 0x10000

    :goto_a
    add-int/2addr v0, v2

    .line 40
    iget-object v3, p0, Lb/a/e/c;->b:Ljava/util/Map;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1e

    .line 41
    iget-object v0, p0, Lb/a/e/c;->a:Ljava/util/Random;

    invoke-virtual {v0, v1}, Ljava/util/Random;->nextInt(I)I

    move-result v0

    goto :goto_a

    :cond_1e
    return v0
.end method

.method public final a(Ljava/lang/String;)I
    .registers 3

    .line 35
    iget-object v0, p0, Lb/a/e/c;->c:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    if-eqz v0, :cond_f

    .line 36
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result p1

    return p1

    .line 37
    :cond_f
    invoke-virtual {p0}, Lb/a/e/c;->a()I

    move-result v0

    .line 38
    invoke-virtual {p0, v0, p1}, Lb/a/e/c;->a(ILjava/lang/String;)V

    return v0
.end method

.method public final a(Ljava/lang/String;Lb/a/e/e/a;Lb/a/e/a;)Lb/a/e/b;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<I:",
            "Ljava/lang/Object;",
            "O:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Lb/a/e/e/a<",
            "TI;TO;>;",
            "Lb/a/e/a<",
            "TO;>;)",
            "Lb/a/e/b<",
            "TI;>;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Lb/a/e/c;->a(Ljava/lang/String;)I

    move-result v0

    .line 2
    iget-object v1, p0, Lb/a/e/c;->f:Ljava/util/Map;

    new-instance v2, Lb/a/e/c$b;

    invoke-direct {v2, p3, p2}, Lb/a/e/c$b;-><init>(Lb/a/e/a;Lb/a/e/e/a;)V

    invoke-interface {v1, p1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    iget-object v1, p0, Lb/a/e/c;->g:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_24

    .line 4
    iget-object v1, p0, Lb/a/e/c;->g:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 5
    iget-object v2, p0, Lb/a/e/c;->g:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    invoke-interface {p3, v1}, Lb/a/e/a;->a(Ljava/lang/Object;)V

    .line 7
    :cond_24
    iget-object v1, p0, Lb/a/e/c;->h:Landroid/os/Bundle;

    invoke-virtual {v1, p1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Landroidx/activity/result/ActivityResult;

    if-eqz v1, :cond_42

    .line 8
    iget-object v2, p0, Lb/a/e/c;->h:Landroid/os/Bundle;

    invoke-virtual {v2, p1}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    .line 9
    invoke-virtual {v1}, Landroidx/activity/result/ActivityResult;->f()I

    move-result v2

    .line 10
    invoke-virtual {v1}, Landroidx/activity/result/ActivityResult;->e()Landroid/content/Intent;

    move-result-object v1

    .line 11
    invoke-virtual {p2, v2, v1}, Lb/a/e/e/a;->a(ILandroid/content/Intent;)Ljava/lang/Object;

    move-result-object v1

    invoke-interface {p3, v1}, Lb/a/e/a;->a(Ljava/lang/Object;)V

    .line 12
    :cond_42
    new-instance p3, Lb/a/e/c$a;

    invoke-direct {p3, p0, p1, v0, p2}, Lb/a/e/c$a;-><init>(Lb/a/e/c;Ljava/lang/String;ILb/a/e/e/a;)V

    return-object p3
.end method

.method public final a(ILjava/lang/String;)V
    .registers 5

    .line 42
    iget-object v0, p0, Lb/a/e/c;->b:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    iget-object v0, p0, Lb/a/e/c;->c:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v0, p2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final a(Landroid/os/Bundle;)V
    .registers 7

    if-nez p1, :cond_3

    return-void

    :cond_3
    const-string v0, "KEY_COMPONENT_ACTIVITY_REGISTERED_RCS"

    .line 13
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getIntegerArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    const-string v1, "KEY_COMPONENT_ACTIVITY_REGISTERED_KEYS"

    .line 14
    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    if-eqz v1, :cond_71

    if-nez v0, :cond_14

    goto :goto_71

    :cond_14
    const-string v2, "KEY_COMPONENT_ACTIVITY_LAUNCHED_KEYS"

    .line 15
    invoke-virtual {p1, v2}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v2

    iput-object v2, p0, Lb/a/e/c;->e:Ljava/util/ArrayList;

    const-string v2, "KEY_COMPONENT_ACTIVITY_RANDOM_OBJECT"

    .line 16
    invoke-virtual {p1, v2}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v2

    check-cast v2, Ljava/util/Random;

    iput-object v2, p0, Lb/a/e/c;->a:Ljava/util/Random;

    .line 17
    iget-object v2, p0, Lb/a/e/c;->h:Landroid/os/Bundle;

    const-string v3, "KEY_COMPONENT_ACTIVITY_PENDING_RESULT"

    .line 18
    invoke-virtual {p1, v3}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object p1

    .line 19
    invoke-virtual {v2, p1}, Landroid/os/Bundle;->putAll(Landroid/os/Bundle;)V

    const/4 p1, 0x0

    .line 20
    :goto_32
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge p1, v2, :cond_71

    .line 21
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 22
    iget-object v3, p0, Lb/a/e/c;->c:Ljava/util/Map;

    invoke-interface {v3, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5b

    .line 23
    iget-object v3, p0, Lb/a/e/c;->c:Ljava/util/Map;

    invoke-interface {v3, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    .line 24
    iget-object v4, p0, Lb/a/e/c;->h:Landroid/os/Bundle;

    invoke-virtual {v4, v2}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_5b

    .line 25
    iget-object v2, p0, Lb/a/e/c;->b:Ljava/util/Map;

    invoke-interface {v2, v3}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    :cond_5b
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {p0, v2, v3}, Lb/a/e/c;->a(ILjava/lang/String;)V

    add-int/lit8 p1, p1, 0x1

    goto :goto_32

    :cond_71
    :goto_71
    return-void
.end method

.method public final a(Ljava/lang/String;ILandroid/content/Intent;Lb/a/e/c$b;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<O:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "I",
            "Landroid/content/Intent;",
            "Lb/a/e/c$b<",
            "TO;>;)V"
        }
    .end annotation

    if-eqz p4, :cond_10

    .line 30
    iget-object v0, p4, Lb/a/e/c$b;->a:Lb/a/e/a;

    if-eqz v0, :cond_10

    .line 31
    iget-object p1, p4, Lb/a/e/c$b;->b:Lb/a/e/e/a;

    .line 32
    invoke-virtual {p1, p2, p3}, Lb/a/e/e/a;->a(ILandroid/content/Intent;)Ljava/lang/Object;

    move-result-object p1

    invoke-interface {v0, p1}, Lb/a/e/a;->a(Ljava/lang/Object;)V

    goto :goto_1f

    .line 33
    :cond_10
    iget-object p4, p0, Lb/a/e/c;->g:Ljava/util/Map;

    invoke-interface {p4, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    iget-object p4, p0, Lb/a/e/c;->h:Landroid/os/Bundle;

    new-instance v0, Landroidx/activity/result/ActivityResult;

    invoke-direct {v0, p2, p3}, Landroidx/activity/result/ActivityResult;-><init>(ILandroid/content/Intent;)V

    invoke-virtual {p4, p1, v0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    :goto_1f
    return-void
.end method

.method public final a(IILandroid/content/Intent;)Z
    .registers 5

    .line 27
    iget-object v0, p0, Lb/a/e/c;->b:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    if-nez p1, :cond_10

    const/4 p1, 0x0

    return p1

    .line 28
    :cond_10
    iget-object v0, p0, Lb/a/e/c;->e:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 29
    iget-object v0, p0, Lb/a/e/c;->f:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb/a/e/c$b;

    invoke-virtual {p0, p1, p2, p3, v0}, Lb/a/e/c;->a(Ljava/lang/String;ILandroid/content/Intent;Lb/a/e/c$b;)V

    const/4 p1, 0x1

    return p1
.end method

.method public final b(Landroid/os/Bundle;)V
    .registers 4

    .line 18
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lb/a/e/c;->c:Ljava/util/Map;

    .line 19
    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    const-string v1, "KEY_COMPONENT_ACTIVITY_REGISTERED_RCS"

    .line 20
    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putIntegerArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 21
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lb/a/e/c;->c:Ljava/util/Map;

    .line 22
    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    const-string v1, "KEY_COMPONENT_ACTIVITY_REGISTERED_KEYS"

    .line 23
    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 24
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lb/a/e/c;->e:Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    const-string v1, "KEY_COMPONENT_ACTIVITY_LAUNCHED_KEYS"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 25
    iget-object v0, p0, Lb/a/e/c;->h:Landroid/os/Bundle;

    .line 26
    invoke-virtual {v0}, Landroid/os/Bundle;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Bundle;

    const-string v1, "KEY_COMPONENT_ACTIVITY_PENDING_RESULT"

    .line 27
    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 28
    iget-object v0, p0, Lb/a/e/c;->a:Ljava/util/Random;

    const-string v1, "KEY_COMPONENT_ACTIVITY_RANDOM_OBJECT"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    return-void
.end method

.method public final b(Ljava/lang/String;)V
    .registers 7

    .line 1
    iget-object v0, p0, Lb/a/e/c;->e:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_17

    .line 2
    iget-object v0, p0, Lb/a/e/c;->c:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    if-eqz v0, :cond_17

    .line 3
    iget-object v1, p0, Lb/a/e/c;->b:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    :cond_17
    iget-object v0, p0, Lb/a/e/c;->f:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 5
    iget-object v0, p0, Lb/a/e/c;->g:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    const-string v1, ": "

    const-string v2, "Dropping pending result for request "

    const-string v3, "ActivityResultRegistry"

    if-eqz v0, :cond_4d

    .line 6
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Lb/a/e/c;->g:Ljava/util/Map;

    .line 7
    invoke-interface {v4, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 8
    invoke-static {v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 9
    iget-object v0, p0, Lb/a/e/c;->g:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    :cond_4d
    iget-object v0, p0, Lb/a/e/c;->h:Landroid/os/Bundle;

    invoke-virtual {v0, p1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_78

    .line 11
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lb/a/e/c;->h:Landroid/os/Bundle;

    .line 12
    invoke-virtual {v1, p1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 13
    invoke-static {v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 14
    iget-object v0, p0, Lb/a/e/c;->h:Landroid/os/Bundle;

    invoke-virtual {v0, p1}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    .line 15
    :cond_78
    iget-object v0, p0, Lb/a/e/c;->d:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb/a/e/c$c;

    if-eqz v0, :cond_8a

    .line 16
    invoke-virtual {v0}, Lb/a/e/c$c;->a()V

    .line 17
    iget-object v0, p0, Lb/a/e/c;->d:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_8a
    return-void
.end method
