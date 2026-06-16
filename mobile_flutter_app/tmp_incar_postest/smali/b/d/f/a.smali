.class public Lb/d/f/a;
.super Lb/d/f/c;
.source "CardViewApi17Impl.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Lb/d/f/c;-><init>()V

    return-void
.end method


# virtual methods
.method public a()V
    .registers 2

    .line 1
    new-instance v0, Lb/d/f/a$a;

    invoke-direct {v0, p0}, Lb/d/f/a$a;-><init>(Lb/d/f/a;)V

    sput-object v0, Lb/d/f/g;->r:Lb/d/f/g$a;

    return-void
.end method
