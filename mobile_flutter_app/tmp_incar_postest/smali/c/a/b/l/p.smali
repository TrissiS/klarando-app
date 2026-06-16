.class public abstract Lc/a/b/l/p;
.super Lc/a/b/l/m;
.source "UPCEANWriter.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Lc/a/b/l/m;-><init>()V

    return-void
.end method


# virtual methods
.method public a()I
    .registers 2

    .line 1
    sget-object v0, Lc/a/b/l/o;->a:[I

    array-length v0, v0

    return v0
.end method
