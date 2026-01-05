class MemoryCard {
  final String content; 
  final int pairId;
  bool isFlipped;
  bool isMatched;

  MemoryCard({
    required this.content,
    required this.pairId,
    this.isFlipped = false,
    this.isMatched = false,
  });
}