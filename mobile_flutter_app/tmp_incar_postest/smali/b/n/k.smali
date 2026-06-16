.class public Lb/n/k;
.super Ljava/lang/Object;
.source "Lifecycling.java"


# static fields
.field public static a:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static b:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/util/List<",
            "Ljava/lang/reflect/Constructor<",
            "+",
            "Lb/n/c;",
            ">;>;>;"
        }
    .end annotation
.end field


# direct methods
.method public static constructor <clinit>()V
    .registers 1

    .line 1
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lb/n/k;->a:Ljava/util/Map;

    .line 2
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lb/n/k;->b:Ljava/util/Map;

    return-void
.end method

.method public static a(Ljava/lang/reflect/Constructor;Ljava/lang/Object;)Lb/n/c;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Constructor<",
            "+",
            "Lb/n/c;",
            ">;",
            "Ljava/lang/Object;",
            ")",
            "Lb/n/c;"
        }
    .end annotation

    const/4 v0, 0x1

    :try_start_1
    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    .line 19
    invoke-virtual {p0, v0}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lb/n/c;
    :try_end_c
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_c} :catch_1b
    .catch Ljava/lang/InstantiationException; {:try_start_1 .. :try_end_c} :catch_14
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_1 .. :try_end_c} :catch_d

    return-object p0

    :catch_d
    move-exception p0

    .line 20
    new-instance p1, Ljava/lang/RuntimeException;

    invoke-direct {p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw p1

    :catch_14
    move-exception p0

    .line 21
    new-instance p1, Ljava/lang/RuntimeException;

    invoke-direct {p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw p1

    :catch_1b
    move-exception p0

    .line 22
    new-instance p1, Ljava/lang/RuntimeException;

    invoke-direct {p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw p1
.end method

.method public static a(Ljava/lang/Object;)Lb/n/f;
    .registers 5

    .line 1
    instance-of v0, p0, Lb/n/f;

    .line 2
    instance-of v1, p0, Lb/n/b;

    if-eqz v0, :cond_13

    if-eqz v1, :cond_13

    .line 3
    new-instance v0, Landroidx/lifecycle/FullLifecycleObserverAdapter;

    move-object v1, p0

    check-cast v1, Lb/n/b;

    check-cast p0, Lb/n/f;

    invoke-direct {v0, v1, p0}, Landroidx/lifecycle/FullLifecycleObserverAdapter;-><init>(Lb/n/b;Lb/n/f;)V

    return-object v0

    :cond_13
    if-eqz v1, :cond_1e

    .line 4
    new-instance v0, Landroidx/lifecycle/FullLifecycleObserverAdapter;

    check-cast p0, Lb/n/b;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Landroidx/lifecycle/FullLifecycleObserverAdapter;-><init>(Lb/n/b;Lb/n/f;)V

    return-object v0

    :cond_1e
    if-eqz v0, :cond_23

    .line 5
    check-cast p0, Lb/n/f;

    return-object p0

    .line 6
    :cond_23
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 7
    invoke-static {v0}, Lb/n/k;->b(Ljava/lang/Class;)I

    move-result v1

    const/4 v2, 0x2

    if-ne v1, v2, :cond_6f

    .line 8
    sget-object v1, Lb/n/k;->b:Ljava/util/Map;

    .line 9
    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 10
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-ne v1, v3, :cond_4e

    .line 11
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/reflect/Constructor;

    .line 12
    invoke-static {v0, p0}, Lb/n/k;->a(Ljava/lang/reflect/Constructor;Ljava/lang/Object;)Lb/n/c;

    move-result-object p0

    .line 13
    new-instance v0, Landroidx/lifecycle/SingleGeneratedAdapterObserver;

    invoke-direct {v0, p0}, Landroidx/lifecycle/SingleGeneratedAdapterObserver;-><init>(Lb/n/c;)V

    return-object v0

    .line 14
    :cond_4e
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    new-array v1, v1, [Lb/n/c;

    .line 15
    :goto_54
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_69

    .line 16
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/reflect/Constructor;

    invoke-static {v3, p0}, Lb/n/k;->a(Ljava/lang/reflect/Constructor;Ljava/lang/Object;)Lb/n/c;

    move-result-object v3

    aput-object v3, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_54

    .line 17
    :cond_69
    new-instance p0, Landroidx/lifecycle/CompositeGeneratedAdaptersObserver;

    invoke-direct {p0, v1}, Landroidx/lifecycle/CompositeGeneratedAdaptersObserver;-><init>([Lb/n/c;)V

    return-object p0

    .line 18
    :cond_6f
    new-instance v0, Landroidx/lifecycle/ReflectiveGenericLifecycleObserver;

    invoke-direct {v0, p0}, Landroidx/lifecycle/ReflectiveGenericLifecycleObserver;-><init>(Ljava/lang/Object;)V

    return-object v0
.end method

.method public static a(Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 35
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "."

    const-string v2, "_"

    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "_LifecycleAdapter"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static a(Ljava/lang/Class;)Ljava/lang/reflect/Constructor;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/reflect/Constructor<",
            "+",
            "Lb/n/c;",
            ">;"
        }
    .end annotation

    .line 23
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Class;->getPackage()Ljava/lang/Package;

    move-result-object v0

    .line 24
    invoke-virtual {p0}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v1

    if-eqz v0, :cond_f

    .line 25
    invoke-virtual {v0}, Ljava/lang/Package;->getName()Ljava/lang/String;

    move-result-object v0

    goto :goto_11

    :cond_f
    const-string v0, ""

    .line 26
    :goto_11
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_19

    goto :goto_22

    .line 27
    :cond_19
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    add-int/2addr v2, v3

    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 28
    :goto_22
    invoke-static {v1}, Lb/n/k;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 29
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_2d

    goto :goto_41

    :cond_2d
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "."

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 30
    :goto_41
    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    new-array v1, v3, [Ljava/lang/Class;

    const/4 v2, 0x0

    aput-object p0, v1, v2

    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object p0

    .line 32
    invoke-virtual {p0}, Ljava/lang/reflect/Constructor;->isAccessible()Z

    move-result v0

    if-nez v0, :cond_57

    .line 33
    invoke-virtual {p0, v3}, Ljava/lang/reflect/Constructor;->setAccessible(Z)V
    :try_end_57
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_57} :catch_5f
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_57} :catch_58

    :cond_57
    return-object p0

    :catch_58
    move-exception p0

    .line 34
    new-instance v0, Ljava/lang/RuntimeException;

    invoke-direct {v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v0

    :catch_5f
    const/4 p0, 0x0

    return-object p0
.end method

.method public static b(Ljava/lang/Class;)I
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)I"
        }
    .end annotation

    .line 1
    sget-object v0, Lb/n/k;->a:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    if-eqz v0, :cond_f

    .line 2
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    return p0

    .line 3
    :cond_f
    invoke-static {p0}, Lb/n/k;->d(Ljava/lang/Class;)I

    move-result v0

    .line 4
    sget-object v1, Lb/n/k;->a:Ljava/util/Map;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, p0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return v0
.end method

.method public static c(Ljava/lang/Class;)Z
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)Z"
        }
    .end annotation

    if-eqz p0, :cond_c

    .line 1
    const-class v0, Lb/n/g;

    invoke-virtual {v0, p0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result p0

    if-eqz p0, :cond_c

    const/4 p0, 0x1

    goto :goto_d

    :cond_c
    const/4 p0, 0x0

    :goto_d
    return p0
.end method

.method public static d(Ljava/lang/Class;)I
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)I"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    if-nez v0, :cond_8

    return v1

    .line 2
    :cond_8
    invoke-static {p0}, Lb/n/k;->a(Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    const/4 v2, 0x2

    if-eqz v0, :cond_19

    .line 3
    sget-object v1, Lb/n/k;->b:Ljava/util/Map;

    .line 4
    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    .line 5
    invoke-interface {v1, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return v2

    .line 6
    :cond_19
    sget-object v0, Lb/n/a;->c:Lb/n/a;

    invoke-virtual {v0, p0}, Lb/n/a;->c(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_22

    return v1

    .line 7
    :cond_22
    invoke-virtual {p0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v0

    const/4 v3, 0x0

    .line 8
    invoke-static {v0}, Lb/n/k;->c(Ljava/lang/Class;)Z

    move-result v4

    if-eqz v4, :cond_41

    .line 9
    invoke-static {v0}, Lb/n/k;->b(Ljava/lang/Class;)I

    move-result v3

    if-ne v3, v1, :cond_34

    return v1

    .line 10
    :cond_34
    new-instance v3, Ljava/util/ArrayList;

    sget-object v4, Lb/n/k;->b:Ljava/util/Map;

    invoke-interface {v4, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Collection;

    invoke-direct {v3, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 11
    :cond_41
    invoke-virtual {p0}, Ljava/lang/Class;->getInterfaces()[Ljava/lang/Class;

    move-result-object v0

    array-length v4, v0

    const/4 v5, 0x0

    :goto_47
    if-ge v5, v4, :cond_6e

    aget-object v6, v0, v5

    .line 12
    invoke-static {v6}, Lb/n/k;->c(Ljava/lang/Class;)Z

    move-result v7

    if-nez v7, :cond_52

    goto :goto_6b

    .line 13
    :cond_52
    invoke-static {v6}, Lb/n/k;->b(Ljava/lang/Class;)I

    move-result v7

    if-ne v7, v1, :cond_59

    return v1

    :cond_59
    if-nez v3, :cond_60

    .line 14
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 15
    :cond_60
    sget-object v7, Lb/n/k;->b:Ljava/util/Map;

    invoke-interface {v7, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Collection;

    invoke-interface {v3, v6}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    :goto_6b
    add-int/lit8 v5, v5, 0x1

    goto :goto_47

    :cond_6e
    if-eqz v3, :cond_76

    .line 16
    sget-object v0, Lb/n/k;->b:Ljava/util/Map;

    invoke-interface {v0, p0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return v2

    :cond_76
    return v1
.end method
