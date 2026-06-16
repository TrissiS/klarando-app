.class public abstract Lf/a/a$c;
.super Ljava/lang/Object;
.source "Timber.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lf/a/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "c"
.end annotation


# instance fields
.field public final a:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    iput-object v0, p0, Lf/a/a$c;->a:Ljava/lang/ThreadLocal;

    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .registers 3

    .line 1
    iget-object v0, p0, Lf/a/a$c;->a:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_f

    .line 2
    iget-object v1, p0, Lf/a/a$c;->a:Ljava/lang/ThreadLocal;

    invoke-virtual {v1}, Ljava/lang/ThreadLocal;->remove()V

    :cond_f
    return-object v0
.end method

.method public final a(Ljava/lang/Throwable;)Ljava/lang/String;
    .registers 5

    .line 13
    new-instance v0, Ljava/io/StringWriter;

    const/16 v1, 0x100

    invoke-direct {v0, v1}, Ljava/io/StringWriter;-><init>(I)V

    .line 14
    new-instance v1, Ljava/io/PrintWriter;

    const/4 v2, 0x0

    invoke-direct {v1, v0, v2}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;Z)V

    .line 15
    invoke-virtual {p1, v1}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 16
    invoke-virtual {v1}, Ljava/io/PrintWriter;->flush()V

    .line 17
    invoke-virtual {v0}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public abstract a(ILjava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
.end method

.method public final varargs a(ILjava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 7

    .line 5
    invoke-virtual {p0}, Lf/a/a$c;->a()Ljava/lang/String;

    move-result-object v0

    .line 6
    invoke-virtual {p0, v0, p1}, Lf/a/a$c;->a(Ljava/lang/String;I)Z

    move-result v1

    if-nez v1, :cond_b

    return-void

    :cond_b
    if-eqz p3, :cond_14

    .line 7
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_14

    const/4 p3, 0x0

    :cond_14
    if-nez p3, :cond_1e

    if-nez p2, :cond_19

    return-void

    .line 8
    :cond_19
    invoke-virtual {p0, p2}, Lf/a/a$c;->a(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p3

    goto :goto_41

    :cond_1e
    if-eqz p4, :cond_27

    .line 9
    array-length v1, p4

    if-lez v1, :cond_27

    .line 10
    invoke-virtual {p0, p3, p4}, Lf/a/a$c;->b(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p3

    :cond_27
    if-eqz p2, :cond_41

    .line 11
    new-instance p4, Ljava/lang/StringBuilder;

    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, "\n"

    invoke-virtual {p4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p2}, Lf/a/a$c;->a(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    .line 12
    :cond_41
    :goto_41
    invoke-virtual {p0, p1, v0, p3, p2}, Lf/a/a$c;->a(ILjava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public varargs a(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 5

    const/4 v0, 0x3

    const/4 v1, 0x0

    .line 3
    invoke-virtual {p0, v0, v1, p1, p2}, Lf/a/a$c;->a(ILjava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method public a(I)Z
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 p1, 0x1

    return p1
.end method

.method public a(Ljava/lang/String;I)Z
    .registers 3

    .line 4
    invoke-virtual {p0, p2}, Lf/a/a$c;->a(I)Z

    move-result p1

    return p1
.end method

.method public b(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    .registers 3

    .line 1
    invoke-static {p1, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public varargs c(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 5

    const/4 v0, 0x4

    const/4 v1, 0x0

    .line 1
    invoke-virtual {p0, v0, v1, p1, p2}, Lf/a/a$c;->a(ILjava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method
