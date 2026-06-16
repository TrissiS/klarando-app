.class public Lb/o/a/b$c;
.super Lb/n/q;
.source "LoaderManagerImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/o/a/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "c"
.end annotation


# static fields
.field public static final c:Lb/n/r$a;


# instance fields
.field public b:Lb/e/h;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lb/e/h<",
            "Lb/o/a/b$a;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public static constructor <clinit>()V
    .registers 1

    .line 1
    new-instance v0, Lb/o/a/b$c$a;

    invoke-direct {v0}, Lb/o/a/b$c$a;-><init>()V

    sput-object v0, Lb/o/a/b$c;->c:Lb/n/r$a;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .line 1
    invoke-direct {p0}, Lb/n/q;-><init>()V

    .line 2
    new-instance v0, Lb/e/h;

    invoke-direct {v0}, Lb/e/h;-><init>()V

    iput-object v0, p0, Lb/o/a/b$c;->b:Lb/e/h;

    return-void
.end method

.method public static a(Lb/n/s;)Lb/o/a/b$c;
    .registers 3

    .line 1
    new-instance v0, Lb/n/r;

    sget-object v1, Lb/o/a/b$c;->c:Lb/n/r$a;

    invoke-direct {v0, p0, v1}, Lb/n/r;-><init>(Lb/n/s;Lb/n/r$a;)V

    const-class p0, Lb/o/a/b$c;

    invoke-virtual {v0, p0}, Lb/n/r;->a(Ljava/lang/Class;)Lb/n/q;

    move-result-object p0

    check-cast p0, Lb/o/a/b$c;

    return-object p0
.end method


# virtual methods
.method public a(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .registers 8

    .line 2
    iget-object v0, p0, Lb/o/a/b$c;->b:Lb/e/h;

    invoke-virtual {v0}, Lb/e/h;->c()I

    move-result v0

    if-lez v0, :cond_55

    .line 3
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "Loaders:"

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "    "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    .line 5
    iget-object v2, p0, Lb/o/a/b$c;->b:Lb/e/h;

    invoke-virtual {v2}, Lb/e/h;->c()I

    move-result v2

    if-gtz v2, :cond_2b

    goto :goto_55

    .line 6
    :cond_2b
    iget-object v2, p0, Lb/o/a/b$c;->b:Lb/e/h;

    invoke-virtual {v2, v1}, Lb/e/h;->c(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb/o/a/b$a;

    .line 7
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string p1, "  #"

    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object p1, p0, Lb/o/a/b$c;->b:Lb/e/h;

    invoke-virtual {p1, v1}, Lb/e/h;->b(I)I

    move-result p1

    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(I)V

    const-string p1, ": "

    .line 8
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    invoke-virtual {v2}, Lb/o/a/b$a;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 9
    invoke-virtual {v2, v0, p2, p3, p4}, Lb/o/a/b$a;->a(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V

    const/4 p1, 0x0

    throw p1

    :cond_55
    :goto_55
    return-void
.end method

.method public b()V
    .registers 3

    .line 1
    invoke-super {p0}, Lb/n/q;->b()V

    .line 2
    iget-object v0, p0, Lb/o/a/b$c;->b:Lb/e/h;

    invoke-virtual {v0}, Lb/e/h;->c()I

    move-result v0

    if-gtz v0, :cond_11

    .line 3
    iget-object v0, p0, Lb/o/a/b$c;->b:Lb/e/h;

    invoke-virtual {v0}, Lb/e/h;->a()V

    return-void

    .line 4
    :cond_11
    iget-object v0, p0, Lb/o/a/b$c;->b:Lb/e/h;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lb/e/h;->c(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb/o/a/b$a;

    const/4 v1, 0x1

    .line 5
    invoke-virtual {v0, v1}, Lb/o/a/b$a;->a(Z)Lb/o/b/a;

    const/4 v0, 0x0

    throw v0
.end method

.method public c()V
    .registers 4

    .line 1
    iget-object v0, p0, Lb/o/a/b$c;->b:Lb/e/h;

    invoke-virtual {v0}, Lb/e/h;->c()I

    move-result v0

    const/4 v1, 0x0

    :goto_7
    if-ge v1, v0, :cond_17

    .line 2
    iget-object v2, p0, Lb/o/a/b$c;->b:Lb/e/h;

    invoke-virtual {v2, v1}, Lb/e/h;->c(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb/o/a/b$a;

    .line 3
    invoke-virtual {v2}, Lb/o/a/b$a;->c()V

    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    :cond_17
    return-void
.end method
