.class public Lb/f/b/d$b;
.super Lb/f/b/b;
.source "LinearSystem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/f/b/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# direct methods
.method public constructor <init>(Lb/f/b/d;Lb/f/b/c;)V
    .registers 3

    .line 1
    invoke-direct {p0}, Lb/f/b/b;-><init>()V

    .line 2
    new-instance p1, Lb/f/b/j;

    invoke-direct {p1, p0, p2}, Lb/f/b/j;-><init>(Lb/f/b/b;Lb/f/b/c;)V

    iput-object p1, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    return-void
.end method
