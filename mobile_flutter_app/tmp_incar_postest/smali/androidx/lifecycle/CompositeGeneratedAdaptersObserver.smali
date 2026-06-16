.class public Landroidx/lifecycle/CompositeGeneratedAdaptersObserver;
.super Ljava/lang/Object;
.source "CompositeGeneratedAdaptersObserver.java"

# interfaces
.implements Lb/n/f;


# instance fields
.field public final a:[Lb/n/c;


# direct methods
.method public constructor <init>([Lb/n/c;)V
    .registers 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Landroidx/lifecycle/CompositeGeneratedAdaptersObserver;->a:[Lb/n/c;

    return-void
.end method


# virtual methods
.method public a(Lb/n/h;Lb/n/e$b;)V
    .registers 9

    .line 1
    new-instance v0, Lb/n/l;

    invoke-direct {v0}, Lb/n/l;-><init>()V

    .line 2
    iget-object v1, p0, Landroidx/lifecycle/CompositeGeneratedAdaptersObserver;->a:[Lb/n/c;

    array-length v2, v1

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_a
    if-ge v4, v2, :cond_14

    aget-object v5, v1, v4

    .line 3
    invoke-interface {v5, p1, p2, v3, v0}, Lb/n/c;->a(Lb/n/h;Lb/n/e$b;ZLb/n/l;)V

    add-int/lit8 v4, v4, 0x1

    goto :goto_a

    .line 4
    :cond_14
    iget-object v1, p0, Landroidx/lifecycle/CompositeGeneratedAdaptersObserver;->a:[Lb/n/c;

    array-length v2, v1

    :goto_17
    if-ge v3, v2, :cond_22

    aget-object v4, v1, v3

    const/4 v5, 0x1

    .line 5
    invoke-interface {v4, p1, p2, v5, v0}, Lb/n/c;->a(Lb/n/h;Lb/n/e$b;ZLb/n/l;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_17

    :cond_22
    return-void
.end method
