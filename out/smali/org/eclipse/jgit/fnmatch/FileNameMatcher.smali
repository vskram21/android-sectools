.class public Lorg/eclipse/jgit/fnmatch/FileNameMatcher;
.super Ljava/lang/Object;
.source "FileNameMatcher.java"


# static fields
.field static final EMPTY_HEAD_LIST:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/fnmatch/Head;",
            ">;"
        }
    .end annotation
.end field

.field private static final characterClassStartPattern:Ljava/util/regex/Pattern;


# instance fields
.field private heads:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/fnmatch/Head;",
            ">;"
        }
    .end annotation
.end field

.field private headsStartValue:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/fnmatch/Head;",
            ">;"
        }
    .end annotation
.end field

.field private listForLocalUseage:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/fnmatch/Head;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 86
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    sput-object v0, Lorg/eclipse/jgit/fnmatch/FileNameMatcher;->EMPTY_HEAD_LIST:Ljava/util/List;

    .line 88
    const-string v0, "\\[[.:=]"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/eclipse/jgit/fnmatch/FileNameMatcher;->characterClassStartPattern:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Character;)V
    .locals 1
    .parameter "patternString"
    .parameter "invalidWildgetCharacter"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/InvalidPatternException;
        }
    .end annotation

    .prologue
    .line 140
    invoke-static {p1, p2}, Lorg/eclipse/jgit/fnmatch/FileNameMatcher;->createHeadsStartValues(Ljava/lang/String;Ljava/lang/Character;)Ljava/util/List;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/fnmatch/FileNameMatcher;-><init>(Ljava/util/List;)V

    .line 141
    return-void
.end method

.method private constructor <init>(Ljava/util/List;)V
    .locals 0
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/fnmatch/Head;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 109
    .local p1, headsStartValue:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/fnmatch/Head;>;"
    invoke-direct {p0, p1, p1}, Lorg/eclipse/jgit/fnmatch/FileNameMatcher;-><init>(Ljava/util/List;Ljava/util/List;)V

    .line 110
    return-void
.end method

.method private constructor <init>(Ljava/util/List;Ljava/util/List;)V
    .locals 2
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/fnmatch/Head;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/fnmatch/Head;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 121
    .local p1, headsStartValue:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/fnmatch/Head;>;"
    .local p2, heads:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/fnmatch/Head;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 122
    iput-object p1, p0, Lorg/eclipse/jgit/fnmatch/FileNameMatcher;->headsStartValue:Ljava/util/List;

    .line 123
    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lorg/eclipse/jgit/fnmatch/FileNameMatcher;->heads:Ljava/util/List;

    .line 124
    iget-object v0, p0, Lorg/eclipse/jgit/fnmatch/FileNameMatcher;->heads:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 125
    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lorg/eclipse/jgit/fnmatch/FileNameMatcher;->listForLocalUseage:Ljava/util/List;

    .line 126
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jgit/fnmatch/FileNameMatcher;)V
    .locals 2
    .parameter "other"

    .prologue
    .line 151
    iget-object v0, p1, Lorg/eclipse/jgit/fnmatch/FileNameMatcher;->headsStartValue:Ljava/util/List;

    iget-object v1, p1, Lorg/eclipse/jgit/fnmatch/FileNameMatcher;->heads:Ljava/util/List;

    invoke-direct {p0, v0, v1}, Lorg/eclipse/jgit/fnmatch/FileNameMatcher;-><init>(Ljava/util/List;Ljava/util/List;)V

    .line 152
    return-void
.end method

.method private static createHeadsStartValues(Ljava/lang/String;Ljava/lang/Character;)Ljava/util/List;
    .locals 6
    .parameter "patternString"
    .parameter "invalidWildgetCharacter"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Character;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/fnmatch/Head;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/InvalidPatternException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x2

    .line 158
    invoke-static {p0, p1}, Lorg/eclipse/jgit/fnmatch/FileNameMatcher;->parseHeads(Ljava/lang/String;Ljava/lang/Character;)Ljava/util/List;

    move-result-object v0

    .line 161
    .local v0, allHeads:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/fnmatch/AbstractHead;>;"
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 162
    .local v3, nextHeadsSuggestion:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/fnmatch/Head;>;"
    sget-object v4, Lorg/eclipse/jgit/fnmatch/LastHead;->INSTANCE:Lorg/eclipse/jgit/fnmatch/Head;

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 163
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v4

    add-int/lit8 v2, v4, -0x1

    .local v2, i:I
    :goto_0
    if-ltz v2, :cond_1

    .line 164
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/fnmatch/AbstractHead;

    .line 170
    .local v1, head:Lorg/eclipse/jgit/fnmatch/AbstractHead;
    invoke-virtual {v1}, Lorg/eclipse/jgit/fnmatch/AbstractHead;->isStar()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 171
    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 172
    invoke-virtual {v1, v3}, Lorg/eclipse/jgit/fnmatch/AbstractHead;->setNewHeads(Ljava/util/List;)V

    .line 163
    :goto_1
    add-int/lit8 v2, v2, -0x1

    goto :goto_0

    .line 174
    :cond_0
    invoke-virtual {v1, v3}, Lorg/eclipse/jgit/fnmatch/AbstractHead;->setNewHeads(Ljava/util/List;)V

    .line 175
    new-instance v3, Ljava/util/ArrayList;

    .end local v3           #nextHeadsSuggestion:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/fnmatch/Head;>;"
    invoke-direct {v3, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 176
    .restart local v3       #nextHeadsSuggestion:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/fnmatch/Head;>;"
    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 179
    .end local v1           #head:Lorg/eclipse/jgit/fnmatch/AbstractHead;
    :cond_1
    return-object v3
.end method

.method private static createSimpleHeads(Ljava/lang/String;Ljava/lang/Character;)Ljava/util/List;
    .locals 6
    .parameter "patternPart"
    .parameter "invalidWildgetCharacter"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Character;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/fnmatch/AbstractHead;",
            ">;"
        }
    .end annotation

    .prologue
    .line 265
    new-instance v3, Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    invoke-direct {v3, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 268
    .local v3, heads:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/fnmatch/AbstractHead;>;"
    const/4 v1, 0x0

    .line 269
    .local v1, escaped:Z
    const/4 v4, 0x0

    .local v4, i:I
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v4, v5, :cond_1

    .line 270
    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 271
    .local v0, c:C
    if-eqz v1, :cond_0

    .line 272
    new-instance v2, Lorg/eclipse/jgit/fnmatch/CharacterHead;

    invoke-direct {v2, v0}, Lorg/eclipse/jgit/fnmatch/CharacterHead;-><init>(C)V

    .line 273
    .local v2, head:Lorg/eclipse/jgit/fnmatch/CharacterHead;
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 274
    const/4 v1, 0x0

    .line 269
    .end local v2           #head:Lorg/eclipse/jgit/fnmatch/CharacterHead;
    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 276
    :cond_0
    sparse-switch v0, :sswitch_data_0

    .line 293
    new-instance v2, Lorg/eclipse/jgit/fnmatch/CharacterHead;

    invoke-direct {v2, v0}, Lorg/eclipse/jgit/fnmatch/CharacterHead;-><init>(C)V

    .line 294
    .restart local v2       #head:Lorg/eclipse/jgit/fnmatch/CharacterHead;
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 278
    .end local v2           #head:Lorg/eclipse/jgit/fnmatch/CharacterHead;
    :sswitch_0
    const/4 v5, 0x1

    invoke-static {p1, v5}, Lorg/eclipse/jgit/fnmatch/FileNameMatcher;->createWildCardHead(Ljava/lang/Character;Z)Lorg/eclipse/jgit/fnmatch/AbstractHead;

    move-result-object v2

    .line 280
    .local v2, head:Lorg/eclipse/jgit/fnmatch/AbstractHead;
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 284
    .end local v2           #head:Lorg/eclipse/jgit/fnmatch/AbstractHead;
    :sswitch_1
    const/4 v5, 0x0

    invoke-static {p1, v5}, Lorg/eclipse/jgit/fnmatch/FileNameMatcher;->createWildCardHead(Ljava/lang/Character;Z)Lorg/eclipse/jgit/fnmatch/AbstractHead;

    move-result-object v2

    .line 286
    .restart local v2       #head:Lorg/eclipse/jgit/fnmatch/AbstractHead;
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 290
    .end local v2           #head:Lorg/eclipse/jgit/fnmatch/AbstractHead;
    :sswitch_2
    const/4 v1, 0x1

    .line 291
    goto :goto_1

    .line 298
    .end local v0           #c:C
    :cond_1
    return-object v3

    .line 276
    :sswitch_data_0
    .sparse-switch
        0x2a -> :sswitch_0
        0x3f -> :sswitch_1
        0x5c -> :sswitch_2
    .end sparse-switch
.end method

.method private static createWildCardHead(Ljava/lang/Character;Z)Lorg/eclipse/jgit/fnmatch/AbstractHead;
    .locals 2
    .parameter "invalidWildgetCharacter"
    .parameter "star"

    .prologue
    .line 303
    if-eqz p0, :cond_0

    .line 304
    new-instance v0, Lorg/eclipse/jgit/fnmatch/RestrictedWildCardHead;

    invoke-virtual {p0}, Ljava/lang/Character;->charValue()C

    move-result v1

    invoke-direct {v0, v1, p1}, Lorg/eclipse/jgit/fnmatch/RestrictedWildCardHead;-><init>(CZ)V

    .line 307
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lorg/eclipse/jgit/fnmatch/WildCardHead;

    invoke-direct {v0, p1}, Lorg/eclipse/jgit/fnmatch/WildCardHead;-><init>(Z)V

    goto :goto_0
.end method

.method private extendStringToMatchByOneCharacter(C)V
    .locals 6
    .parameter "c"

    .prologue
    .line 311
    iget-object v4, p0, Lorg/eclipse/jgit/fnmatch/FileNameMatcher;->listForLocalUseage:Ljava/util/List;

    .line 312
    .local v4, newHeads:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/fnmatch/Head;>;"
    invoke-interface {v4}, Ljava/util/List;->clear()V

    .line 313
    const/4 v3, 0x0

    .line 314
    .local v3, lastAddedHeads:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/fnmatch/Head;>;"
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    iget-object v5, p0, Lorg/eclipse/jgit/fnmatch/FileNameMatcher;->heads:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-ge v2, v5, :cond_1

    .line 315
    iget-object v5, p0, Lorg/eclipse/jgit/fnmatch/FileNameMatcher;->heads:Ljava/util/List;

    invoke-interface {v5, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/fnmatch/Head;

    .line 316
    .local v0, head:Lorg/eclipse/jgit/fnmatch/Head;
    invoke-interface {v0, p1}, Lorg/eclipse/jgit/fnmatch/Head;->getNextHeads(C)Ljava/util/List;

    move-result-object v1

    .line 322
    .local v1, headsToAdd:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/fnmatch/Head;>;"
    if-eq v1, v3, :cond_0

    .line 323
    invoke-interface {v4, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 324
    move-object v3, v1

    .line 314
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 327
    .end local v0           #head:Lorg/eclipse/jgit/fnmatch/Head;
    .end local v1           #headsToAdd:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/fnmatch/Head;>;"
    :cond_1
    iget-object v5, p0, Lorg/eclipse/jgit/fnmatch/FileNameMatcher;->heads:Ljava/util/List;

    iput-object v5, p0, Lorg/eclipse/jgit/fnmatch/FileNameMatcher;->listForLocalUseage:Ljava/util/List;

    .line 328
    iput-object v4, p0, Lorg/eclipse/jgit/fnmatch/FileNameMatcher;->heads:Ljava/util/List;

    .line 329
    return-void
.end method

.method private static findGroupEnd(ILjava/lang/String;)I
    .locals 13
    .parameter "indexOfStartBracket"
    .parameter "pattern"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/InvalidPatternException;
        }
    .end annotation

    .prologue
    const/4 v12, -0x1

    .line 184
    add-int/lit8 v5, p0, 0x1

    .line 185
    .local v5, firstValidCharClassIndex:I
    add-int/lit8 v6, p0, 0x2

    .line 187
    .local v6, firstValidEndBracketIndex:I
    add-int/lit8 v10, p0, 0x1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v11

    if-lt v10, v11, :cond_0

    .line 188
    new-instance v10, Lorg/eclipse/jgit/errors/NoClosingBracketException;

    const-string v11, "["

    const-string v12, "]"

    invoke-direct {v10, p0, v11, v12, p1}, Lorg/eclipse/jgit/errors/NoClosingBracketException;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    throw v10

    .line 191
    :cond_0
    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v10

    const/16 v11, 0x21

    if-ne v10, v11, :cond_1

    .line 192
    add-int/lit8 v5, v5, 0x1

    .line 193
    add-int/lit8 v6, v6, 0x1

    .line 196
    :cond_1
    sget-object v10, Lorg/eclipse/jgit/fnmatch/FileNameMatcher;->characterClassStartPattern:Ljava/util/regex/Pattern;

    invoke-virtual {v10, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 199
    .local v0, charClassStartMatcher:Ljava/util/regex/Matcher;
    const/4 v8, -0x1

    .line 200
    .local v8, groupEnd:I
    :goto_0
    if-ne v8, v12, :cond_5

    .line 202
    const/16 v10, 0x5d

    invoke-static {p1, v10, v6}, Lorg/eclipse/jgit/fnmatch/FileNameMatcher;->indexOfUnescaped(Ljava/lang/String;CI)I

    move-result v9

    .line 204
    .local v9, possibleGroupEnd:I
    if-ne v9, v12, :cond_2

    .line 205
    new-instance v10, Lorg/eclipse/jgit/errors/NoClosingBracketException;

    const-string v11, "["

    const-string v12, "]"

    invoke-direct {v10, p0, v11, v12, p1}, Lorg/eclipse/jgit/errors/NoClosingBracketException;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    throw v10

    .line 208
    :cond_2
    invoke-virtual {v0, v5}, Ljava/util/regex/Matcher;->find(I)Z

    move-result v7

    .line 211
    .local v7, foundCharClass:Z
    if-eqz v7, :cond_4

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->start()I

    move-result v10

    if-ge v10, v9, :cond_4

    .line 214
    const/4 v10, 0x0

    invoke-virtual {v0, v10}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v3

    .line 215
    .local v3, classStart:Ljava/lang/String;
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v11, 0x1

    invoke-virtual {v3, v11}, Ljava/lang/String;->charAt(I)C

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "]"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 217
    .local v1, classEnd:Ljava/lang/String;
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->start()I

    move-result v4

    .line 218
    .local v4, classStartIndex:I
    add-int/lit8 v10, v4, 0x2

    invoke-virtual {p1, v1, v10}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v2

    .line 221
    .local v2, classEndIndex:I
    if-ne v2, v12, :cond_3

    .line 222
    new-instance v10, Lorg/eclipse/jgit/errors/NoClosingBracketException;

    invoke-direct {v10, v4, v3, v1, p1}, Lorg/eclipse/jgit/errors/NoClosingBracketException;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    throw v10

    .line 225
    :cond_3
    add-int/lit8 v5, v2, 0x2

    .line 226
    move v6, v5

    .line 227
    goto :goto_0

    .line 228
    .end local v1           #classEnd:Ljava/lang/String;
    .end local v2           #classEndIndex:I
    .end local v3           #classStart:Ljava/lang/String;
    .end local v4           #classStartIndex:I
    :cond_4
    move v8, v9

    goto :goto_0

    .line 231
    .end local v7           #foundCharClass:Z
    .end local v9           #possibleGroupEnd:I
    :cond_5
    return v8
.end method

.method private static indexOfUnescaped(Ljava/lang/String;CI)I
    .locals 3
    .parameter "searchString"
    .parameter "ch"
    .parameter "fromIndex"

    .prologue
    .line 333
    move v1, p2

    .local v1, i:I
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_2

    .line 334
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 335
    .local v0, current:C
    if-ne v0, p1, :cond_0

    .line 340
    .end local v0           #current:C
    .end local v1           #i:I
    :goto_1
    return v1

    .line 337
    .restart local v0       #current:C
    .restart local v1       #i:I
    :cond_0
    const/16 v2, 0x5c

    if-ne v0, v2, :cond_1

    .line 338
    add-int/lit8 v1, v1, 0x1

    .line 333
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 340
    .end local v0           #current:C
    :cond_2
    const/4 v1, -0x1

    goto :goto_1
.end method

.method private static parseHeads(Ljava/lang/String;Ljava/lang/Character;)Ljava/util/List;
    .locals 7
    .parameter "pattern"
    .parameter "invalidWildgetCharacter"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Character;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/fnmatch/AbstractHead;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/InvalidPatternException;
        }
    .end annotation

    .prologue
    .line 238
    const/4 v0, 0x0

    .line 239
    .local v0, currentIndex:I
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 240
    .local v4, heads:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/fnmatch/AbstractHead;>;"
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    if-ge v0, v6, :cond_1

    .line 241
    const/16 v6, 0x5b

    invoke-static {p0, v6, v0}, Lorg/eclipse/jgit/fnmatch/FileNameMatcher;->indexOfUnescaped(Ljava/lang/String;CI)I

    move-result v3

    .line 242
    .local v3, groupStart:I
    const/4 v6, -0x1

    if-ne v3, v6, :cond_0

    .line 243
    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    .line 244
    .local v5, patternPart:Ljava/lang/String;
    invoke-static {v5, p1}, Lorg/eclipse/jgit/fnmatch/FileNameMatcher;->createSimpleHeads(Ljava/lang/String;Ljava/lang/Character;)Ljava/util/List;

    move-result-object v6

    invoke-interface {v4, v6}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 246
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    .line 247
    goto :goto_0

    .line 248
    .end local v5           #patternPart:Ljava/lang/String;
    :cond_0
    invoke-virtual {p0, v0, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    .line 250
    .restart local v5       #patternPart:Ljava/lang/String;
    invoke-static {v5, p1}, Lorg/eclipse/jgit/fnmatch/FileNameMatcher;->createSimpleHeads(Ljava/lang/String;Ljava/lang/Character;)Ljava/util/List;

    move-result-object v6

    invoke-interface {v4, v6}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 253
    invoke-static {v3, p0}, Lorg/eclipse/jgit/fnmatch/FileNameMatcher;->findGroupEnd(ILjava/lang/String;)I

    move-result v1

    .line 254
    .local v1, groupEnd:I
    add-int/lit8 v6, v3, 0x1

    invoke-virtual {p0, v6, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 256
    .local v2, groupPart:Ljava/lang/String;
    new-instance v6, Lorg/eclipse/jgit/fnmatch/GroupHead;

    invoke-direct {v6, v2, p0}, Lorg/eclipse/jgit/fnmatch/GroupHead;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v4, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 257
    add-int/lit8 v0, v1, 0x1

    goto :goto_0

    .line 260
    .end local v1           #groupEnd:I
    .end local v2           #groupPart:Ljava/lang/String;
    .end local v3           #groupStart:I
    .end local v5           #patternPart:Ljava/lang/String;
    :cond_1
    return-object v4
.end method


# virtual methods
.method public append(Ljava/lang/String;)V
    .locals 3
    .parameter "stringToMatch"

    .prologue
    .line 350
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 351
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 352
    .local v0, c:C
    invoke-direct {p0, v0}, Lorg/eclipse/jgit/fnmatch/FileNameMatcher;->extendStringToMatchByOneCharacter(C)V

    .line 350
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 354
    .end local v0           #c:C
    :cond_0
    return-void
.end method

.method public canAppendMatch()Z
    .locals 3

    .prologue
    .line 398
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget-object v1, p0, Lorg/eclipse/jgit/fnmatch/FileNameMatcher;->heads:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 399
    iget-object v1, p0, Lorg/eclipse/jgit/fnmatch/FileNameMatcher;->heads:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    sget-object v2, Lorg/eclipse/jgit/fnmatch/LastHead;->INSTANCE:Lorg/eclipse/jgit/fnmatch/Head;

    if-eq v1, v2, :cond_0

    .line 400
    const/4 v1, 0x1

    .line 403
    :goto_1
    return v1

    .line 398
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 403
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public createMatcherForSuffix()Lorg/eclipse/jgit/fnmatch/FileNameMatcher;
    .locals 2

    .prologue
    .line 371
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lorg/eclipse/jgit/fnmatch/FileNameMatcher;->heads:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 372
    .local v0, copyOfHeads:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/fnmatch/Head;>;"
    iget-object v1, p0, Lorg/eclipse/jgit/fnmatch/FileNameMatcher;->heads:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 373
    new-instance v1, Lorg/eclipse/jgit/fnmatch/FileNameMatcher;

    invoke-direct {v1, v0}, Lorg/eclipse/jgit/fnmatch/FileNameMatcher;-><init>(Ljava/util/List;)V

    return-object v1
.end method

.method public isMatch()Z
    .locals 4

    .prologue
    .line 381
    iget-object v2, p0, Lorg/eclipse/jgit/fnmatch/FileNameMatcher;->heads:Ljava/util/List;

    iget-object v3, p0, Lorg/eclipse/jgit/fnmatch/FileNameMatcher;->heads:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    invoke-interface {v2, v3}, Ljava/util/List;->listIterator(I)Ljava/util/ListIterator;

    move-result-object v1

    .line 383
    .local v1, headIterator:Ljava/util/ListIterator;,"Ljava/util/ListIterator<Lorg/eclipse/jgit/fnmatch/Head;>;"
    :cond_0
    invoke-interface {v1}, Ljava/util/ListIterator;->hasPrevious()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 384
    invoke-interface {v1}, Ljava/util/ListIterator;->previous()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/fnmatch/Head;

    .line 385
    .local v0, head:Lorg/eclipse/jgit/fnmatch/Head;
    sget-object v2, Lorg/eclipse/jgit/fnmatch/LastHead;->INSTANCE:Lorg/eclipse/jgit/fnmatch/Head;

    if-ne v0, v2, :cond_0

    .line 386
    const/4 v2, 0x1

    .line 389
    .end local v0           #head:Lorg/eclipse/jgit/fnmatch/Head;
    :goto_0
    return v2

    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public reset()V
    .locals 2

    .prologue
    .line 360
    iget-object v0, p0, Lorg/eclipse/jgit/fnmatch/FileNameMatcher;->heads:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 361
    iget-object v0, p0, Lorg/eclipse/jgit/fnmatch/FileNameMatcher;->heads:Ljava/util/List;

    iget-object v1, p0, Lorg/eclipse/jgit/fnmatch/FileNameMatcher;->headsStartValue:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 362
    return-void
.end method
