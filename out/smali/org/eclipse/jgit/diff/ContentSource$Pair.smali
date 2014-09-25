.class public final Lorg/eclipse/jgit/diff/ContentSource$Pair;
.super Ljava/lang/Object;
.source "ContentSource.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/diff/ContentSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Pair"
.end annotation


# instance fields
.field private final newSource:Lorg/eclipse/jgit/diff/ContentSource;

.field private final oldSource:Lorg/eclipse/jgit/diff/ContentSource;


# direct methods
.method public constructor <init>(Lorg/eclipse/jgit/diff/ContentSource;Lorg/eclipse/jgit/diff/ContentSource;)V
    .locals 0
    .parameter "oldSource"
    .parameter "newSource"

    .prologue
    .line 230
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 231
    iput-object p1, p0, Lorg/eclipse/jgit/diff/ContentSource$Pair;->oldSource:Lorg/eclipse/jgit/diff/ContentSource;

    .line 232
    iput-object p2, p0, Lorg/eclipse/jgit/diff/ContentSource$Pair;->newSource:Lorg/eclipse/jgit/diff/ContentSource;

    .line 233
    return-void
.end method


# virtual methods
.method public open(Lorg/eclipse/jgit/diff/DiffEntry$Side;Lorg/eclipse/jgit/diff/DiffEntry;)Lorg/eclipse/jgit/lib/ObjectLoader;
    .locals 3
    .parameter "side"
    .parameter "ent"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 272
    sget-object v0, Lorg/eclipse/jgit/diff/ContentSource$1;->$SwitchMap$org$eclipse$jgit$diff$DiffEntry$Side:[I

    invoke-virtual {p1}, Lorg/eclipse/jgit/diff/DiffEntry$Side;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 278
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 274
    :pswitch_0
    iget-object v0, p0, Lorg/eclipse/jgit/diff/ContentSource$Pair;->oldSource:Lorg/eclipse/jgit/diff/ContentSource;

    iget-object v1, p2, Lorg/eclipse/jgit/diff/DiffEntry;->oldPath:Ljava/lang/String;

    iget-object v2, p2, Lorg/eclipse/jgit/diff/DiffEntry;->oldId:Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->toObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jgit/diff/ContentSource;->open(Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;)Lorg/eclipse/jgit/lib/ObjectLoader;

    move-result-object v0

    .line 276
    :goto_0
    return-object v0

    :pswitch_1
    iget-object v0, p0, Lorg/eclipse/jgit/diff/ContentSource$Pair;->newSource:Lorg/eclipse/jgit/diff/ContentSource;

    iget-object v1, p2, Lorg/eclipse/jgit/diff/DiffEntry;->newPath:Ljava/lang/String;

    iget-object v2, p2, Lorg/eclipse/jgit/diff/DiffEntry;->newId:Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->toObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jgit/diff/ContentSource;->open(Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;)Lorg/eclipse/jgit/lib/ObjectLoader;

    move-result-object v0

    goto :goto_0

    .line 272
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public size(Lorg/eclipse/jgit/diff/DiffEntry$Side;Lorg/eclipse/jgit/diff/DiffEntry;)J
    .locals 3
    .parameter "side"
    .parameter "ent"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 247
    sget-object v0, Lorg/eclipse/jgit/diff/ContentSource$1;->$SwitchMap$org$eclipse$jgit$diff$DiffEntry$Side:[I

    invoke-virtual {p1}, Lorg/eclipse/jgit/diff/DiffEntry$Side;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 253
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 249
    :pswitch_0
    iget-object v0, p0, Lorg/eclipse/jgit/diff/ContentSource$Pair;->oldSource:Lorg/eclipse/jgit/diff/ContentSource;

    iget-object v1, p2, Lorg/eclipse/jgit/diff/DiffEntry;->oldPath:Ljava/lang/String;

    iget-object v2, p2, Lorg/eclipse/jgit/diff/DiffEntry;->oldId:Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->toObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jgit/diff/ContentSource;->size(Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;)J

    move-result-wide v0

    .line 251
    :goto_0
    return-wide v0

    :pswitch_1
    iget-object v0, p0, Lorg/eclipse/jgit/diff/ContentSource$Pair;->newSource:Lorg/eclipse/jgit/diff/ContentSource;

    iget-object v1, p2, Lorg/eclipse/jgit/diff/DiffEntry;->newPath:Ljava/lang/String;

    iget-object v2, p2, Lorg/eclipse/jgit/diff/DiffEntry;->newId:Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->toObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jgit/diff/ContentSource;->size(Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;)J

    move-result-wide v0

    goto :goto_0

    .line 247
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
