.class public Lb/n/r;
.super Ljava/lang/Object;
.source "ViewModelProvider.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lb/n/r$b;,
        Lb/n/r$c;,
        Lb/n/r$a;
    }
.end annotation


# instance fields
.field public final a:Lb/n/r$a;

.field public final b:Lb/n/s;


# direct methods
.method public constructor <init>(Lb/n/s;Lb/n/r$a;)V
    .registers 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p2, p0, Lb/n/r;->a:Lb/n/r$a;

    .line 3
    iput-object p1, p0, Lb/n/r;->b:Lb/n/s;

    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Class;)Lb/n/q;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lb/n/q;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1c

    .line 2
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "androidx.lifecycle.ViewModelProvider.DefaultKey:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Lb/n/r;->a(Ljava/lang/String;Ljava/lang/Class;)Lb/n/q;

    move-result-object p1

    return-object p1

    .line 3
    :cond_1c
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Local and anonymous classes can not be ViewModels"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public a(Ljava/lang/String;Ljava/lang/Class;)Lb/n/q;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lb/n/q;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 4
    iget-object v0, p0, Lb/n/r;->b:Lb/n/s;

    invoke-virtual {v0, p1}, Lb/n/s;->a(Ljava/lang/String;)Lb/n/q;

    move-result-object v0

    .line 5
    invoke-virtual {p2, v0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_18

    .line 6
    iget-object p1, p0, Lb/n/r;->a:Lb/n/r$a;

    instance-of p2, p1, Lb/n/r$c;

    if-eqz p2, :cond_17

    .line 7
    check-cast p1, Lb/n/r$c;

    invoke-virtual {p1, v0}, Lb/n/r$c;->a(Lb/n/q;)V

    :cond_17
    return-object v0

    .line 8
    :cond_18
    iget-object v0, p0, Lb/n/r;->a:Lb/n/r$a;

    instance-of v1, v0, Lb/n/r$b;

    if-eqz v1, :cond_25

    .line 9
    check-cast v0, Lb/n/r$b;

    invoke-virtual {v0, p1, p2}, Lb/n/r$b;->a(Ljava/lang/String;Ljava/lang/Class;)Lb/n/q;

    move-result-object p2

    goto :goto_29

    .line 10
    :cond_25
    invoke-interface {v0, p2}, Lb/n/r$a;->a(Ljava/lang/Class;)Lb/n/q;

    move-result-object p2

    .line 11
    :goto_29
    iget-object v0, p0, Lb/n/r;->b:Lb/n/s;

    invoke-virtual {v0, p1, p2}, Lb/n/s;->a(Ljava/lang/String;Lb/n/q;)V

    return-object p2
.end method
