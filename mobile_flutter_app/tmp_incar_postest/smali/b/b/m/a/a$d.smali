.class public Lb/b/m/a/a$d;
.super Lb/b/m/a/a$g;
.source "AnimatedStateListDrawableCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/b/m/a/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "d"
.end annotation


# instance fields
.field public final a:Lb/t/a/a/c;


# direct methods
.method public constructor <init>(Lb/t/a/a/c;)V
    .registers 3

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, v0}, Lb/b/m/a/a$g;-><init>(Lb/b/m/a/a$a;)V

    .line 2
    iput-object p1, p0, Lb/b/m/a/a$d;->a:Lb/t/a/a/c;

    return-void
.end method


# virtual methods
.method public c()V
    .registers 2

    .line 1
    iget-object v0, p0, Lb/b/m/a/a$d;->a:Lb/t/a/a/c;

    invoke-virtual {v0}, Lb/t/a/a/c;->start()V

    return-void
.end method

.method public d()V
    .registers 2

    .line 1
    iget-object v0, p0, Lb/b/m/a/a$d;->a:Lb/t/a/a/c;

    invoke-virtual {v0}, Lb/t/a/a/c;->stop()V

    return-void
.end method
