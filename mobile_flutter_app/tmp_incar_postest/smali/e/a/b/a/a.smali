.class public abstract Le/a/b/a/a;
.super Le/a/b/a/d;
.source "CodeSignatureImpl.java"

# interfaces
.implements Le/a/a/e/a;


# instance fields
.field public i:[Ljava/lang/Class;

.field public j:[Ljava/lang/Class;


# direct methods
.method public constructor <init>(ILjava/lang/String;Ljava/lang/Class;[Ljava/lang/Class;[Ljava/lang/String;[Ljava/lang/Class;)V
    .registers 7

    .line 1
    invoke-direct {p0, p1, p2, p3}, Le/a/b/a/d;-><init>(ILjava/lang/String;Ljava/lang/Class;)V

    .line 2
    iput-object p4, p0, Le/a/b/a/a;->i:[Ljava/lang/Class;

    .line 3
    iput-object p6, p0, Le/a/b/a/a;->j:[Ljava/lang/Class;

    return-void
.end method


# virtual methods
.method public f()[Ljava/lang/Class;
    .registers 2

    .line 1
    iget-object v0, p0, Le/a/b/a/a;->j:[Ljava/lang/Class;

    if-nez v0, :cond_b

    const/4 v0, 0x5

    invoke-virtual {p0, v0}, Le/a/b/a/f;->d(I)[Ljava/lang/Class;

    move-result-object v0

    iput-object v0, p0, Le/a/b/a/a;->j:[Ljava/lang/Class;

    .line 2
    :cond_b
    iget-object v0, p0, Le/a/b/a/a;->j:[Ljava/lang/Class;

    return-object v0
.end method

.method public g()[Ljava/lang/Class;
    .registers 2

    .line 1
    iget-object v0, p0, Le/a/b/a/a;->i:[Ljava/lang/Class;

    if-nez v0, :cond_b

    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Le/a/b/a/f;->d(I)[Ljava/lang/Class;

    move-result-object v0

    iput-object v0, p0, Le/a/b/a/a;->i:[Ljava/lang/Class;

    .line 2
    :cond_b
    iget-object v0, p0, Le/a/b/a/a;->i:[Ljava/lang/Class;

    return-object v0
.end method
