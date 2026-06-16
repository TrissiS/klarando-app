.class public Lc/a/a/a/c0/c$b;
.super Landroid/graphics/drawable/Drawable$ConstantState;
.source "BorderDrawable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lc/a/a/a/c0/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field public final synthetic a:Lc/a/a/a/c0/c;


# direct methods
.method public constructor <init>(Lc/a/a/a/c0/c;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lc/a/a/a/c0/c$b;->a:Lc/a/a/a/c0/c;

    invoke-direct {p0}, Landroid/graphics/drawable/Drawable$ConstantState;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lc/a/a/a/c0/c;Lc/a/a/a/c0/c$a;)V
    .registers 3

    .line 2
    invoke-direct {p0, p1}, Lc/a/a/a/c0/c$b;-><init>(Lc/a/a/a/c0/c;)V

    return-void
.end method


# virtual methods
.method public getChangingConfigurations()I
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public newDrawable()Landroid/graphics/drawable/Drawable;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/c0/c$b;->a:Lc/a/a/a/c0/c;

    return-object v0
.end method
