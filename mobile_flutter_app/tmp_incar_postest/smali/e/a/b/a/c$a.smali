.class public Le/a/b/a/c$a;
.super Ljava/lang/Object;
.source "JoinPointImpl.java"

# interfaces
.implements Le/a/a/a$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/a/b/a/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:Le/a/a/d;


# direct methods
.method public constructor <init>(ILjava/lang/String;Le/a/a/d;Le/a/a/e/d;)V
    .registers 5

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p2, p0, Le/a/b/a/c$a;->a:Ljava/lang/String;

    .line 3
    iput-object p3, p0, Le/a/b/a/c$a;->b:Le/a/a/d;

    return-void
.end method


# virtual methods
.method public a()Le/a/a/d;
    .registers 2

    .line 1
    iget-object v0, p0, Le/a/b/a/c$a;->b:Le/a/a/d;

    return-object v0
.end method

.method public a(Le/a/b/a/h;)Ljava/lang/String;
    .registers 4

    .line 2
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 3
    invoke-virtual {p0}, Le/a/b/a/c$a;->b()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Le/a/b/a/h;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v1, "("

    .line 4
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 5
    invoke-virtual {p0}, Le/a/b/a/c$a;->a()Le/a/a/d;

    move-result-object v1

    check-cast v1, Le/a/b/a/f;

    invoke-virtual {v1, p1}, Le/a/b/a/f;->b(Le/a/b/a/h;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string p1, ")"

    .line 6
    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 7
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public b()Ljava/lang/String;
    .registers 2

    .line 1
    iget-object v0, p0, Le/a/b/a/c$a;->a:Ljava/lang/String;

    return-object v0
.end method

.method public final toString()Ljava/lang/String;
    .registers 2

    .line 1
    sget-object v0, Le/a/b/a/h;->h:Le/a/b/a/h;

    invoke-virtual {p0, v0}, Le/a/b/a/c$a;->a(Le/a/b/a/h;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
