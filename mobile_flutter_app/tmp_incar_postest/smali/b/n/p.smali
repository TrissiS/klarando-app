.class public final Lb/n/p;
.super Ljava/lang/Object;
.source "SavedStateHandle.java"


# direct methods
.method public static constructor <clinit>()V
    .registers 2

    .line 1
    sget-object v0, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    sget-object v0, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    sget-object v0, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    const-class v0, Landroid/os/Binder;

    const-class v0, Landroid/os/Bundle;

    sget-object v0, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    sget-object v0, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    const-class v0, Ljava/lang/CharSequence;

    const-class v0, [Ljava/lang/CharSequence;

    const-class v0, Ljava/util/ArrayList;

    sget-object v0, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    const-class v0, Landroid/os/Parcelable;

    const-class v0, [Landroid/os/Parcelable;

    const-class v0, Ljava/io/Serializable;

    sget-object v0, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    const-class v0, Landroid/util/SparseArray;

    .line 2
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_2b

    const-class v0, Landroid/util/Size;

    goto :goto_2d

    :cond_2b
    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    .line 3
    :goto_2d
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v0, v1, :cond_34

    const-class v0, Landroid/util/SizeF;

    goto :goto_36

    :cond_34
    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    :goto_36
    return-void
.end method


# virtual methods
.method public a()Landroidx/savedstate/SavedStateRegistry$b;
    .registers 1

    const p0, 0x0

    throw p0
.end method
