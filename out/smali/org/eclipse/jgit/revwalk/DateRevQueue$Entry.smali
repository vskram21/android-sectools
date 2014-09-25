.class Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;
.super Ljava/lang/Object;
.source "DateRevQueue.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/revwalk/DateRevQueue;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Entry"
.end annotation


# instance fields
.field commit:Lorg/eclipse/jgit/revwalk/RevCommit;

.field next:Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 216
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
