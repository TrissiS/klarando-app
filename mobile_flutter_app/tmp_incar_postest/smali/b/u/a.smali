.class public abstract Lb/u/a;
.super Ljava/lang/Object;
.source "VersionedParcel.java"


# instance fields
.field public final a:Lb/e/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lb/e/a<",
            "Ljava/lang/String;",
            "Ljava/lang/reflect/Method;",
            ">;"
        }
    .end annotation
.end field

.field public final b:Lb/e/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lb/e/a<",
            "Ljava/lang/String;",
            "Ljava/lang/reflect/Method;",
            ">;"
        }
    .end annotation
.end field

.field public final c:Lb/e/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lb/e/a<",
            "Ljava/lang/String;",
            "Ljava/lang/Class;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lb/e/a;Lb/e/a;Lb/e/a;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lb/e/a<",
            "Ljava/lang/String;",
            "Ljava/lang/reflect/Method;",
            ">;",
            "Lb/e/a<",
            "Ljava/lang/String;",
            "Ljava/lang/reflect/Method;",
            ">;",
            "Lb/e/a<",
            "Ljava/lang/String;",
            "Ljava/lang/Class;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lb/u/a;->a:Lb/e/a;

    .line 3
    iput-object p2, p0, Lb/u/a;->b:Lb/e/a;

    .line 4
    iput-object p3, p0, Lb/u/a;->c:Lb/e/a;

    return-void
.end method


# virtual methods
.method public a(II)I
    .registers 3

    .line 3
    invoke-virtual {p0, p2}, Lb/u/a;->a(I)Z

    move-result p2

    if-nez p2, :cond_7

    return p1

    .line 4
    :cond_7
    invoke-virtual {p0}, Lb/u/a;->g()I

    move-result p1

    return p1
.end method

.method public a(Landroid/os/Parcelable;I)Landroid/os/Parcelable;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Landroid/os/Parcelable;",
            ">(TT;I)TT;"
        }
    .end annotation

    .line 9
    invoke-virtual {p0, p2}, Lb/u/a;->a(I)Z

    move-result p2

    if-nez p2, :cond_7

    return-object p1

    .line 10
    :cond_7
    invoke-virtual {p0}, Lb/u/a;->h()Landroid/os/Parcelable;

    move-result-object p1

    return-object p1
.end method

.method public a(Lb/u/c;I)Lb/u/c;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lb/u/c;",
            ">(TT;I)TT;"
        }
    .end annotation

    .line 18
    invoke-virtual {p0, p2}, Lb/u/a;->a(I)Z

    move-result p2

    if-nez p2, :cond_7

    return-object p1

    .line 19
    :cond_7
    invoke-virtual {p0}, Lb/u/a;->j()Lb/u/c;

    move-result-object p1

    return-object p1
.end method

.method public a(Ljava/lang/String;Lb/u/a;)Lb/u/c;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lb/u/c;",
            ">(",
            "Ljava/lang/String;",
            "Lb/u/a;",
            ")TT;"
        }
    .end annotation

    .line 20
    :try_start_0
    invoke-virtual {p0, p1}, Lb/u/a;->a(Ljava/lang/String;)Ljava/lang/reflect/Method;

    move-result-object p1

    const/4 v0, 0x0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    .line 21
    invoke-virtual {p1, v0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lb/u/c;
    :try_end_11
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_11} :catch_3c
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_11} :catch_24
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_11} :catch_1b
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_11} :catch_12

    return-object p1

    :catch_12
    move-exception p1

    .line 22
    new-instance p2, Ljava/lang/RuntimeException;

    const-string v0, "VersionedParcel encountered ClassNotFoundException"

    invoke-direct {p2, v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p2

    :catch_1b
    move-exception p1

    .line 23
    new-instance p2, Ljava/lang/RuntimeException;

    const-string v0, "VersionedParcel encountered NoSuchMethodException"

    invoke-direct {p2, v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p2

    :catch_24
    move-exception p1

    .line 24
    invoke-virtual {p1}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object p2

    instance-of p2, p2, Ljava/lang/RuntimeException;

    if-eqz p2, :cond_34

    .line 25
    invoke-virtual {p1}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object p1

    check-cast p1, Ljava/lang/RuntimeException;

    throw p1

    .line 26
    :cond_34
    new-instance p2, Ljava/lang/RuntimeException;

    const-string v0, "VersionedParcel encountered InvocationTargetException"

    invoke-direct {p2, v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p2

    :catch_3c
    move-exception p1

    .line 27
    new-instance p2, Ljava/lang/RuntimeException;

    const-string v0, "VersionedParcel encountered IllegalAccessException"

    invoke-direct {p2, v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p2
.end method

.method public a(Ljava/lang/CharSequence;I)Ljava/lang/CharSequence;
    .registers 3

    .line 11
    invoke-virtual {p0, p2}, Lb/u/a;->a(I)Z

    move-result p2

    if-nez p2, :cond_7

    return-object p1

    .line 12
    :cond_7
    invoke-virtual {p0}, Lb/u/a;->f()Ljava/lang/CharSequence;

    move-result-object p1

    return-object p1
.end method

.method public final a(Ljava/lang/Class;)Ljava/lang/Class;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "+",
            "Lb/u/c;",
            ">;)",
            "Ljava/lang/Class;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .line 41
    iget-object v0, p0, Lb/u/a;->c:Lb/e/a;

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lb/e/g;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Class;

    if-nez v0, :cond_3a

    .line 42
    invoke-virtual {p1}, Ljava/lang/Class;->getPackage()Ljava/lang/Package;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Package;->getName()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    const/4 v0, 0x1

    .line 43
    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v0

    const-string v0, "%s.%sParcelizer"

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 44
    invoke-virtual {p1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-static {v0, v2, v1}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v0

    .line 45
    iget-object v1, p0, Lb/u/a;->c:Lb/e/a;

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1, v0}, Lb/e/g;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_3a
    return-object v0
.end method

.method public a(Ljava/lang/String;I)Ljava/lang/String;
    .registers 3

    .line 5
    invoke-virtual {p0, p2}, Lb/u/a;->a(I)Z

    move-result p2

    if-nez p2, :cond_7

    return-object p1

    .line 6
    :cond_7
    invoke-virtual {p0}, Lb/u/a;->i()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public final a(Ljava/lang/String;)Ljava/lang/reflect/Method;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/NoSuchMethodException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .line 36
    const-class v0, Lb/u/a;

    iget-object v1, p0, Lb/u/a;->a:Lb/e/a;

    invoke-virtual {v1, p1}, Lb/e/g;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/reflect/Method;

    if-nez v1, :cond_28

    .line 37
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 38
    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    const/4 v2, 0x1

    invoke-static {p1, v2, v1}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v1

    new-array v2, v2, [Ljava/lang/Class;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const-string v0, "read"

    .line 39
    invoke-virtual {v1, v0, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 40
    iget-object v0, p0, Lb/u/a;->a:Lb/e/a;

    invoke-virtual {v0, p1, v1}, Lb/e/g;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_28
    return-object v1
.end method

.method public abstract a()V
.end method

.method public abstract a(Landroid/os/Parcelable;)V
.end method

.method public a(Lb/u/c;)V
    .registers 3

    if-nez p1, :cond_7

    const/4 p1, 0x0

    .line 13
    invoke-virtual {p0, p1}, Lb/u/a;->b(Ljava/lang/String;)V

    return-void

    .line 14
    :cond_7
    invoke-virtual {p0, p1}, Lb/u/a;->b(Lb/u/c;)V

    .line 15
    invoke-virtual {p0}, Lb/u/a;->b()Lb/u/a;

    move-result-object v0

    .line 16
    invoke-virtual {p0, p1, v0}, Lb/u/a;->a(Lb/u/c;Lb/u/a;)V

    .line 17
    invoke-virtual {v0}, Lb/u/a;->a()V

    return-void
.end method

.method public a(Lb/u/c;Lb/u/a;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lb/u/c;",
            ">(TT;",
            "Lb/u/a;",
            ")V"
        }
    .end annotation

    .line 28
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p0, v0}, Lb/u/a;->b(Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const/4 p1, 0x1

    aput-object p2, v2, p1

    .line 29
    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_15
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_15} :catch_40
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_15} :catch_28
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_15} :catch_1f
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_15} :catch_16

    return-void

    :catch_16
    move-exception p1

    .line 30
    new-instance p2, Ljava/lang/RuntimeException;

    const-string v0, "VersionedParcel encountered ClassNotFoundException"

    invoke-direct {p2, v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p2

    :catch_1f
    move-exception p1

    .line 31
    new-instance p2, Ljava/lang/RuntimeException;

    const-string v0, "VersionedParcel encountered NoSuchMethodException"

    invoke-direct {p2, v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p2

    :catch_28
    move-exception p1

    .line 32
    invoke-virtual {p1}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object p2

    instance-of p2, p2, Ljava/lang/RuntimeException;

    if-eqz p2, :cond_38

    .line 33
    invoke-virtual {p1}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object p1

    check-cast p1, Ljava/lang/RuntimeException;

    throw p1

    .line 34
    :cond_38
    new-instance p2, Ljava/lang/RuntimeException;

    const-string v0, "VersionedParcel encountered InvocationTargetException"

    invoke-direct {p2, v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p2

    :catch_40
    move-exception p1

    .line 35
    new-instance p2, Ljava/lang/RuntimeException;

    const-string v0, "VersionedParcel encountered IllegalAccessException"

    invoke-direct {p2, v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p2
.end method

.method public abstract a(Ljava/lang/CharSequence;)V
.end method

.method public abstract a(Z)V
.end method

.method public a(ZZ)V
    .registers 3

    return-void
.end method

.method public abstract a([B)V
.end method

.method public abstract a(I)Z
.end method

.method public a(ZI)Z
    .registers 3

    .line 1
    invoke-virtual {p0, p2}, Lb/u/a;->a(I)Z

    move-result p2

    if-nez p2, :cond_7

    return p1

    .line 2
    :cond_7
    invoke-virtual {p0}, Lb/u/a;->d()Z

    move-result p1

    return p1
.end method

.method public a([BI)[B
    .registers 3

    .line 7
    invoke-virtual {p0, p2}, Lb/u/a;->a(I)Z

    move-result p2

    if-nez p2, :cond_7

    return-object p1

    .line 8
    :cond_7
    invoke-virtual {p0}, Lb/u/a;->e()[B

    move-result-object p1

    return-object p1
.end method

.method public abstract b()Lb/u/a;
.end method

.method public final b(Ljava/lang/Class;)Ljava/lang/reflect/Method;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/NoSuchMethodException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .line 18
    iget-object v0, p0, Lb/u/a;->b:Lb/e/a;

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lb/e/g;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/reflect/Method;

    if-nez v0, :cond_2f

    .line 19
    invoke-virtual {p0, p1}, Lb/u/a;->a(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v0

    .line 20
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Class;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const/4 v2, 0x1

    .line 21
    const-class v3, Lb/u/a;

    aput-object v3, v1, v2

    const-string v2, "write"

    invoke-virtual {v0, v2, v1}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 22
    iget-object v1, p0, Lb/u/a;->b:Lb/e/a;

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1, v0}, Lb/e/g;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_2f
    return-object v0
.end method

.method public abstract b(I)V
.end method

.method public b(II)V
    .registers 3

    .line 7
    invoke-virtual {p0, p2}, Lb/u/a;->b(I)V

    .line 8
    invoke-virtual {p0, p1}, Lb/u/a;->c(I)V

    return-void
.end method

.method public b(Landroid/os/Parcelable;I)V
    .registers 3

    .line 11
    invoke-virtual {p0, p2}, Lb/u/a;->b(I)V

    .line 12
    invoke-virtual {p0, p1}, Lb/u/a;->a(Landroid/os/Parcelable;)V

    return-void
.end method

.method public final b(Lb/u/c;)V
    .registers 5

    .line 15
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p0, v0}, Lb/u/a;->a(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object p1
    :try_end_8
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_8} :catch_10

    .line 16
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lb/u/a;->b(Ljava/lang/String;)V

    return-void

    :catch_10
    move-exception v0

    .line 17
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " does not have a Parcelizer"

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public b(Lb/u/c;I)V
    .registers 3

    .line 13
    invoke-virtual {p0, p2}, Lb/u/a;->b(I)V

    .line 14
    invoke-virtual {p0, p1}, Lb/u/a;->a(Lb/u/c;)V

    return-void
.end method

.method public b(Ljava/lang/CharSequence;I)V
    .registers 3

    .line 5
    invoke-virtual {p0, p2}, Lb/u/a;->b(I)V

    .line 6
    invoke-virtual {p0, p1}, Lb/u/a;->a(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public abstract b(Ljava/lang/String;)V
.end method

.method public b(Ljava/lang/String;I)V
    .registers 3

    .line 9
    invoke-virtual {p0, p2}, Lb/u/a;->b(I)V

    .line 10
    invoke-virtual {p0, p1}, Lb/u/a;->b(Ljava/lang/String;)V

    return-void
.end method

.method public b(ZI)V
    .registers 3

    .line 1
    invoke-virtual {p0, p2}, Lb/u/a;->b(I)V

    .line 2
    invoke-virtual {p0, p1}, Lb/u/a;->a(Z)V

    return-void
.end method

.method public b([BI)V
    .registers 3

    .line 3
    invoke-virtual {p0, p2}, Lb/u/a;->b(I)V

    .line 4
    invoke-virtual {p0, p1}, Lb/u/a;->a([B)V

    return-void
.end method

.method public abstract c(I)V
.end method

.method public c()Z
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public abstract d()Z
.end method

.method public abstract e()[B
.end method

.method public abstract f()Ljava/lang/CharSequence;
.end method

.method public abstract g()I
.end method

.method public abstract h()Landroid/os/Parcelable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Landroid/os/Parcelable;",
            ">()TT;"
        }
    .end annotation
.end method

.method public abstract i()Ljava/lang/String;
.end method

.method public j()Lb/u/c;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lb/u/c;",
            ">()TT;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lb/u/a;->i()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_8

    const/4 v0, 0x0

    return-object v0

    .line 2
    :cond_8
    invoke-virtual {p0}, Lb/u/a;->b()Lb/u/a;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lb/u/a;->a(Ljava/lang/String;Lb/u/a;)Lb/u/c;

    move-result-object v0

    return-object v0
.end method
