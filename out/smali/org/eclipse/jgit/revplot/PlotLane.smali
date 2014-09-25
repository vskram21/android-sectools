.class public Lorg/eclipse/jgit/revplot/PlotLane;
.super Ljava/lang/Object;
.source "PlotLane.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field position:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getPosition()I
    .locals 1

    .prologue
    .line 64
    iget v0, p0, Lorg/eclipse/jgit/revplot/PlotLane;->position:I

    return v0
.end method
