.class public Lb/h/k/e$e;
.super Lb/h/k/e$d;
.source "TextDirectionHeuristicsCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/h/k/e;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "e"
.end annotation


# instance fields
.field public final b:Z


# direct methods
.method public constructor <init>(Lb/h/k/e$c;Z)V
    .registers 3

    .line 1
    invoke-direct {p0, p1}, Lb/h/k/e$d;-><init>(Lb/h/k/e$c;)V

    .line 2
    iput-boolean p2, p0, Lb/h/k/e$e;->b:Z

    return-void
.end method


# virtual methods
.method public a()Z
    .registers 2

    .line 1
    iget-boolean v0, p0, Lb/h/k/e$e;->b:Z

    return v0
.end method
