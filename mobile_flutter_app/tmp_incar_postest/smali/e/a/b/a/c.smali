.class public Le/a/b/a/c;
.super Ljava/lang/Object;
.source "JoinPointImpl.java"

# interfaces
.implements Le/a/a/c;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/a/b/a/c$a;
    }
.end annotation


# instance fields
.field public a:[Ljava/lang/Object;

.field public b:Le/a/a/a$a;


# direct methods
.method public constructor <init>(Le/a/a/a$a;Ljava/lang/Object;Ljava/lang/Object;[Ljava/lang/Object;)V
    .registers 5

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Le/a/b/a/c;->b:Le/a/a/a$a;

    .line 3
    iput-object p4, p0, Le/a/b/a/c;->a:[Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public a()Le/a/a/d;
    .registers 2

    .line 1
    iget-object v0, p0, Le/a/b/a/c;->b:Le/a/a/a$a;

    invoke-interface {v0}, Le/a/a/a$a;->a()Le/a/a/d;

    move-result-object v0

    return-object v0
.end method

.method public b()[Ljava/lang/Object;
    .registers 5

    .line 1
    iget-object v0, p0, Le/a/b/a/c;->a:[Ljava/lang/Object;

    const/4 v1, 0x0

    if-nez v0, :cond_9

    new-array v0, v1, [Ljava/lang/Object;

    .line 2
    iput-object v0, p0, Le/a/b/a/c;->a:[Ljava/lang/Object;

    .line 3
    :cond_9
    iget-object v0, p0, Le/a/b/a/c;->a:[Ljava/lang/Object;

    array-length v2, v0

    new-array v2, v2, [Ljava/lang/Object;

    .line 4
    array-length v3, v0

    invoke-static {v0, v1, v2, v1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method

.method public final toString()Ljava/lang/String;
    .registers 2

    .line 1
    iget-object v0, p0, Le/a/b/a/c;->b:Le/a/a/a$a;

    invoke-interface {v0}, Le/a/a/a$a;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
